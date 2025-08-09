import 'package:anystep/core/features/events/presentation/event_detail/event_detail_form_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/inputs/inputs.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';

class EventDetailForm extends ConsumerStatefulWidget {
  const EventDetailForm({super.key, this.event, this.onSuccess});

  final EventModel? event;
  final VoidCallback? onSuccess;

  @override
  ConsumerState<EventDetailForm> createState() => _EventDetailFormState();
}

class _EventDetailFormState extends ConsumerState<EventDetailForm> {
  final formKey = GlobalKey<FormBuilderState>();
  XFile? _imageFile;

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
    return PopScope(
      canPop: !state.isLoading,
      child: Padding(
        padding: const EdgeInsets.all(AnyStepSpacing.md16),
        child: FormBuilder(
          key: formKey,
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
                labelText: 'Name',
                initialValue: widget.event?.name,
                validator: FormBuilderValidators.required(),
              ),
              AnyStepTextField(
                name: 'description',
                labelText: 'Description (optional)',
                maxLines: 3,
                initialValue: widget.event?.description,
              ),
              Row(
                children: [
                  Flexible(
                    child: AnyStepDateTimePicker(
                      name: 'startTime',
                      labelText: 'Start Day/Time',
                      initialValue:
                          widget.event?.startTime.toLocal() ??
                          DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 8, 0),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        (val) {
                          if (val != null && (val.toLocal().isBefore(now))) {
                            return 'Start time has passed';
                          }
                          return null;
                        },
                      ]),
                    ),
                  ),
                  const SizedBox(width: AnyStepSpacing.sm2),
                  Flexible(
                    child: AnyStepDateTimePicker(
                      name: 'endTime',
                      labelText: 'End Day/Time',
                      initialValue:
                          widget.event?.endTime.toLocal() ??
                          DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 9, 0),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        (val) {
                          if (val != null &&
                              widget.event != null &&
                              val.isBefore(widget.event!.startTime)) {
                            return 'End time must be after start time';
                          }
                          return null;
                        },
                      ]),
                    ),
                  ),
                ],
              ),
              AnyStepTextField(
                name: 'street',
                initialValue: widget.event?.address?.street,
                labelText: 'Street Address',
                validator: FormBuilderValidators.required(),
              ),
              AnyStepTextField(
                name: 'streetSecondary',
                initialValue: widget.event?.address?.streetSecondary,
                labelText: 'Apartment/Suite/Floor (optional)',
              ),
              Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: AnyStepTextField(
                      name: 'city',
                      initialValue: widget.event?.address?.city,
                      labelText: 'City',
                      validator: FormBuilderValidators.city(),
                    ),
                  ),
                  const SizedBox(width: AnyStepSpacing.sm2),
                  Flexible(
                    flex: 2,
                    child: AnyStepTextField(
                      name: 'state',
                      initialValue: widget.event?.address?.state,
                      labelText: 'State',
                      validator: FormBuilderValidators.state(),
                    ),
                  ),
                  const SizedBox(width: AnyStepSpacing.sm2),
                  Flexible(
                    flex: 3,
                    child: AnyStepTextField(
                      name: 'postalCode',
                      initialValue: widget.event?.address?.postalCode,
                      labelText: 'Zip Code',
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.zipCode(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AnyStepSpacing.sm8),
              if (state.error != null)
                Text(state.error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ElevatedButton(
                onPressed: state.isLoading ? null : _onSubmit,
                child: const Text('Save Event'),
              ),
              const SizedBox(height: AnyStepSpacing.sm8),
            ],
          ),
        ),
      ),
    );
  }
}
