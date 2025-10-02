// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_hours_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VolunteerHoursReport _$VolunteerHoursReportFromJson(
  Map<String, dynamic> json,
) => _VolunteerHoursReport(
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  totalHours: (json['totalHours'] as num).toDouble(),
  eventsCount: (json['eventsCount'] as num).toInt(),
  hoursPerMonth: (json['hoursPerMonth'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
);

Map<String, dynamic> _$VolunteerHoursReportToJson(
  _VolunteerHoursReport instance,
) => <String, dynamic>{
  'user': instance.user,
  'totalHours': instance.totalHours,
  'eventsCount': instance.eventsCount,
  'hoursPerMonth': instance.hoursPerMonth,
};
