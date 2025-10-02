import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';

part 'volunteer_hours_report.freezed.dart';
part 'volunteer_hours_report.g.dart';

/// Aggregated volunteer hour results for a single user in a date range.
@freezed
abstract class VolunteerHoursReport with _$VolunteerHoursReport {
  const factory VolunteerHoursReport({
    required UserModel user,

    /// Total hours in the range after applying per-event/day cap.
    required double totalHours,

    /// Count of distinct events (user events) included.
    required int eventsCount,

    /// Hours bucketed by year-month (e.g. '2025-10' -> 12.5)
    required Map<String, double> hoursPerMonth,
  }) = _VolunteerHoursReport;

  factory VolunteerHoursReport.fromJson(Map<String, dynamic> json) =>
      _$VolunteerHoursReportFromJson(json);
}
