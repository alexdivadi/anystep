import 'package:flutter/material.dart';

extension SameDayExtension on DateTime {
  bool isSameDay(DateTime other) {
    return DateUtils.isSameDay(this, other);
  }
}
