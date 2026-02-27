import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/snackbar_message.dart';
import 'package:anystep/core/common/widgets/max_width_container.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/events/presentation/screens.dart';
import 'package:anystep/core/features/profile/data/user_repository.dart';
import 'package:anystep/core/features/profile/domain/age_group.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class CreateUserScreen extends ConsumerStatefulWidget {
  const CreateUserScreen({super.key});

  static const path = '/admin/users/create';
  static const name = 'admin-create-user';

  @override
  ConsumerState<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends ConsumerState<CreateUserScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSubmitting = false;

  Future<void> _submit() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) return;
    final values = _formKey.currentState!.value;
    setState(() => _isSubmitting = true);
    final loc = AppLocalizations.of(context);
    try {
      final repo = ref.read(userRepositoryProvider);
      final addressIdRaw = values['addressId'];
      final addressId = addressIdRaw is int
          ? addressIdRaw
          : int.tryParse(addressIdRaw?.toString() ?? '');
      final created = await repo.createAdminUser(
        email: values['email'],
        firstName: values['firstName'],
        lastName: values['lastName'],
        ageGroup: values['ageGroup'],
        role: UserRole.volunteer,
        phoneNumber: values['phoneNumber'],
        addressId: addressId,
      );
      if (!mounted) return;
      context.showSuccessSnackbar(loc.userCreated);
      if (context.canPop()) {
        context.pop(created.id);
      } else {
        context.go(EventFeedScreen.pathAdmin);
      }
    } catch (_) {
      if (!mounted) return;
      context.showErrorSnackbar(loc.userCreateFailed);
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return AnyStepScaffold(
      appBar: AnyStepAppBar(title: Text(loc.createUser)),
      body: MaxWidthContainer(
        child: Padding(
          padding: const EdgeInsets.all(AnyStepSpacing.md16),
          child: FormBuilder(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                AnyStepTextField(
                  name: 'email',
                  labelText: loc.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                Row(
                  children: [
                    Flexible(
                      child: AnyStepTextField(
                        name: 'firstName',
                        labelText: loc.firstName,
                        validator: FormBuilderValidators.firstName(),
                      ),
                    ),
                    const SizedBox(width: AnyStepSpacing.sm8),
                    Flexible(
                      child: AnyStepTextField(
                        name: 'lastName',
                        labelText: loc.lastName,
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                  ],
                ),
                AnyStepTextField(
                  name: 'phoneNumber',
                  labelText: loc.phoneNumber,
                  keyboardType: TextInputType.phone,
                  validator: FormBuilderValidators.phoneNumber(
                    regex: RegExp(r'^\+?[\d\s\-()]{7,20}'),
                  ),
                ),
                const SizedBox(height: AnyStepSpacing.md12),
                AnyStepSegmentedButtonField<AgeGroup>(
                  name: 'ageGroup',
                  labelText: loc.ageGroup,
                  options: AgeGroup.values
                      .map((ag) => FormBuilderFieldOption(value: ag, child: Text(ag.displayName)))
                      .toList(),
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: AnyStepSpacing.md16),
                AnyStepAddressModalTile(
                  formKey: _formKey,
                  streetSecondaryLabelText: loc.streetAddress2,
                  isUserAddress: true,
                  includeEventAddresses: false,
                  includeUserAddresses: false,
                  addressIdValidator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: AnyStepSpacing.md16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _isSubmitting ? null : _submit,
                      child: _isSubmitting
                          ? const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                            )
                          : Text(loc.createUser),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
