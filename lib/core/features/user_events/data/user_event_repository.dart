import 'package:anystep/core/common/data/irepository.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/user_events/domain/user_event.dart';
import 'package:anystep/database/database.dart';
import 'package:anystep/database/filter.dart';
import 'package:anystep/database/pagination_result.dart';
import 'package:anystep/env/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_event_repository.g.dart';

class UserEventRepository implements IRepository<UserEventModel> {
  const UserEventRepository({
    required this.database,
    this.collectionId = Env.userEventCollectionId,
  });

  final Database database;
  final String collectionId;

  static const int pageSize = 25;

  @override
  Future<UserEventModel> createOrUpdate({required UserEventModel obj, String? documentId}) async {
    final data = obj.toJson();
    final document = await database.createOrUpdate(table: collectionId, data: data);
    return UserEventModel.fromJson(document.first);
  }

  @override
  Future<UserEventModel> get({
    required String documentId,
    bool withUsers = true,
    bool withEvents = true,
  }) async {
    String select = '*';
    if (withUsers) select += ', user_model:users(*)';
    if (withEvents) select += ', event_model:events(*)';
    final document = await database.get(
      table: collectionId,
      documentId: documentId,
      select: select,
    );
    return UserEventModel.fromJson(document);
  }

  @override
  Future<List<UserEventModel>> list({
    List<AnyStepFilter>? filters,
    int? limit,
    int? page,
    AnyStepOrder? order,
    bool withUsers = true,
    bool withEvents = true,
  }) async {
    String select = '*';
    if (withUsers) select += ', user_model:users(*)';
    if (withEvents) select += ', event_model:events(*)';
    final documents = await database.list(
      table: collectionId,
      select: select,
      filters: filters,
      limit: limit,
      page: page,
    );
    return documents.map((doc) => UserEventModel.fromJson(doc)).toList();
  }

  Future<PaginationResult<UserEventModel>> paginatedList({
    required int limit,
    List<AnyStepFilter>? filters,
    int? page,
    AnyStepOrder? order,
    bool withUsers = true,
    bool withEvents = true,
  }) async {
    //TODO: offline-first structure: stream output; don't throw on Network Exception
    String select = '*';
    if (withUsers) select += ', user_model:users(*)';
    if (withEvents) select += ', event_model:events(*)';
    final documents = await database.listWithCount(
      table: collectionId,
      select: select,
      filters: filters,
      limit: limit,
      order: order,
      page: page,
    );
    return PaginationResult.fromData(
      items: documents.data.map((doc) => UserEventModel.fromJson(doc)).toList(),
      count: documents.count,
      page: page ?? 0,
      limit: limit,
    );
  }

  @override
  Future<void> delete(UserEventModel obj) =>
      database.delete(table: collectionId, documentId: "${obj.id}");
}

@riverpod
UserEventRepository userEventRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return UserEventRepository(database: database);
}

@riverpod
Future<UserEventModel> getUserEvent(Ref ref, int id) async {
  final repository = ref.watch(userEventRepositoryProvider);
  return repository.get(documentId: "$id");
}

@riverpod
Future<PaginationResult<UserEventModel>> getUserEvents(
  Ref ref, {
  int? page,
  int? eventId,
  String? userId,
  List<AnyStepFilter>? filters,
  AnyStepOrder? order,
}) async {
  final repository = ref.watch(userEventRepositoryProvider);

  filters ??= [];
  if (eventId != null) {
    filters.add(AnyStepFilter.equals('event', eventId));
  }
  if (userId != null) {
    filters.add(AnyStepFilter.equals('user', userId));
  }
  return repository.paginatedList(
    limit: UserEventRepository.pageSize,
    filters: filters,
    page: page,
    order: order,
  );
}

@riverpod
Future<PaginationResult<UserEventModel>> getCurrentUserEvents(
  Ref ref, {
  int? page,
  int? eventId,
  List<AnyStepFilter>? filters,
  AnyStepOrder? order,
}) async {
  final userId = ref.watch(authStateStreamProvider).requireValue!.uid;
  return ref.watch(
    getUserEventsProvider(
      filters: filters,
      page: page,
      order: order,
      eventId: eventId,
      userId: userId,
    ).future,
  );
}
