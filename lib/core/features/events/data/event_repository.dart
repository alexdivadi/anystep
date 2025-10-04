import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/database/database.dart';
import 'package:anystep/database/filter.dart';
import 'package:anystep/core/common/data/irepository.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/database/pagination_result.dart';
import 'package:anystep/env/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_repository.g.dart';

class EventRepository implements IRepository<EventModel> {
  const EventRepository({
    required this.database,
    this.collectionId = Env.eventCollectionId,
    this.addressCollectionId = Env.addressCollectionId,
  });

  final Database database;
  final String collectionId;
  final String addressCollectionId;

  static const int pageSize = 25;

  @override
  Future<EventModel> createOrUpdate({required EventModel obj, String? documentId}) async {
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
    return EventModel.fromJson(document.first);
  }

  @override
  Future<EventModel> get({required String documentId, bool withAddress = true}) async {
    final document = await database.get(
      table: collectionId,
      documentId: documentId,
      select: withAddress ? "*, address_model:addresses(*)" : null,
    );
    return EventModel.fromJson(document);
  }

  @override
  Future<List<EventModel>> list({
    List<AnyStepFilter>? filters,
    int? limit,
    int? page,
    AnyStepOrder? order,
    bool withRelatedModels = true,
  }) async {
    final documents = await database.list(
      table: collectionId,
      select: withRelatedModels ? "*, address_model:addresses(*)" : null,
      filters: filters,
      limit: limit,
      page: page,
    );
    return documents.map((doc) => EventModel.fromJson(doc)).toList();
  }

  Future<PaginationResult<EventModel>> paginatedList({
    required int limit,
    List<AnyStepFilter>? filters,
    int? page,
    AnyStepOrder? order,
    bool withAddress = true,
  }) async {
    //TODO: offline-first structure: stream output; don't throw on Network Exception
    final documents = await database.listWithCount(
      table: collectionId,
      select: withAddress ? "*, address_model:addresses(*)" : null,
      filters: filters,
      limit: limit,
      order: order,
      page: page,
    );
    return PaginationResult.fromData(
      items: documents.data.map((doc) => EventModel.fromJson(doc)).toList(),
      count: documents.count,
      page: page ?? 0,
      limit: limit,
    );
  }

  @override
  Future<void> delete(EventModel obj) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}

@riverpod
EventRepository eventRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return EventRepository(database: database);
}

@riverpod
Future<EventModel> getEvent(Ref ref, int id, {bool withAddress = true}) async {
  final repository = ref.watch(eventRepositoryProvider);
  return repository.get(documentId: "$id", withAddress: withAddress);
}

@riverpod
Future<PaginationResult<EventModel>> getEvents(
  Ref ref, {
  int? page,
  String? search,
  List<AnyStepFilter>? filters,
  AnyStepOrder? order,
}) async {
  final repository = ref.watch(eventRepositoryProvider);

  filters ??= [];
  if (search != null && search.isNotEmpty) {
    filters.add(AnyStepFilter.like('name', "%$search%"));
  }
  return repository.paginatedList(
    limit: EventRepository.pageSize,
    filters: filters,
    page: page,
    order: order ?? AnyStepOrder.asc('start_time'),
  );
}

@riverpod
Future<PaginationResult<EventModel>> getUpcomingEvents(
  Ref ref, {
  int? page,
  String? search,
  List<AnyStepFilter>? filters,
  AnyStepOrder? order,
}) async {
  filters ??= [];
  filters.add(AnyStepFilter.greaterThan('start_time', DateTime.now().toUtc()));
  return await ref.watch(
    getEventsProvider(
      page: page,
      filters: filters,
      search: search,
      order: AnyStepOrder.asc('start_time'),
    ).future,
  );
}

@riverpod
Future<PaginationResult<EventModel>> getPastEvents(
  Ref ref, {
  int? page,
  String? search,
  List<AnyStepFilter>? filters,
  AnyStepOrder? order,
}) async {
  filters ??= [];
  filters.add(AnyStepFilter.lessThan('start_time', DateTime.now().toUtc()));
  return await ref.watch(
    getEventsProvider(
      page: page,
      filters: filters,
      search: search,
      order: AnyStepOrder.desc('start_time'),
    ).future,
  );
}
