import 'package:anystep/core/common/data/json_data.dart';

String? normalizeUsState(String? input) {
  if (input == null) return null;
  final trimmed = input.trim();
  if (trimmed.isEmpty) return null;

  final lettersOnly = trimmed.replaceAll(RegExp(r'[^A-Za-z]'), '');
  if (lettersOnly.length == 2) {
    final upper = lettersOnly.toUpperCase();
    return states.containsKey(upper) ? upper : null;
  }

  final normalizedInput = _normalizeAlpha(trimmed);
  for (final entry in states.entries) {
    if (_normalizeAlpha(entry.value) == normalizedInput) {
      return entry.key;
    }
  }
  return null;
}

bool isValidUsState(String? input) => normalizeUsState(input) != null;

String _normalizeAlpha(String value) => value.replaceAll(RegExp(r'[^A-Za-z]'), '').toLowerCase();
