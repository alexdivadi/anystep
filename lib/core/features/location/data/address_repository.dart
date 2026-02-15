import 'package:anystep/database/database.dart';
import 'package:anystep/database/filter.dart';
import 'package:anystep/core/common/data/irepository.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/features/location/domain/address_model.dart';
import 'package:anystep/env/env.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'address_repository.g.dart';

class AddressRepository implements IRepository<AddressModel> {
  const AddressRepository({required this.database, required this.collectionId});
  final Database database;
  final String collectionId;

  Future<List<AddressModel>> search({
    required String query,
    bool includeEventAddresses = true,
    bool includeUserAddresses = true,
    int limit = 6,
  }) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return [];
    if (!includeEventAddresses && !includeUserAddresses) return [];

    final baseFilters = <AnyStepFilter>[];
    if (includeEventAddresses != includeUserAddresses) {
      baseFilters.add(AnyStepFilter.equals('is_user_address', includeUserAddresses));
    }

    final results = <String, AddressModel>{};
    final searchColumns = ['street', 'street_secondary', 'city', 'state', 'postal_code', 'name'];
    final likeValue = "%$trimmed%";

    for (final column in searchColumns) {
      final filters = [...baseFilters, AnyStepFilter.like(column, likeValue)];
      final documents = await database.list(table: collectionId, filters: filters, limit: limit);
      for (final doc in documents) {
        final model = AddressModel.fromJson(doc);
        final key = model.id?.toString() ?? model.formattedAddress;
        results.putIfAbsent(key, () => model);
        if (results.length >= limit) break;
      }
      if (results.length >= limit) break;
    }

    return results.values.take(limit).toList();
  }

  @override
  Future<AddressModel> createOrUpdate({required AddressModel obj, String? documentId}) async {
    final normalized = _normalizeAddress(obj);
    if (documentId != null && documentId.toString().isNotEmpty) {
      final data = normalized.toJson()..['id'] = documentId;
      final updated = await database.createOrUpdate(table: collectionId, data: data);
      return AddressModel.fromJson(updated.first);
    }
    List<Map<String, dynamic>> matches = [];

    if (normalized.placeId != null && normalized.placeId!.trim().isNotEmpty) {
      matches = await database.list(
        table: collectionId,
        filters: [
          AnyStepFilter.equals('place_id', normalized.placeId),
          AnyStepFilter.equals('is_user_address', normalized.isUserAddress),
        ],
        limit: 1,
      );
    }

    if (matches.isEmpty) {
      matches = await database.list(
        table: collectionId,
        filters: [
          AnyStepFilter.like('street', normalized.street),
          AnyStepFilter.like('street_secondary', normalized.streetSecondary),
          AnyStepFilter.like('city', normalized.city),
          AnyStepFilter.like('state', normalized.state),
          AnyStepFilter.equals('postal_code', normalized.postalCode),
          AnyStepFilter.equals('country', normalized.country),
          AnyStepFilter.equals('is_user_address', normalized.isUserAddress),
        ],
        limit: 1,
      );
    }

    if (matches.isNotEmpty) {
      final existing = AddressModel.fromJson(matches.first);
      final merged = _mergeAddress(existing, normalized);
      final data = merged.toJson()..['id'] = existing.id;
      final updated = await database.createOrUpdate(table: collectionId, data: data);
      return AddressModel.fromJson(updated.first);
    }

    Log.w('Creating new address record', normalized.toJson());
    final created = await database.createOrUpdate(table: collectionId, data: normalized.toJson());
    return AddressModel.fromJson(created.first);
  }

  @override
  Future<AddressModel> get({required String documentId}) async {
    final document = await database.get(table: collectionId, documentId: documentId);
    return AddressModel.fromJson(document);
  }

  @override
  Future<List<AddressModel>> list({
    List<AnyStepFilter>? filters,
    AnyStepOrder? order,
    int? limit,
    int? page,
  }) async {
    final documents = await database.list(
      table: collectionId,
      filters: filters,
      order: order,
      limit: limit,
      page: page,
    );
    return documents.map((doc) => AddressModel.fromJson(doc)).toList();
  }

  @override
  Future<void> delete(AddressModel obj) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}

String _collapseWhitespace(String value) {
  return value.trim().replaceAll(RegExp(r'\s+'), ' ');
}

AddressModel _normalizeAddress(AddressModel address) {
  final street = _collapseWhitespace(address.street);
  final streetSecondary = address.streetSecondary == null || address.streetSecondary!.trim().isEmpty
      ? null
      : _collapseWhitespace(address.streetSecondary!);
  final city = _collapseWhitespace(address.city);
  final state = _collapseWhitespace(address.state).toUpperCase();
  final postalCode = _collapseWhitespace(address.postalCode);
  final country = (address.country == null || address.country!.trim().isEmpty)
      ? 'US'
      : _collapseWhitespace(address.country!).toUpperCase();
  return address.copyWith(
    street: street,
    streetSecondary: streetSecondary,
    city: city,
    state: state,
    postalCode: postalCode,
    country: country,
  );
}

AddressModel _mergeAddress(AddressModel existing, AddressModel incoming) {
  return existing.copyWith(
    latitude: existing.latitude ?? incoming.latitude,
    longitude: existing.longitude ?? incoming.longitude,
    placeId: existing.placeId ?? incoming.placeId,
    name: existing.name ?? incoming.name,
    geohash: existing.geohash ?? incoming.geohash,
  );
}

@riverpod
AddressRepository addressRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  final collectionId = Env.addressCollectionId;
  return AddressRepository(database: database, collectionId: collectionId);
}
