import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/any_step_error_widget.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:anystep/database/pagination_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PaginatedListView<T> extends ConsumerWidget {
  const PaginatedListView({
    super.key,
    required this.pageProvider,
    required this.itemBuilder,
    this.shimmer,
    this.errorBuilder,
    this.noItemsWidget,
    this.pageSize = 25,
  });

  final AsyncValue<PaginationResult<T>> Function(WidgetRef ref, int page) pageProvider;
  final Widget Function(BuildContext, T) itemBuilder;
  final int pageSize;
  final Widget Function(BuildContext, Object)? errorBuilder;
  final Widget? shimmer;
  final Widget? noItemsWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstPageAsync = pageProvider(ref, 0);

    return firstPageAsync.when(
      // Initial loading state – show 6 shimmer placeholders separated by spacing.
      loading:
          () => SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.md12),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, idx) {
                  if (idx.isOdd) return const SizedBox(height: AnyStepSpacing.sm8);
                  return shimmer ?? const _DefaultShimmer();
                },
                childCount: 6 * 2 - 1, // shimmer + separators
              ),
            ),
          ),
      // Error – fill remaining to allow pull-to-refresh from parent.
      error:
          (e, st) => const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: AnyStepErrorWidget()),
          ),
      // Data loaded
      data: (feedResult) {
        if (feedResult.items.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: noItemsWidget ?? const Text("No items found")),
          );
        }

        final total = feedResult.totalCount;
        final childCount = total * 2 - 1; // include separators

        return SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.md12),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, idx) {
              if (idx.isOdd) return const SizedBox(height: AnyStepSpacing.sm8);
              final logicalIndex = idx ~/ 2;
              final pageNum = logicalIndex ~/ pageSize;
              final indexInPage = logicalIndex % pageSize;

              final pageAsync = pageProvider(ref, pageNum);
              return pageAsync.when(
                loading: () => shimmer ?? const _DefaultShimmer(),
                error:
                    (e, st) =>
                        errorBuilder != null ? errorBuilder!(context, e) : const _DefaultError(),
                data: (pageResult) {
                  if (indexInPage >= pageResult.items.length) {
                    // Safety net – if the page hasn't finished loading this index yet.
                    return const SizedBox.shrink();
                  }
                  final obj = pageResult.items[indexInPage];
                  return itemBuilder(context, obj);
                },
              );
            }, childCount: childCount),
          ),
        );
      },
    );
  }
}

class _DefaultShimmer extends StatelessWidget {
  const _DefaultShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AnyStepSpacing.md12,
        vertical: AnyStepSpacing.sm6,
      ),
      child: Shimmer.fromColors(
        baseColor: AnyStepColors.grayDark.withAlpha(40),
        highlightColor: AnyStepColors.grayDark.withAlpha(10),
        child: ListTile(
          leading: Container(
            width: AnyStepSpacing.xl56,
            height: AnyStepSpacing.xl56,
            decoration: BoxDecoration(
              color: AnyStepColors.grayDark.withAlpha(40),
              borderRadius: BorderRadius.circular(AnyStepSpacing.sm8),
            ),
          ),
          title: Container(
            width: double.infinity,
            height: AnyStepSpacing.md16,
            color: AnyStepColors.grayDark.withAlpha(40),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AnyStepSpacing.sm8),
              Container(
                width: 120,
                height: AnyStepSpacing.sm10,
                color: AnyStepColors.grayDark.withAlpha(40),
              ),
              SizedBox(height: AnyStepSpacing.sm4),
              Container(
                width: double.infinity,
                height: AnyStepSpacing.sm8,
                color: AnyStepColors.grayDark.withAlpha(40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DefaultError extends StatelessWidget {
  const _DefaultError();

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(padding: EdgeInsets.all(AnyStepSpacing.md16), child: Text('Failed to load')),
    );
  }
}
