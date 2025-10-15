class AnyStepFilter<T> {
  final String column;
  final String operator;
  final T value;

  const AnyStepFilter({required this.column, required this.operator, required this.value});

  factory AnyStepFilter.equals(String column, T value) =>
      AnyStepFilter(column: column, operator: 'eq', value: value);
  factory AnyStepFilter.notEquals(String column, T value) =>
      AnyStepFilter(column: column, operator: 'neq', value: value);
  factory AnyStepFilter.greaterThan(String column, T value, {bool inclusive = false}) =>
      AnyStepFilter(column: column, operator: inclusive ? 'gte' : 'gt', value: value);
  factory AnyStepFilter.lessThan(String column, T value, {bool inclusive = false}) =>
      AnyStepFilter(column: column, operator: inclusive ? 'lte' : 'lt', value: value);
  factory AnyStepFilter.like(String column, T value, {bool caseSensitive = false}) =>
      AnyStepFilter(column: column, operator: caseSensitive ? 'like' : 'ilike', value: value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AnyStepFilter<T> &&
        other.column == column &&
        other.operator == operator &&
        other.value == value;
  }

  @override
  int get hashCode => Object.hash(column, operator, value);

  @override
  String toString() => 'AnyStepFilter(column: $column, op: $operator, value: $value)';
}

class AnyStepOrder {
  final String column;
  final bool ascending;

  const AnyStepOrder({required this.column, this.ascending = true});

  factory AnyStepOrder.asc(String column) => AnyStepOrder(column: column, ascending: true);
  factory AnyStepOrder.desc(String column) => AnyStepOrder(column: column, ascending: false);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AnyStepOrder && other.column == column && other.ascending == ascending;
  }

  @override
  int get hashCode => Object.hash(column, ascending);

  @override
  String toString() => 'AnyStepOrder(column: $column, ascending: $ascending)';
}
