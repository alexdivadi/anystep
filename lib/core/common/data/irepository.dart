abstract class IRepository<T> {
  Future<T> createOrUpdate({required T obj, String? documentId});

  Future<T> get({required String documentId});

  Future<List<T>> list({List<String>? queries});
}
