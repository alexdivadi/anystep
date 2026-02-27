import 'package:anystep/core/common/data/irepository.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/database/database.dart';
import 'package:anystep/database/filter.dart';
import 'package:anystep/database/pagination_result.dart';
import 'package:anystep/env/env.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_repository.g.dart';

class UserRepository implements IRepository<UserModel> {
  const UserRepository({required this.database, required this.collectionId});

  static const int pageSize = 25;

  final Database database;
  final String collectionId;

  @override
  Future<UserModel> createOrUpdate({required UserModel obj, String? documentId}) async {
    final data = obj.toJson();

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
    bool withRelatedModels = true,
  }) async {
    final documents = await database.list(
      table: collectionId,
      filters: filters,
      limit: limit,
      page: page,
      select: withRelatedModels ? "*, address_model:addresses(*)" : null,
    );
    return documents.map((doc) => UserModel.fromJson(doc)).toList();
  }

  Future<PaginationResult<UserModel>> paginatedList({
    required int limit,
    List<AnyStepFilter>? filters,
    int? page,
    AnyStepOrder? order,
    bool withAddress = true,
  }) async {
    final documents = await database.listWithCount(
      table: collectionId,
      select: withAddress ? "*, address_model:addresses(*)" : null,
      filters: filters,
      limit: limit,
      order: order,
      page: page,
    );
    return PaginationResult.fromData(
      items: documents.data.map((doc) => UserModel.fromJson(doc)).toList(),
      count: documents.count,
      page: page ?? 0,
      limit: limit,
    );
  }

  Future<UserModel?> findByAuthId({required String authId, bool withAddress = true}) async {
    final documents = await database.list(
      table: collectionId,
      select: withAddress ? "*, address_model:addresses(*)" : null,
      filters: [AnyStepFilter.equals('auth_id', authId)],
      limit: 1,
    );
    if (documents.isEmpty) return null;
    return UserModel.fromJson(documents.first);
  }

  Future<UserModel?> findByEmail({required String email, bool withAddress = true}) async {
    final documents = await database.list(
      table: collectionId,
      select: withAddress ? "*, address_model:addresses(*)" : null,
      filters: [AnyStepFilter.equals('email', email.toLowerCase())],
      limit: 1,
    );
    if (documents.isEmpty) return null;
    return UserModel.fromJson(documents.first);
  }

  Future<UserModel?> linkAuthUserByEmail({
    required String authUserId,
    required String email,
  }) async {
    if (authUserId.trim().isEmpty) return null;
    if (email.trim().isEmpty) return null;
    final existing = await findByEmail(email: email);
    if (existing == null) return null;
    if (existing.authId == authUserId) return existing;
    final linked = existing.copyWith(authId: authUserId, email: email.toLowerCase());
    return createOrUpdate(obj: linked, documentId: existing.id);
  }

  @override
  Future<void> delete(UserModel obj) {
    return database.delete(table: collectionId, documentId: obj.id);
  }
}

@riverpod
UserRepository userRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  final collectionId = Env.userCollectionId;
  return UserRepository(database: database, collectionId: collectionId);
}

@riverpod
Future<PaginationResult<UserModel>> getUsers(
  Ref ref, {
  int? page,
  String? search,
  List<AnyStepFilter>? filters,
  AnyStepOrder? order,
}) async {
  final repository = ref.watch(userRepositoryProvider);

  filters ??= [];
  if (search != null && search.isNotEmpty) {
    filters.add(AnyStepFilter.like('first_name', "%$search%"));
  }
  return repository.paginatedList(
    limit: UserRepository.pageSize,
    filters: filters,
    page: page,
    order: order ?? AnyStepOrder.asc('first_name'),
  );
}
