import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/inputs/inputs.dart';
import 'package:anystep/core/features/profile/domain/age_group.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';

import 'profile_screen_controller.dart';

class ProfileForm extends ConsumerStatefulWidget {
  final UserModel user;
  final VoidCallback? onCancel;
  final VoidCallback? onSaved;
  const ProfileForm({super.key, required this.user, this.onCancel, this.onSaved});

  @override
  ConsumerState<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends ConsumerState<ProfileForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileScreenControllerProvider);
    return Padding(
      padding: const EdgeInsets.all(AnyStepSpacing.md16),
      child: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageUploadWidget(
                shape: BoxShape.circle,
                imageUrl: widget.user.profileImageUrl,
                onImageSelected: (file) {
                  setState(() {
                    _imageFile = file;
                  });
                },
              ),
              AnyStepTextField(
                name: 'firstName',
                initialValue: widget.user.firstName,
                labelText: 'First Name',
                validator: FormBuilderValidators.required(),
              ),
              AnyStepTextField(
                name: 'lastName',
                initialValue: widget.user.lastName,
                labelText: 'Last Name',
                validator: FormBuilderValidators.required(),
              ),
              AnyStepTextField(
                name: 'phoneNumber',
                keyboardType: TextInputType.phone,
                initialValue: widget.user.phoneNumber,
                labelText: 'Phone',
              ),
              AnyStepSegmentedButtonField<AgeGroup>(
                name: 'ageGroup',
                initialValue: widget.user.ageGroup,
                labelText: 'Age Group',
                options:
                    AgeGroup.values
                        .map(
                          (ageGroup) => FormBuilderFieldOption(
                            value: ageGroup,
                            child: Text(ageGroup.displayName),
                          ),
                        )
                        .toList(),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: AnyStepSpacing.sm8),
              AnyStepTextField(
                name: 'street',
                initialValue: widget.user.address?.street,
                labelText: 'Street Address',
                validator: FormBuilderValidators.required(),
              ),
              AnyStepTextField(
                name: 'streetSecondary',
                initialValue: widget.user.address?.streetSecondary,
                labelText: 'Apartment/Suite/Floor (optional)',
              ),
              Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: AnyStepTextField(
                      name: 'city',
                      initialValue: widget.user.address?.city,
                      labelText: 'City',
                      validator: FormBuilderValidators.city(),
                    ),
                  ),
                  const SizedBox(width: AnyStepSpacing.sm2),
                  Flexible(
                    flex: 2,
                    child: AnyStepTextField(
                      name: 'state',
                      initialValue: widget.user.address?.state,
                      labelText: 'State',
                      validator: FormBuilderValidators.state(),
                    ),
                  ),
                  const SizedBox(width: AnyStepSpacing.sm2),
                  Flexible(
                    flex: 3,
                    child: AnyStepTextField(
                      name: 'postalCode',
                      initialValue: widget.user.address?.postalCode,
                      labelText: 'Zip Code',
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.zipCode(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AnyStepSpacing.md24),
              if (state.isLoading) const CircularProgressIndicator.adaptive(),
              if (state.error != null) ...[
                Text(state.error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
                const SizedBox(height: AnyStepSpacing.sm8),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: state.isLoading ? null : widget.onCancel,
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed:
                        state.isLoading
                            ? null
                            : () async {
                              if (_formKey.currentState?.saveAndValidate() ?? false) {
                                await ref
                                    .read(profileScreenControllerProvider.notifier)
                                    .save(_formKey.currentState!.value, image: _imageFile);
                                widget.onSaved?.call();
                              }
                            },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
