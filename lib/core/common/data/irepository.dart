import 'package:anystep/database/filter.dart';

abstract class IRepository<T> {
  Future<T> createOrUpdate({required T obj, String? documentId});

  Future<T> get({required String documentId});

  Future<List<T>> list({List<AnyStepFilter>? filters, int? limit, int? page, AnyStepOrder? order});

  Future<void> delete(T obj);
}
