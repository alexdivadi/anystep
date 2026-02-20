import 'package:anystep/core/features/events/presentation/event_detail/event_detail_form_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/inputs/inputs.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:flutter/material.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';

class EventDetailForm extends ConsumerStatefulWidget {
  const EventDetailForm({
    super.key,
    this.event,
    this.onSuccess,
    this.physics,
    this.showAddressNameField = false,
  });

  final EventModel? event;
  final VoidCallback? onSuccess;
  final ScrollPhysics? physics;
  final bool showAddressNameField;

  @override
  ConsumerState<EventDetailForm> createState() => _EventDetailFormState();
}

class _EventDetailFormState extends ConsumerState<EventDetailForm> {
  final formKey = GlobalKey<FormBuilderState>();
  XFile? _imageFile;
  DateTime? _startTime;

  void _onSubmit() async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final values = Map<String, dynamic>.from(formKey.currentState!.value);
      values['imageUrl'] = widget.event?.imageUrl; // Add image URL to values

      final isSuccess = await ref
          .read(eventDetailFormControllerProvider(widget.event?.id).notifier)
          .createOrUpdateEvent(values, image: _imageFile);
      if (isSuccess && widget.onSuccess != null) {
        widget.onSuccess!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(eventDetailFormControllerProvider(widget.event?.id));
    final now = DateTime.now().toLocal();
    final tomorrow = DateTime(now.year, now.month, now.day + 1, 0, 0);
    final loc = AppLocalizations.of(context);
    _startTime ??= widget.event?.startTime.toLocal();
    return PopScope(
      canPop: !state.isLoading,
      child: Padding(
        padding: const EdgeInsets.all(AnyStepSpacing.md16),
        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              _ScrollableWrapper(
                scrollable:
                    widget.physics != null &&
                    widget.physics != const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    ImageUploadWidget(
                      imageUrl: widget.event?.imageUrl,
                      onImageSelected: (file) {
                        setState(() {
                          _imageFile = file;
                        });
                      },
                    ),
                    AnyStepTextField(
                      name: 'name',
                      labelText: loc.nameLabel,
                      initialValue: widget.event?.name,
                      validator: FormBuilderValidators.required(),
                    ),
                    AnyStepTextField(
                      name: 'description',
                      labelText: loc.descriptionOptional,
                      maxLines: 3,
                      expandOnFocus: true,
                      expandedLines: 10,
                      initialValue: widget.event?.description,
                    ),
                    AnyStepSwitchInput(
                      name: 'isVolunteerEligible',
                      label: loc.volunteerEventLabel,
                      helpText: loc.volunteerEventHelp,
                      initialValue: widget.event?.isVolunteerEligible ?? true,
                    ),
                    const SizedBox(height: AnyStepSpacing.sm4),
                    Row(
                      children: [
                        Flexible(
                          child: AnyStepDateTimePicker(
                            name: 'startTime',
                            labelText: loc.startDateTime,
                            initialValue:
                                widget.event?.startTime.toLocal() ??
                                DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 8, 0),
                            onChanged: (val) {
                              setState(() => _startTime = val);
                              final endField = formKey.currentState?.fields['endTime'];
                              if (val != null &&
                                  endField?.value != null &&
                                  (endField!.value as DateTime).isBefore(val)) {
                                endField.didChange(val.add(const Duration(hours: 1)));
                              }
                            },
                            validator: FormBuilderValidators.required(),
                          ),
                        ),
                        const SizedBox(width: AnyStepSpacing.sm2),
                        Flexible(
                          child: AnyStepDateTimePicker(
                            name: 'endTime',
                            labelText: loc.endDateTime,
                            initialValue:
                                widget.event?.endTime.toLocal() ??
                                DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 9, 0),
                            firstDate: _startTime,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              (val) {
                                if (val != null &&
                                    _startTime != null &&
                                    val.isBefore(_startTime!)) {
                                  return 'End time must be after start time';
                                }
                                return null;
                              },
                            ]),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AnyStepSpacing.sm4),
                    AnyStepAddressModalTile(
                      formKey: formKey,
                      initialAddressId: widget.event?.addressId ?? widget.event?.address?.id,
                      isUserAddress: false,
                      includeEventAddresses: true,
                      includeUserAddresses: false,
                      showNameField: widget.showAddressNameField,
                      streetValidator: FormBuilderValidators.required(),
                      streetSecondaryValidator: FormBuilderValidators.street(
                        checkNullOrEmpty: false,
                      ),
                      addressIdValidator: FormBuilderValidators.required(),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.sm4),
                        childrenPadding: const EdgeInsets.only(bottom: AnyStepSpacing.sm4),
                        title: Text(loc.advancedOptions),
                        children: [
                          AnyStepTextField(
                            name: 'maxVolunteers',
                            initialValue: widget.event?.maxVolunteers?.toString(),
                            labelText: loc.maxVolunteersOptional,
                            keyboardType: TextInputType.number,
                            validator: FormBuilderValidators.integer(checkNullOrEmpty: false),
                          ),
                          AnyStepDateTimePicker(
                            name: 'registrationDeadline',
                            labelText: loc.registrationDeadlineOptional,
                            initialValue: widget.event?.registrationDeadline?.toLocal(),
                            useDefaultInitialValue: false,
                            lastDate: _startTime,
                            allowClear: true,
                            validator: FormBuilderValidators.compose([
                              (val) {
                                if (val != null && _startTime != null && val.isAfter(_startTime!)) {
                                  return 'Deadline must be before event start time';
                                }
                                return null;
                              },
                            ]),
                          ),
                          AnyStepTextField(
                            name: 'externalLink',
                            initialValue: widget.event?.externalLink,
                            labelText: loc.externalLinkOptional,
                            keyboardType: TextInputType.url,
                            validator: FormBuilderValidators.url(checkNullOrEmpty: false),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AnyStepSpacing.sm8),
              if (state.error != null)
                Text(state.error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ElevatedButton(
                onPressed: state.isLoading ? null : _onSubmit,
                child: Builder(builder: (context) => Text(loc.saveEvent)),
              ),
              const SizedBox(height: AnyStepSpacing.sm8),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScrollableWrapper extends StatelessWidget {
  const _ScrollableWrapper({required this.scrollable, required this.child});

  final bool scrollable;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return scrollable ? Expanded(child: SingleChildScrollView(child: child)) : child;
  }
}
