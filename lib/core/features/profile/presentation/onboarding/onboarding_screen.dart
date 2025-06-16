import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/core/features/profile/domain/age_group.dart';
import 'package:anystep/core/features/location/domain/address_model.dart';
import 'package:anystep/core/features/profile/data/user_repository.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  final String uid;
  final String email;

  const OnboardingScreen({super.key, required this.uid, required this.email});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complete Your Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            children: [
              FormBuilderTextField(
                name: 'firstName',
                decoration: InputDecoration(labelText: 'First Name'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'lastName',
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'phoneNumber',
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.match(
                    RegExp(r'^\+?[\d\s\-()]{7,20}'),
                    errorText: 'Enter a valid phone number',
                  ),
                ]),
              ),
              // Address fields (simplified for demo)
              FormBuilderTextField(
                name: 'street',
                decoration: InputDecoration(labelText: 'Street'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'city',
                decoration: InputDecoration(labelText: 'City'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'state',
                decoration: InputDecoration(labelText: 'State'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'country',
                decoration: InputDecoration(labelText: 'Country'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'postalCode',
                decoration: InputDecoration(labelText: 'Postal Code'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderDropdown<AgeGroup>(
                name: 'ageGroup',
                decoration: InputDecoration(labelText: 'Age Group'),
                items:
                    AgeGroup.values
                        .map(
                          (ag) => DropdownMenuItem(
                            value: ag,
                            child: Text(ag.toString().split('.').last),
                          ),
                        )
                        .toList(),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    final values = _formKey.currentState!.value;
                    final address = AddressModel(
                      street: values['street'],
                      city: values['city'],
                      state: values['state'],
                      country: values['country'],
                      postalCode: values['postalCode'],
                      isUserAddress: true,
                    );
                    final user = UserModel(
                      volunteerId: 0,
                      email: widget.email,
                      address: address,
                      firstName: values['firstName'],
                      lastName: values['lastName'],
                      ageGroup: values['ageGroup'],
                      permissions: [],
                      phoneNumber: values['phoneNumber'],
                    );
                    await ref
                        .read(userRepositoryProvider)
                        .createOrUpdate(obj: user, documentId: widget.uid);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
