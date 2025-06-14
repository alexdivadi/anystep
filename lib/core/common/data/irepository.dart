abstract class IRepository<T> {
  Future<T> createOrUpdate({required Map<String, dynamic> data, String? documentId});

  Future<T> get({required String documentId});

  Future<List<T>> list({List<String>? queries});
}
