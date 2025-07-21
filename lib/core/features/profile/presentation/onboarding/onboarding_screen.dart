import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/events/presentation/screens.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/age_group.dart';
import 'package:anystep/core/features/profile/presentation/onboarding/onboarding_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  static const String path = '/onboarding';
  static const String name = 'onboarding';

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final PageController _pageController = PageController();
  int _currentPage = 0;

  bool _validateFirstPageFields() {
    final fields = _formKey.currentState?.fields;
    if (fields == null) return false;
    final firstNameValid = fields['firstName']?.validate() ?? false;
    final lastNameValid = fields['lastName']?.validate() ?? false;
    final phoneValid = fields['phoneNumber']?.validate() ?? false;
    final ageGroupValid = fields['ageGroup']?.validate() ?? false;
    return firstNameValid && lastNameValid && phoneValid && ageGroupValid;
  }

  void _nextPage() {
    if (_currentPage < 1) {
      if (_validateFirstPageFields()) {
        setState(() {
          _currentPage++;
        });
        _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      }
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingScreenControllerProvider);

    ref.listen(currentUserStreamProvider, (previous, next) {
      if (next.hasValue && next.value != null) {
        context.go(EventFeedScreen.path);
      }
    });

    return AnyStepScaffold(
      appBar: AnyStepAppBar(title: Text('Complete Your Profile')),
      body: Padding(
        padding: const EdgeInsets.all(AnyStepSpacing.md16),
        child: FormBuilder(
          key: _formKey,
          child: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              // Page 1: Basic Info
              ListView(
                shrinkWrap: true,
                children: [
                  FormBuilderTextField(
                    name: 'firstName',
                    decoration: InputDecoration(labelText: 'First Name'),
                    validator: FormBuilderValidators.firstName(),
                  ),
                  FormBuilderTextField(
                    name: 'lastName',
                    decoration: InputDecoration(labelText: 'Last Name'),
                    validator: FormBuilderValidators.lastName(),
                  ),
                  FormBuilderTextField(
                    name: 'phoneNumber',
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    validator: FormBuilderValidators.phoneNumber(
                      regex: RegExp(r'^\+?[\d\s\-()]{7,20}'),
                    ),
                  ),
                  FormBuilderDropdown<AgeGroup>(
                    name: 'ageGroup',
                    decoration: InputDecoration(labelText: 'Age Group'),
                    items:
                        AgeGroup.values
                            .map((ag) => DropdownMenuItem(value: ag, child: Text(ag.displayName)))
                            .toList(),
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: AnyStepSpacing.md24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [ElevatedButton(onPressed: _nextPage, child: Text('Next'))],
                  ),
                ],
              ),
              // Page 2: Address & Age Group
              ListView(
                shrinkWrap: true,
                children: [
                  FormBuilderTextField(
                    name: 'street',
                    decoration: InputDecoration(labelText: 'Street Address'),
                    validator: FormBuilderValidators.street(),
                  ),
                  FormBuilderTextField(
                    name: 'streetSecondary',
                    decoration: InputDecoration(labelText: 'Apartment/Suite/Floor (optional)'),
                    validator: FormBuilderValidators.street(checkNullOrEmpty: false),
                  ),
                  FormBuilderTextField(
                    name: 'city',
                    decoration: InputDecoration(labelText: 'City'),
                    validator: FormBuilderValidators.city(),
                  ),
                  FormBuilderTextField(
                    name: 'state',
                    decoration: InputDecoration(labelText: 'State'),
                    validator: FormBuilderValidators.state(),
                  ),
                  FormBuilderTextField(
                    name: 'country',
                    decoration: InputDecoration(labelText: 'Country'),
                    validator: FormBuilderValidators.country(),
                  ),
                  FormBuilderTextField(
                    name: 'postalCode',
                    decoration: InputDecoration(labelText: 'Postal Code'),
                    validator: FormBuilderValidators.zipCode(),
                  ),

                  const SizedBox(height: AnyStepSpacing.md24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: _prevPage, child: Text('Back')),
                      ElevatedButton(
                        onPressed:
                            state.isLoading
                                ? null
                                : () async {
                                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                                    await ref
                                        .read(onboardingScreenControllerProvider.notifier)
                                        .updateUserDetails(values: _formKey.currentState!.value);
                                  }
                                },
                        child:
                            state.isLoading ? CircularProgressIndicator.adaptive() : Text('Submit'),
                      ),
                    ],
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
