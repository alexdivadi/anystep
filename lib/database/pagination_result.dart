class PaginationResult<T> {
  final List<T> items;
  final int totalCount;
  final int currentPage;
  final int totalPages;

  PaginationResult({
    required this.items,
    required this.totalCount,
    required this.currentPage,
    required this.totalPages,
  });

  factory PaginationResult.fromData({
    required List<T> items,
    required int count,
    required int page,
    required int limit,
  }) {
    return PaginationResult(
      items: items,
      totalCount: count,
      currentPage: page,
      totalPages: (count / limit).ceil(),
    );
  }
}
