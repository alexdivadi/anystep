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
  Future<UserModel> createOrUpdate({required UserModel obj, String? documentId}) {
    // TODO: implement createOrUpdate
    throw UnimplementedError();
  }

  @override
  Future<UserModel> get({required String documentId}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> list({List<String>? queries}) {
    // TODO: implement list
    throw UnimplementedError();
  }
}

@riverpod
UserRepository userRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  final collectionId = Env.userCollectionId;
  return UserRepository(database: database, collectionId: collectionId);
}
