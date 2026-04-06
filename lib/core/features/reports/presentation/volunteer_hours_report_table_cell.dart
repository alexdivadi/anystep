import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/any_step_badge.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:anystep/core/features/profile/domain/age_group.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/core/features/profile/presentation/profile/profile_image.dart';
import 'package:anystep/core/features/reports/domain/volunteer_hours_report.dart';
import 'package:flutter/material.dart';

class VolunteerHoursReportTableCell extends StatelessWidget {
  const VolunteerHoursReportTableCell({super.key, required this.volunteerHoursReport, this.onTap});

  final VolunteerHoursReport volunteerHoursReport;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final address = volunteerHoursReport.user.address?.formattedAddress;
    final phone = volunteerHoursReport.user.phoneNumber;
    final hasEmail = volunteerHoursReport.user.canReceiveEmail;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: AnyStepSpacing.sm4),
      child: ListTile(
        onTap: onTap,
        title: Row(
          children: [
            ProfileImage(user: volunteerHoursReport.user, size: AnyStepSpacing.md12),
            const SizedBox(width: AnyStepSpacing.sm8),
            Expanded(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: AnyStepSpacing.sm4,
                runSpacing: AnyStepSpacing.sm2,
                children: [
                  Text(
                    volunteerHoursReport.user.fullName,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  AnyStepBadge(
                    color: switch (volunteerHoursReport.user.role) {
                      UserRole.admin => theme.colorScheme.tertiary,
                      UserRole.board => theme.colorScheme.secondary,
                      UserRole.volunteer => theme.colorScheme.primary,
                    },
                    padding: const EdgeInsets.symmetric(
                      vertical: AnyStepSpacing.sm2,
                      horizontal: AnyStepSpacing.sm6,
                    ),
                    borderRadius: BorderRadius.circular(AnyStepSpacing.sm6),
                    child: Text(
                      volunteerHoursReport.user.role.displayName,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSecondary,
                            fontSize: 10,
                          ),
                    ),
                  ),
                  if (volunteerHoursReport.user.ageGroup == AgeGroup.under18)
                    AnyStepBadge(
                      color: AnyStepColors.warning,
                      padding: const EdgeInsets.symmetric(
                        vertical: AnyStepSpacing.sm2,
                        horizontal: AnyStepSpacing.sm6,
                      ),
                      borderRadius: BorderRadius.circular(AnyStepSpacing.sm6),
                      child: Text(
                        'Under 18',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AnyStepColors.black,
                              fontSize: 10,
                            ),
                      ),
                    ),
                ],
              ),
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
                    color: hasEmail
                        ? theme.colorScheme.secondaryFixed
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: AnyStepSpacing.sm4),
                  Text(
                    hasEmail ? volunteerHoursReport.user.email : 'No email on file',
                    style: TextStyle(
                      color: hasEmail
                          ? theme.colorScheme.secondaryFixed
                          : theme.colorScheme.onSurfaceVariant,
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
