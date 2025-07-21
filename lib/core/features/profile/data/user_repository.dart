import 'package:anystep/appwrite/database.dart';
import 'package:anystep/core/common/data/irepository.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/env/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

class UserRepository implements IRepository<UserModel> {
  const UserRepository({required this.database, required this.collectionId});

  final Database database;
  final String collectionId;

  @override
  Future<UserModel> createOrUpdate({required UserModel obj, String? documentId}) async {
    final document = await database.createOrUpdate(
      collectionId: collectionId,
      data: obj.toJson(),
      documentId: documentId,
    );
    return UserModel.fromJson(document.data);
  }

  @override
  Future<UserModel> get({required String documentId}) async {
    final document = await database.get(collectionId: collectionId, documentId: documentId);
    return UserModel.fromJson(document.data);
  }

  @override
  Future<List<UserModel>> list({List<String>? queries}) async {
    final documents = await database.list(collectionId: collectionId, queries: queries);
    return documents.map((doc) => UserModel.fromJson(doc.data)).toList();
  }
}

@riverpod
UserRepository userRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  final collectionId = Env.userCollectionId;
  return UserRepository(database: database, collectionId: collectionId);
}
