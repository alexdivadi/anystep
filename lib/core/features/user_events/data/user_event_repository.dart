import 'package:anystep/core/common/data/irepository.dart';
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
  Future<UserEventModel> get({required String documentId, bool withRelatedModels = true}) async {
    final document = await database.get(
      table: collectionId,
      documentId: documentId,
      select: withRelatedModels ? "*, event_model:events(*), user_model:users(*)" : null,
    );
    return UserEventModel.fromJson(document);
  }

  @override
  Future<List<UserEventModel>> list({
    List<AnyStepFilter>? filters,
    int? limit,
    int? page,
    AnyStepOrder? order,
    bool withRelatedModels = true,
  }) async {
    final documents = await database.list(
      table: collectionId,
      select: withRelatedModels ? "*, event_model:events(*), user_model:users(*)" : null,
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
      items: documents.data.map((doc) => UserEventModel.fromJson(doc)).toList(),
      count: documents.count,
      page: page ?? 0,
      limit: limit,
    );
  }
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
  String? search,
  List<AnyStepFilter>? filters,
  AnyStepOrder? order,
}) async {
  final repository = ref.watch(userEventRepositoryProvider);

  filters ??= [];
  if (search != null && search.isNotEmpty) {
    filters.add(AnyStepFilter.contains('id', search));
  }
  return repository.paginatedList(
    limit: UserEventRepository.pageSize,
    filters: filters,
    page: page,
    order: order,
  );
}
