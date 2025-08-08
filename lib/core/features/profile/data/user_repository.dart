import 'package:anystep/core/common/data/irepository.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/database/database.dart';
import 'package:anystep/database/filter.dart';
import 'package:anystep/env/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

class UserRepository implements IRepository<UserModel> {
  const UserRepository({required this.database, required this.collectionId});

  final Database database;
  final String collectionId;
  final String addressCollectionId = Env.addressCollectionId;

  @override
  Future<UserModel> createOrUpdate({required UserModel obj, String? documentId}) async {
    final data = obj.toJson();

    final address = obj.address;
    if (address != null) {
      try {
        final addressDoc = await database.list(
          table: addressCollectionId,
          filters: [
            AnyStepFilter.equals('street', address.street),
            AnyStepFilter.equals('street_secondary', address.streetSecondary),
            AnyStepFilter.equals('city', address.city),
            AnyStepFilter.equals('state', address.state),
            AnyStepFilter.equals('postal_code', address.postalCode),
            AnyStepFilter.equals('country', address.country),
          ],
        );
        data['address'] =
            addressDoc.isNotEmpty
                ? addressDoc.first["id"]
                : (await database.createOrUpdate(
                  table: addressCollectionId,
                  data: address.toJson(),
                )).first["id"];
      } catch (e) {
        Log.e("Error handling address", e);
      }
    }

    final document = await database.createOrUpdate(table: collectionId, data: data);
    return UserModel.fromJson(document.first);
  }

  @override
  Future<UserModel> get({required String documentId, bool withAddress = true}) async {
    final document = await database.get(
      table: collectionId,
      documentId: documentId,
      select: withAddress ? "*, address_model:addresses(*)" : null,
    );
    return UserModel.fromJson(document);
  }

  @override
  Future<List<UserModel>> list({
    List<AnyStepFilter>? filters,
    AnyStepOrder? order,
    int? limit,
    int? page,
    bool withAddress = true,
  }) async {
    final documents = await database.list(
      table: collectionId,
      filters: filters,
      limit: limit,
      page: page,
      select: withAddress ? "*, address_model:addresses(*)" : null,
    );
    return documents.map((doc) => UserModel.fromJson(doc)).toList();
  }
}

@riverpod
UserRepository userRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  final collectionId = Env.userCollectionId;
  return UserRepository(database: database, collectionId: collectionId);
}
