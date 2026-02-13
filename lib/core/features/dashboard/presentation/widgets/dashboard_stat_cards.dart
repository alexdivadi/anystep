import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';

class DashboardStatItem {
  const DashboardStatItem({
    required this.label,
    required this.value,
    this.icon,
    this.accentColor,
  });

  final String label;
  final Widget value;
  final IconData? icon;
  final Color? accentColor;
}

class DashboardStatCards extends StatelessWidget {
  const DashboardStatCards({super.key, required this.items});

  final List<DashboardStatItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final spacing = AnyStepSpacing.md12;
        final columns = maxWidth >= 600 ? 2 : 1;
        final cardWidth = (maxWidth - (columns - 1) * spacing) / columns;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AnyStepSpacing.md16),
          child: Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: [
              for (final item in items)
                SizedBox(
                  width: cardWidth,
                  child: _DashboardStatCard(item: item),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _DashboardStatCard extends StatelessWidget {
  const _DashboardStatCard({required this.item});

  final DashboardStatItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labelStyle = theme.textTheme.labelMedium?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    final valueStyle = theme.textTheme.titleLarge?.copyWith(
      color: item.accentColor ?? theme.colorScheme.onSurface,
      fontWeight: FontWeight.w700,
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AnyStepSpacing.md16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (item.icon != null)
                  Icon(item.icon, size: 18, color: item.accentColor ?? theme.iconTheme.color),
                if (item.icon != null) const SizedBox(width: AnyStepSpacing.sm6),
                Expanded(child: Text(item.label, style: labelStyle)),
              ],
            ),
            const SizedBox(height: AnyStepSpacing.sm8),
            DefaultTextStyle(
              style: valueStyle ?? const TextStyle(),
              child: item.value,
            ),
          ],
        ),
      ),
    );
  }
}
