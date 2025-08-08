class AnyStepFilter<T> {
  final String column;
  final String operator;
  final T value;

  AnyStepFilter({required this.column, required this.operator, required this.value});

  factory AnyStepFilter.equals(String column, T value) {
    return AnyStepFilter(column: column, operator: 'eq', value: value);
  }
  factory AnyStepFilter.notEquals(String column, T value) {
    return AnyStepFilter(column: column, operator: 'neq', value: value);
  }
  factory AnyStepFilter.greaterThan(String column, T value) {
    return AnyStepFilter(column: column, operator: 'gt', value: value);
  }
  factory AnyStepFilter.lessThan(String column, T value) {
    return AnyStepFilter(column: column, operator: 'lt', value: value);
  }
  factory AnyStepFilter.contains(String column, T value) {
    return AnyStepFilter(column: column, operator: 'cs', value: value);
  }
}

class AnyStepOrder {
  final String column;
  final bool ascending;

  AnyStepOrder({required this.column, this.ascending = true});

  factory AnyStepOrder.asc(String column) {
    return AnyStepOrder(column: column, ascending: true);
  }
  factory AnyStepOrder.desc(String column) {
    return AnyStepOrder(column: column, ascending: false);
  }
}
