import 'package:anystep/core/common/widgets/share_button.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_form.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_info.dart';
import 'package:anystep/core/features/events/presentation/widgets/share_event_button.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventDetailScreen extends ConsumerStatefulWidget {
  const EventDetailScreen({super.key, required this.id});
  static const path = '/events/:id';
  static String getPath(int id) => '/events/$id';

  final int id;

  @override
  ConsumerState<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends ConsumerState<EventDetailScreen> {
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
  }

  void _toggleEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _onSuccess() {
    if (!mounted) return;
    ref.invalidate(getEventProvider(widget.id));
    setState(() {
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final event = ref.watch(getEventProvider(widget.id));
    final user = ref.watch(currentUserStreamProvider);

    return AnyStepScaffold(
      appBar: AnyStepAppBar(
        title: const Text('Event Detail'),
        actions: event.whenOrNull(
          data:
              (event) => [
                ShareEventButton(event: event),
                user.maybeWhen(
                  data: (value) {
                    if (value?.role == UserRole.admin) {
                      return IconButton(
                        icon: Icon(isEditing ? Icons.edit_off : Icons.edit),
                        onPressed: _toggleEdit,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                  orElse: () => const SizedBox.shrink(),
                ),
              ],
        ),
      ),
      body: SafeArea(
        child: event.maybeWhen(
          data:
              (event) => SingleChildScrollView(
                child: Column(
                  children: [
                    isEditing
                        ? EventDetailForm(event: event, onSuccess: _onSuccess)
                        : EventDetailInfo(event: event),
                  ],
                ),
              ),

          error:
              (e, st) => RefreshIndicator(
                onRefresh: () async => ref.invalidate(getEventProvider(widget.id)),
                child: ScrollableCenteredContent(child: AnyStepErrorWidget()),
              ),
          orElse: () => const Center(child: AnyStepLoadingIndicator()),
        ),
      ),
    );
  }
}
