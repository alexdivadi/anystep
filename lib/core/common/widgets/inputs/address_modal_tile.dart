import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/any_step_modal.dart';
import 'package:anystep/core/common/widgets/inputs/any_step_address_form.dart';
import 'package:anystep/core/features/location/data/address_repository.dart';
import 'package:anystep/core/features/location/domain/address_model.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AnyStepAddressModalTile extends ConsumerStatefulWidget {
  const AnyStepAddressModalTile({
    super.key,
    required this.formKey,
    this.initialAddressId,
    this.addressIdFieldName = 'addressId',
    this.title,
    this.countryCode = 'US',
    this.enabled = true,
    this.disableSearch = false,
    this.includeEventAddresses = true,
    this.includeUserAddresses = true,
    this.isUserAddress = false,
    this.showNameField = false,
    this.nameFieldName = 'addressName',
    this.nameLabelText,
    this.nameValidator,
    this.postalCodeFieldName = 'postalCode',
    this.streetLabelText,
    this.streetSecondaryLabelText,
    this.cityLabelText,
    this.stateLabelText,
    this.postalCodeLabelText,
    this.streetValidator,
    this.streetSecondaryValidator,
    this.cityValidator,
    this.stateValidator,
    this.postalCodeValidator,
    this.addressIdValidator,
    this.onAddressSaved,
  });

  final GlobalKey<FormBuilderState> formKey;
  final int? initialAddressId;
  final String addressIdFieldName;
  final String? title;
  final String countryCode;
  final bool enabled;
  final bool disableSearch;
  final bool includeEventAddresses;
  final bool includeUserAddresses;
  final bool isUserAddress;
  final bool showNameField;
  final String nameFieldName;
  final String? nameLabelText;
  final String? Function(String?)? nameValidator;
  final String postalCodeFieldName;
  final String? streetLabelText;
  final String? streetSecondaryLabelText;
  final String? cityLabelText;
  final String? stateLabelText;
  final String? postalCodeLabelText;
  final String? Function(String?)? streetValidator;
  final String? Function(String?)? streetSecondaryValidator;
  final String? Function(String?)? cityValidator;
  final String? Function(String?)? stateValidator;
  final String? Function(String?)? postalCodeValidator;
  final String? Function(dynamic)? addressIdValidator;
  final ValueChanged<int?>? onAddressSaved;

  @override
  ConsumerState<AnyStepAddressModalTile> createState() => _AnyStepAddressModalTileState();
}

class _AnyStepAddressModalTileState extends ConsumerState<AnyStepAddressModalTile> {
  int? _addressId;
  AddressModel? _address;

  @override
  void initState() {
    super.initState();
    _addressId = widget.initialAddressId;
    if (_addressId != null) {
      _loadAddress(_addressId!);
    }
  }

  @override
  void didUpdateWidget(covariant AnyStepAddressModalTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialAddressId != oldWidget.initialAddressId) {
      _addressId = widget.initialAddressId;
      widget.formKey.currentState?.fields[widget.addressIdFieldName]?.didChange(_addressId);
      if (_addressId != null) {
        _loadAddress(_addressId!);
      } else {
        setState(() => _address = null);
      }
    }
  }

  Future<void> _loadAddress(int id) async {
    try {
      final repo = ref.read(addressRepositoryProvider);
      final address = await repo.get(documentId: id.toString());
      if (!mounted) return;
      setState(() => _address = address);
    } catch (_) {
      if (!mounted) return;
      setState(() => _address = null);
    }
  }

  void _handleAddressSaved(int? addressId) {
    if (addressId == null) return;
    setState(() {
      _addressId = addressId;
    });
    final field = widget.formKey.currentState?.fields[widget.addressIdFieldName];
    field?.didChange(addressId);
    widget.onAddressSaved?.call(addressId);
    _loadAddress(addressId);
  }

  void _openModal() {
    if (!widget.enabled) return;
    context.showModal(
      _AddressModalContent(
        title: widget.title,
        initialAddressId: _addressId,
        countryCode: widget.countryCode,
        disableSearch: widget.disableSearch,
        includeEventAddresses: widget.includeEventAddresses,
        includeUserAddresses: widget.includeUserAddresses,
        isUserAddress: widget.isUserAddress,
        showNameField: widget.showNameField,
        nameFieldName: widget.nameFieldName,
        nameLabelText: widget.nameLabelText,
        nameValidator: widget.nameValidator,
        postalCodeFieldName: widget.postalCodeFieldName,
        streetLabelText: widget.streetLabelText,
        streetSecondaryLabelText: widget.streetSecondaryLabelText,
        cityLabelText: widget.cityLabelText,
        stateLabelText: widget.stateLabelText,
        postalCodeLabelText: widget.postalCodeLabelText,
        streetValidator: widget.streetValidator,
        streetSecondaryValidator: widget.streetSecondaryValidator,
        cityValidator: widget.cityValidator,
        stateValidator: widget.stateValidator,
        postalCodeValidator: widget.postalCodeValidator,
        onAddressSaved: _handleAddressSaved,
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return FormBuilderField<int>(
      name: widget.addressIdFieldName,
      initialValue: _addressId,
      validator: widget.addressIdValidator,
      builder: (field) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(widget.title ?? loc.address),
            subtitle: Text(_address?.formattedAddress ?? loc.noAddressProvided),
            trailing: const Icon(Icons.chevron_right),
            onTap: widget.enabled ? _openModal : null,
          ),
          if (field.errorText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: AnyStepSpacing.sm8),
              child: Text(
                field.errorText ?? '',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
        ],
      ),
    );
  }
}

class _AddressModalContent extends ConsumerStatefulWidget {
  const _AddressModalContent({
    required this.onAddressSaved,
    this.title,
    this.initialAddressId,
    this.countryCode = 'US',
    this.disableSearch = false,
    this.includeEventAddresses = true,
    this.includeUserAddresses = true,
    this.isUserAddress = false,
    this.showNameField = false,
    this.nameFieldName = 'addressName',
    this.nameLabelText,
    this.nameValidator,
    this.postalCodeFieldName = 'postalCode',
    this.streetLabelText,
    this.streetSecondaryLabelText,
    this.cityLabelText,
    this.stateLabelText,
    this.postalCodeLabelText,
    this.streetValidator,
    this.streetSecondaryValidator,
    this.cityValidator,
    this.stateValidator,
    this.postalCodeValidator,
  });

  final ValueChanged<int?> onAddressSaved;
  final String? title;
  final int? initialAddressId;
  final String countryCode;
  final bool disableSearch;
  final bool includeEventAddresses;
  final bool includeUserAddresses;
  final bool isUserAddress;
  final bool showNameField;
  final String nameFieldName;
  final String? nameLabelText;
  final String? Function(String?)? nameValidator;
  final String postalCodeFieldName;
  final String? streetLabelText;
  final String? streetSecondaryLabelText;
  final String? cityLabelText;
  final String? stateLabelText;
  final String? postalCodeLabelText;
  final String? Function(String?)? streetValidator;
  final String? Function(String?)? streetSecondaryValidator;
  final String? Function(String?)? cityValidator;
  final String? Function(String?)? stateValidator;
  final String? Function(String?)? postalCodeValidator;

  @override
  ConsumerState<_AddressModalContent> createState() => _AddressModalContentState();
}

class _AddressModalContentState extends ConsumerState<_AddressModalContent> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _handleSaved(int? id) {
    if (id == null) return;
    widget.onAddressSaved(id);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AnyStepSpacing.md16,
          AnyStepSpacing.sm8,
          AnyStepSpacing.md16,
          AnyStepSpacing.md16,
        ),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title ?? loc.address,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: AnyStepSpacing.sm8),
                AnyStepAddressForm(
                  formKey: _formKey,
                  initialAddressId: widget.initialAddressId,
                  countryCode: widget.countryCode,
                  disableSearch: widget.disableSearch,
                  includeEventAddresses: widget.includeEventAddresses,
                  includeUserAddresses: widget.includeUserAddresses,
                  isUserAddress: widget.isUserAddress,
                  showNameField: widget.showNameField,
                  nameFieldName: widget.nameFieldName,
                  nameLabelText: widget.nameLabelText,
                  nameValidator: widget.nameValidator,
                  postalCodeFieldName: widget.postalCodeFieldName,
                  streetLabelText: widget.streetLabelText,
                  streetSecondaryLabelText: widget.streetSecondaryLabelText,
                  cityLabelText: widget.cityLabelText,
                  stateLabelText: widget.stateLabelText,
                  postalCodeLabelText: widget.postalCodeLabelText,
                  streetValidator: widget.streetValidator,
                  streetSecondaryValidator: widget.streetSecondaryValidator,
                  cityValidator: widget.cityValidator,
                  stateValidator: widget.stateValidator,
                  postalCodeValidator: widget.postalCodeValidator,
                  onAddressSaved: _handleSaved,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
