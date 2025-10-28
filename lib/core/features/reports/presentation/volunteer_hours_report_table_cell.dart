import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/features/profile/presentation/profile/profile_image.dart';
import 'package:anystep/core/features/reports/domain/volunteer_hours_report.dart';
import 'package:flutter/material.dart';

class VolunteerHoursReportTableCell extends StatelessWidget {
  const VolunteerHoursReportTableCell({super.key, required this.volunteerHoursReport});

  final VolunteerHoursReport volunteerHoursReport;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final address = volunteerHoursReport.user.address?.formattedAddress;
    final phone = volunteerHoursReport.user.phoneNumber;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: AnyStepSpacing.sm4),
      child: ListTile(
        title: Row(
          children: [
            ProfileImage(user: volunteerHoursReport.user, size: AnyStepSpacing.md12),
            const SizedBox(width: AnyStepSpacing.sm8),
            Text(
              volunteerHoursReport.user.fullName,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: AnyStepSpacing.sm4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (address != null && address.isNotEmpty)
                Text(
                  address,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: AnyStepSpacing.sm10),
                ),
              Row(
                children: [
                  Icon(
                    Icons.email,
                    size: AnyStepSpacing.sm10,
                    color: theme.colorScheme.secondaryFixed,
                  ),
                  const SizedBox(width: AnyStepSpacing.sm4),
                  Text(
                    volunteerHoursReport.user.email,
                    style: TextStyle(
                      color: theme.colorScheme.secondaryFixed,
                      fontSize: AnyStepSpacing.sm10,
                    ),
                  ),
                ],
              ),
              if (phone != null && phone.isNotEmpty)
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: AnyStepSpacing.sm10,
                      color: theme.colorScheme.secondaryFixed,
                    ),
                    const SizedBox(width: AnyStepSpacing.sm4),
                    Text(
                      phone,
                      style: TextStyle(
                        color: theme.colorScheme.secondaryFixed,
                        fontSize: AnyStepSpacing.sm10,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${volunteerHoursReport.eventsCount} event(s)',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text('${volunteerHoursReport.totalHours.toStringAsFixed(2)} hr(s)'),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
