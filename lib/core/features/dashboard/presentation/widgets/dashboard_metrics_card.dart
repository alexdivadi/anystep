import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/any_step_loading_indicator.dart';
import 'package:anystep/core/features/reports/data/volunteer_hours_providers.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DashboardMetricsCard extends StatelessWidget {
  const DashboardMetricsCard({
    super.key,
    required this.title,
    required this.monthSummary,
    required this.ytdSummary,
    required this.monthlySeries,
    required this.showVolunteers,
  });

  final String title;
  final AsyncValue<VolunteerHoursSummary> monthSummary;
  final AsyncValue<VolunteerHoursSummary> ytdSummary;
  final AsyncValue<List<MonthlyHoursPoint>> monthlySeries;
  final bool showVolunteers;

  Widget _summaryValue(
    BuildContext context,
    AsyncValue<VolunteerHoursSummary> summary,
    String Function(VolunteerHoursSummary) builder,
  ) {
    return summary.when(
      loading: () =>
          const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2)),
      error: (e, st) => const Text('—'),
      data: (data) => Text(builder(data)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;
    final pillHeight = 82.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AnyStepSpacing.md16),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AnyStepSpacing.md16)),
        child: Padding(
          padding: const EdgeInsets.all(AnyStepSpacing.md16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: AnyStepSpacing.sm10,
                    height: AnyStepSpacing.sm10,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(AnyStepSpacing.sm4),
                    ),
                  ),
                  const SizedBox(width: AnyStepSpacing.sm8),
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AnyStepSpacing.md12),
              _MetricsHeroRow(monthSummary: monthSummary, ytdSummary: ytdSummary),
              const SizedBox(height: AnyStepSpacing.md16),
              _MonthlyHoursChart(
                series: monthlySeries,
                label: loc.dashboardHoursYtd,
                foreground: onSurface,
              ),
              const SizedBox(height: AnyStepSpacing.md12),
              LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth;
                  final spacing = AnyStepSpacing.md12;
                  final columns = maxWidth >= 720 ? 3 : 2;
                  final itemWidth =
                      (maxWidth - (columns - 1) * spacing).clamp(160, double.infinity) / columns;
                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: [
                      SizedBox(
                        width: itemWidth,
                        height: pillHeight,
                        child: _MetricPill(
                          label: loc.dashboardEventsThisMonth,
                          value: _summaryValue(
                            context,
                            monthSummary,
                            (s) => s.eventsCount.toString(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: itemWidth,
                        height: pillHeight,
                        child: _MetricPill(
                          label: loc.dashboardEventsYtd,
                          value: _summaryValue(
                            context,
                            ytdSummary,
                            (s) => s.eventsCount.toString(),
                          ),
                        ),
                      ),
                      if (showVolunteers)
                        SizedBox(
                          width: itemWidth,
                          height: pillHeight,
                          child: _MetricPill(
                            label: loc.dashboardVolunteersThisMonth,
                            value: _summaryValue(
                              context,
                              monthSummary,
                              (s) => s.uniqueVolunteers.toString(),
                            ),
                          ),
                        ),
                      if (showVolunteers)
                        SizedBox(
                          width: itemWidth,
                          height: pillHeight,
                          child: _MetricPill(
                            label: loc.dashboardVolunteersYtd,
                            value: _summaryValue(
                              context,
                              ytdSummary,
                              (s) => s.uniqueVolunteers.toString(),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetricsHeroRow extends StatelessWidget {
  const _MetricsHeroRow({required this.monthSummary, required this.ytdSummary});

  final AsyncValue<VolunteerHoursSummary> monthSummary;
  final AsyncValue<VolunteerHoursSummary> ytdSummary;

  String _formatHours(double hours) {
    final hasDecimal = hours % 1 != 0;
    return hours.toStringAsFixed(hasDecimal ? 1 : 0);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _HeroMetric(
          label: AppLocalizations.of(context).dashboardHoursThisMonth,
          value: monthSummary.when(
            loading: () => null,
            error: (e, st) => null,
            data: (data) => _formatHours(data.totalHours),
          ),
        ),
        const SizedBox(width: AnyStepSpacing.md16),
        _HeroMetric(
          label: AppLocalizations.of(context).dashboardHoursYtd,
          value: ytdSummary.when(
            loading: () => null,
            error: (e, st) => null,
            data: (data) => _formatHours(data.totalHours),
          ),
        ),
      ],
    );
  }
}

class _HeroMetric extends StatelessWidget {
  const _HeroMetric({required this.label, required this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AnyStepSpacing.md12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest.withAlpha(110),
          borderRadius: BorderRadius.circular(AnyStepSpacing.md14),
          border: Border.all(color: (theme.colorScheme.outlineVariant).withAlpha(60)),
        ),
        child: value == null
            ? const SizedBox(
                height: 42,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnyStepLoadingIndicator(size: 22),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall?.copyWith(color: onSurface.withAlpha(190)),
                  ),
                  const SizedBox(height: AnyStepSpacing.sm4),
                  Text(
                    value!,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: onSurface,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _MetricPill extends StatelessWidget {
  const _MetricPill({required this.label, required this.value});

  final String label;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AnyStepSpacing.md12,
        vertical: AnyStepSpacing.sm8,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withAlpha(70),
        borderRadius: BorderRadius.circular(AnyStepSpacing.md12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: AnyStepSpacing.sm6),
          DefaultTextStyle(
            style:
                theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                ) ??
                const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            child: value,
          ),
        ],
      ),
    );
  }
}

class _MonthlyHoursChart extends StatelessWidget {
  const _MonthlyHoursChart({required this.series, required this.label, this.foreground});

  final AsyncValue<List<MonthlyHoursPoint>> series;
  final String label;
  final Color? foreground;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return series.when(
      loading: () =>
          const SizedBox(height: 140, child: Center(child: AnyStepLoadingIndicator(size: 28))),
      error: (e, st) => SizedBox(
        height: 140,
        child: Center(
          child: Text(
            AppLocalizations.of(context).failedToLoad,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: foreground ?? theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
      data: (points) {
        if (points.isEmpty) {
          return Container(
            height: 140,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withAlpha(80),
              borderRadius: BorderRadius.circular(AnyStepSpacing.md12),
              border: Border.all(color: theme.colorScheme.primary.withAlpha(120)),
            ),
            child: Center(
              child: Text(
                AppLocalizations.of(context).dashboardNoMetrics,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: foreground ?? theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          );
        }

        final maxY = points
            .map((p) => p.hours)
            .fold<double>(0, (max, v) => v > max ? v : max)
            .clamp(1, double.infinity);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(color: foreground ?? theme.colorScheme.onSurface),
            ),
            const SizedBox(height: AnyStepSpacing.sm8),
            SizedBox(
              height: 120,
              child: LineChart(
                LineChartData(
                  minY: 0,
                  maxY: maxY * 1.2,
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          final idx = value.toInt();
                          if (idx < 0 || idx >= points.length) {
                            return const SizedBox.shrink();
                          }
                          final month = DateFormat('MMM').format(points[idx].month);
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              month,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: foreground ?? theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        for (var i = 0; i < points.length; i++)
                          FlSpot(i.toDouble(), points[i].hours),
                      ],
                      isCurved: true,
                      barWidth: 2.5,
                      color: foreground ?? theme.colorScheme.primary,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            (foreground ?? theme.colorScheme.primary).withAlpha(80),
                            Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
