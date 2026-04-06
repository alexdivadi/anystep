String formatHours(double hours, {int maxDecimals = 2}) {
  if (!hours.isFinite) return '0';
  final fixed = hours.toStringAsFixed(maxDecimals);
  if (!fixed.contains('.')) return fixed;
  final trimmed = fixed.replaceFirst(RegExp(r'\.?0+$'), '');
  return trimmed.isEmpty ? '0' : trimmed;
}
