import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';

enum ReportSort {
  hoursDesc,
  hoursAsc,
  lastNameAsc,
  lastNameDesc,
}

class ReportSortSelectionList extends StatelessWidget {
  const ReportSortSelectionList({super.key, required this.current, required this.onSelected});

  final ReportSort current;
  final ValueChanged<ReportSort> onSelected;

  @override
  Widget build(BuildContext context) {
    const options = <ReportSort>[
      ReportSort.hoursDesc,
      ReportSort.hoursAsc,
      ReportSort.lastNameAsc,
      ReportSort.lastNameDesc,
    ];

    String labelFor(ReportSort sort) {
      switch (sort) {
        case ReportSort.hoursDesc:
          return 'Hours (High → Low)';
        case ReportSort.hoursAsc:
          return 'Hours (Low → High)';
        case ReportSort.lastNameAsc:
          return 'Last name (A → Z)';
        case ReportSort.lastNameDesc:
          return 'Last name (Z → A)';
      }
    }

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(AnyStepSpacing.md16),
      children: [
        Text('Sort', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AnyStepSpacing.sm8),
        ...options.map(
          (sort) => ListTile(
            title: Text(labelFor(sort)),
            trailing: sort == current ? const Icon(Icons.check) : null,
            onTap: () => onSelected(sort),
          ),
        ),
        const SizedBox(height: AnyStepSpacing.sm8),
      ],
    );
  }
}
