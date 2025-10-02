import 'dart:ui';

import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_form.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_info.dart';
import 'package:anystep/core/features/events/presentation/widgets/share_event_button.dart';
import 'package:anystep/core/features/events/presentation/widgets/sign_up_list.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/core/features/screens.dart';
import 'package:anystep/core/features/user_events/presentation/sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final theme = Theme.of(context);

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
              (event) => Stack(
                alignment: Alignment.topCenter,
                fit: StackFit.expand,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        isEditing
                            ? EventDetailForm(event: event, onSuccess: _onSuccess)
                            : EventDetailInfo(event: event),
                        if (user.hasValue && user.value != null && !isEditing)
                          Center(child: SignUpButton(eventId: widget.id)),
                        if (user.hasValue && !isEditing) SignUpList(eventId: widget.id),
                        if (user.hasValue && user.valueOrNull == null)
                          ElevatedButton(
                            onPressed: () => context.go(LoginScreen.path),
                            child: const Text('Sign up'),
                          ),
                        SizedBox(height: AnyStepSpacing.xl64), // Add space for the blur
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: AnyStepSpacing.lg48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            theme.colorScheme.surface.withAlpha(0),
                            theme.colorScheme.surface,
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                  ),
                ],
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
