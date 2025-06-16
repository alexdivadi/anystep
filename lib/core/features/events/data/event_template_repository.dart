import 'package:anystep/appwrite/database.dart';
import 'package:anystep/core/common/data/irepository.dart';
import 'package:anystep/core/features/events/domain/event_template.dart';
import 'package:anystep/env/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_template_repository.g.dart';

class EventTemplateRepository implements IRepository<EventTemplateModel> {
  const EventTemplateRepository({required this.database, required this.collectionId});
  final Database database;
  final String collectionId;

  @override
  Future<EventTemplateModel> createOrUpdate({required EventTemplateModel obj, String? documentId}) {
    // TODO: implement createOrUpdate
    throw UnimplementedError();
  }

  @override
  Future<EventTemplateModel> get({required String documentId}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<EventTemplateModel>> list({List<String>? queries}) {
    // TODO: implement list
    throw UnimplementedError();
  }
}

@riverpod
EventTemplateRepository eventTemplateRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  final collectionId = Env.eventCollectionId;
  return EventTemplateRepository(database: database, collectionId: collectionId);
}
