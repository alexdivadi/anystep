import 'package:anystep/appwrite/database.dart';
import 'package:anystep/core/common/data/irepository.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/env/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_repository.g.dart';

class EventRepository implements IRepository<EventModel> {
  const EventRepository({required this.database, required this.collectionId});

  final Database database;
  final String collectionId;

  @override
  Future<EventModel> createOrUpdate({required EventModel obj, String? documentId}) async {
    final document = await database.createOrUpdate(
      collectionId: collectionId,
      data: obj.toJson(),
      documentId: documentId,
    );
    return EventModel.fromJson(document.data);
  }

  @override
  Future<EventModel> get({required String documentId}) async {
    final document = await database.get(collectionId: collectionId, documentId: documentId);
    return EventModel.fromJson(document.data);
  }

  @override
  Future<List<EventModel>> list({List<String>? queries}) async {
    //TODO: offline-first structure; stream output; don't throw on Network Exception
    final documents = await database.list(collectionId: collectionId, queries: queries);
    return documents.map((doc) => EventModel.fromJson(doc.data)).toList();
  }
}

@riverpod
EventRepository eventRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  final collectionId = Env.eventCollectionId;
  return EventRepository(database: database, collectionId: collectionId);
}
