import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/inputs/inputs.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/core/features/user_events/presentation/add_attendee_controller.dart';
import 'package:anystep/core/features/user_events/presentation/attendee_search_form.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class AddAttendeeScreen extends ConsumerStatefulWidget {
  const AddAttendeeScreen({super.key, required this.eventId});

  static const path = '/events/:id/add-attendee';
  static String getPath(int eventId) => '/events/$eventId/add-attendee';
  static const name = 'add-attendee';

  final int eventId;

  @override
  ConsumerState<AddAttendeeScreen> createState() => _AddAttendeeScreenState();
}

class _AddAttendeeScreenState extends ConsumerState<AddAttendeeScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  UserModel? _selectedUser;
  bool _attended = true;

  void _openUserSearch() {
    context.showModal(
      AttendeeSearchForm(
        eventId: widget.eventId,
        onUserSelected: (user) {
          setState(() => _selectedUser = user);
          formKey.currentState?.fields['userId']?.didChange(user.id);
        },
      ),
      isScrollControlled: false,
    );
  }

  Future<void> _submit() async {
    if (!(formKey.currentState?.saveAndValidate() ?? false)) return;
    final values = formKey.currentState!.value;
    final userId = values['userId'] as String;
    final attended = values['attended'] as bool? ?? true;
    final checkInAt = values['checkInAt'] as DateTime?;
    final checkOutAt = values['checkOutAt'] as DateTime?;

    final success = await ref
        .read(addAttendeeControllerProvider.notifier)
        .addAttendee(
          eventId: widget.eventId,
          userId: userId,
          attended: attended,
          checkInAt: checkInAt,
          checkOutAt: checkOutAt,
        );

    if (!mounted) return;
    if (success) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final eventAsync = ref.watch(getEventProvider(widget.eventId));
    final state = ref.watch(addAttendeeControllerProvider);
    final loc = AppLocalizations.of(context);

    return eventAsync.when(
      loading: () => AnyStepScaffold(
        appBar: AnyStepAppBar(title: Text(loc.addAttendeeTitle)),
        body: const Center(child: AnyStepLoadingIndicator()),
      ),
      error: (e, st) => AnyStepScaffold(
        appBar: AnyStepAppBar(title: Text(loc.addAttendeeTitle)),
        body: const ScrollableCenteredContent(child: AnyStepErrorWidget()),
      ),
      data: (event) {
        final initialCheckIn = event.startTime.toLocal();
        final initialCheckOut = event.endTime.toLocal();
        return AnyStepScaffold(
          appBar: AnyStepAppBar(title: Text(loc.addAttendeeTitle)),
          body: Padding(
            padding: const EdgeInsets.all(AnyStepSpacing.md16),
            child: FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        _UserSelectField(
                          label: loc.userLabel,
                          hint: loc.selectUser,
                          selectedUser: _selectedUser,
                          onTap: _openUserSearch,
                        ),
                        AnyStepSwitchInput(
                          name: 'attended',
                          label: loc.attendedLabel,
                          initialValue: _attended,
                          onChanged: (value) {
                            final attended = value ?? true;
                            setState(() => _attended = attended);
                            final checkInField = formKey.currentState?.fields['checkInAt'];
                            final checkOutField = formKey.currentState?.fields['checkOutAt'];
                            if (!attended) {
                              checkInField?.didChange(null);
                              checkOutField?.didChange(null);
                              return;
                            }
                            checkInField?.didChange(checkInField.value ?? initialCheckIn);
                            checkOutField?.didChange(checkOutField.value ?? initialCheckOut);
                          },
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: AnyStepDateTimePicker(
                                name: 'checkInAt',
                                labelText: loc.checkInLabel,
                                initialValue: initialCheckIn,
                                enabled: _attended,
                                validator:
                                    _attended ? FormBuilderValidators.required() : null,
                              ),
                            ),
                            const SizedBox(width: AnyStepSpacing.sm2),
                            Flexible(
                              child: AnyStepDateTimePicker(
                                name: 'checkOutAt',
                                labelText: loc.checkOutLabel,
                                initialValue: initialCheckOut,
                                enabled: _attended,
                                validator:
                                    _attended
                                        ? FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          (val) {
                                            final checkIn =
                                                formKey.currentState?.fields['checkInAt']?.value
                                                    as DateTime?;
                                            if (val != null && checkIn != null && val.isBefore(checkIn)) {
                                              return 'Check out must be after check in';
                                            }
                                            return null;
                                          },
                                        ])
                                        : null,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (state.hasError)
                    Padding(
                      padding: const EdgeInsets.only(bottom: AnyStepSpacing.sm8),
                      child: Text(
                        loc.failedToSave,
                        style: TextStyle(color: Theme.of(context).colorScheme.error),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: state.isLoading ? null : _submit,
                    child: Text(loc.save),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _UserSelectField extends StatelessWidget {
  const _UserSelectField({
    required this.label,
    required this.hint,
    required this.onTap,
    required this.selectedUser,
  });

  final String label;
  final String hint;
  final VoidCallback onTap;
  final UserModel? selectedUser;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final labelColor = Theme.of(context).colorScheme.onSurface.withAlpha(153);
    final hintColor = Theme.of(context).colorScheme.onSurface.withAlpha(128);

    return FormBuilderField<String>(
      name: 'userId',
      validator: FormBuilderValidators.required(),
      builder: (field) {
        final displayText = selectedUser?.fullName ?? hint;
        final displayStyle = selectedUser == null
            ? Theme.of(context).textTheme.bodyLarge?.copyWith(color: hintColor)
            : Theme.of(context).textTheme.bodyLarge;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.sm4),
          child: InkWell(
            borderRadius: BorderRadius.circular(AnyStepSpacing.md16),
            onTap: onTap,
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(color: labelColor),
                floatingLabelStyle: TextStyle(color: labelColor),
                errorText: field.errorText,
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(AnyStepSpacing.md16)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(AnyStepSpacing.md16)),
                  borderSide: BorderSide(color: primary, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(AnyStepSpacing.md16)),
                  borderSide: BorderSide(color: primary, width: 2),
                ),
              ),
              child: Row(
                children: [
                  Expanded(child: Text(displayText, style: displayStyle)),
                  const Icon(Icons.search),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
