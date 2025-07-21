import 'package:anystep/appwrite/appwrite_client.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/env/env.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' hide Log;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

class Database {
  const Database({required Databases databases, required String databasesId})
    : _databases = databases,
      _databaseId = databasesId;

  final Databases _databases;
  final String _databaseId;

  Future<Document> createOrUpdate({
    required String collectionId,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    try {
      return await _databases.upsertDocument(
        databaseId: _databaseId,
        collectionId: collectionId,
        documentId: documentId ?? ID.unique(),
        data: data,
      );
    } catch (e) {
      Log.e("Error creating or updating document", e);
      rethrow;
    }
  }

  Future<Document> get({required String collectionId, required String documentId}) async {
    try {
      return await _databases.getDocument(
        databaseId: _databaseId,
        collectionId: collectionId,
        documentId: documentId,
      );
    } catch (e) {
      Log.e("Error retrieving document", e);
      rethrow;
    }
  }

  Future<List<Document>> list({required String collectionId, List<String>? queries}) async {
    try {
      final response = await _databases.listDocuments(
        databaseId: _databaseId,
        collectionId: collectionId,
        queries: queries,
      );
      return response.documents;
    } catch (e) {
      Log.e("Error listing documents", e);
      rethrow;
    }
  }
}

@riverpod
Database database(Ref ref) {
  final databases = Databases(ref.watch(appwriteClientProvider));
  final databasesId = Env.appwriteDatabaseId;
  return Database(databases: databases, databasesId: databasesId);
}
