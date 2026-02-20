import 'dart:async';

import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/common/utils/snackbar_message.dart';
import 'package:anystep/core/common/utils/state_utils.dart';
import 'package:anystep/core/common/widgets/inputs/any_step_text_field.dart';
import 'package:anystep/core/features/location/data/address_repository.dart';
import 'package:anystep/core/features/location/data/places_api_client.dart';
import 'package:anystep/core/features/location/domain/address_model.dart';
import 'package:anystep/core/features/location/domain/places_models.dart';
import 'package:anystep/core/features/location/utils/place_to_address.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AnyStepAddressForm extends ConsumerStatefulWidget {
  const AnyStepAddressForm({
    super.key,
    required this.formKey,
    this.countryCode = 'US',
    this.enabled = true,
    this.disableSearch = false,
    this.includeEventAddresses = true,
    this.includeUserAddresses = true,
    this.isUserAddress = false,
    this.initialAddressId,
    this.addressIdFieldName = 'addressId',
    this.onAddressSaved,
    this.showSaveButton = true,
    this.showNameField = false,
    this.nameFieldName = 'addressName',
    this.nameLabelText,
    this.nameValidator,
    this.streetLabelText,
    this.streetSecondaryLabelText,
    this.cityLabelText,
    this.stateLabelText,
    this.postalCodeLabelText,
    this.postalCodeFieldName = 'postalCode',
    this.streetValidator,
    this.streetSecondaryValidator,
    this.cityValidator,
    this.stateValidator,
    this.postalCodeValidator,
    this.initialStreet,
    this.initialStreetSecondary,
    this.initialCity,
    this.initialState,
    this.initialPostalCode,
  });

  final GlobalKey<FormBuilderState> formKey;
  final String countryCode;
  final bool enabled;
  final bool disableSearch;
  final bool includeEventAddresses;
  final bool includeUserAddresses;
  final bool isUserAddress;
  final int? initialAddressId;
  final String addressIdFieldName;
  final ValueChanged<int?>? onAddressSaved;
  final bool showSaveButton;
  final bool showNameField;
  final String nameFieldName;
  final String? nameLabelText;
  final String? Function(String?)? nameValidator;
  final String? streetLabelText;
  final String? streetSecondaryLabelText;
  final String? cityLabelText;
  final String? stateLabelText;
  final String? postalCodeLabelText;
  final String postalCodeFieldName;
  final String? Function(String?)? streetValidator;
  final String? Function(String?)? streetSecondaryValidator;
  final String? Function(String?)? cityValidator;
  final String? Function(String?)? stateValidator;
  final String? Function(String?)? postalCodeValidator;
  final String? initialStreet;
  final String? initialStreetSecondary;
  final String? initialCity;
  final String? initialState;
  final String? initialPostalCode;

  @override
  ConsumerState<AnyStepAddressForm> createState() => _AnyStepAddressFormState();
}

class _AnyStepAddressFormState extends ConsumerState<AnyStepAddressForm> {
  final TextEditingController _streetController = TextEditingController();
  final FocusNode _streetFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _stateFocusNode = FocusNode();
  final FocusNode _postalCodeFocusNode = FocusNode();
  Timer? _debounce;
  bool _isLoading = false;
  bool _isSearchDisabled = false;
  bool _isApplyingSelection = false;
  bool _isSelectingFromList = false;
  bool _pointerDownOnResults = false;
  bool _searchActive = false;
  bool _isSaving = false;
  List<AddressModel> _dbResults = [];
  List<PlacesPrediction> _predictions = [];
  String? _error;
  String? _placeId;
  String? _placeName;
  double? _latitude;
  double? _longitude;
  int? _addressId;

  @override
  void initState() {
    super.initState();
    _streetController.text = widget.initialStreet ?? '';
    _streetFocusNode.addListener(_handleFocusChange);
    _isSearchDisabled = widget.disableSearch;
    _addressId = widget.initialAddressId;
    if (widget.initialAddressId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _loadInitialAddress());
    }
  }

  @override
  void didUpdateWidget(covariant AnyStepAddressForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.disableSearch && !_isSearchDisabled) {
      _isSearchDisabled = true;
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _streetController.dispose();
    _streetFocusNode.removeListener(_handleFocusChange);
    _streetFocusNode.dispose();
    _cityFocusNode.dispose();
    _stateFocusNode.dispose();
    _postalCodeFocusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!_streetFocusNode.hasFocus) {
      _searchActive = false;
      _debounce?.cancel();
      _isLoading = false;
      if (_isSelectingFromList || _pointerDownOnResults) return;
      Future.delayed(const Duration(milliseconds: 50), () {
        if (!mounted || _isSelectingFromList || _pointerDownOnResults) return;
        setState(() {
          _dbResults = [];
          _predictions = [];
          _error = null;
        });
      });
    }
  }

  Future<List<AddressModel>> _searchDb(String query) async {
    if (!widget.includeEventAddresses && !widget.includeUserAddresses) return [];
    final repo = ref.read(addressRepositoryProvider);
    return repo.search(
      query: query,
      includeEventAddresses: widget.includeEventAddresses,
      includeUserAddresses: widget.includeUserAddresses,
    );
  }

  void _clearPlaceFieldsIfManualEdit() {
    if (_isApplyingSelection) return;
    final form = widget.formKey.currentState;
    if (form == null) return;
    _placeId = null;
    _placeName = null;
    _latitude = null;
    _longitude = null;
    _addressId = null;
    form.fields[widget.addressIdFieldName]?.didChange(null);
    widget.onAddressSaved?.call(null);
  }

  void _onStreetChanged(String? value) {
    if (_isApplyingSelection) return;
    _clearPlaceFieldsIfManualEdit();
    _debounce?.cancel();
    final query = value?.trim() ?? '';
    if (query.isEmpty) {
      _searchActive = false;
      _isLoading = false;
      setState(() {
        _dbResults = [];
        _predictions = [];
        _error = null;
      });
      return;
    }
    _searchActive = true;
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      setState(() {
        _isLoading = true;
        _error = null;
      });
      try {
        final dbResults = await _searchDb(query);
        if (!mounted) return;
        var predictions = <PlacesPrediction>[];
        if (!_isSearchDisabled) {
          try {
            predictions = await ref
                .read(placesApiClientProvider)
                .autocomplete(query, countryCode: widget.countryCode, limit: 5);
          } catch (e) {
            _isSearchDisabled = true;
            _error = e.toString();
          }
        }
        if (!mounted) return;
        setState(() {
          _dbResults = dbResults;
          _predictions = predictions;
          _isLoading = false;
        });
      } catch (e) {
        if (!mounted) return;
        setState(() {
          _dbResults = [];
          _predictions = [];
          _isLoading = false;
          _error = e.toString();
        });
      }
    });
  }

  String? _validateState(String? value, AppLocalizations loc) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) return loc.validatorState;
    if (!isValidUsState(trimmed)) return loc.validatorState;
    return null;
  }

  void _selectAddress(AddressModel address) {
    final form = widget.formKey.currentState;
    if (form == null) return;
    _isApplyingSelection = true;
    _debounce?.cancel();
    _isLoading = false;
    if (widget.showNameField) {
      form.fields[widget.nameFieldName]?.didChange(address.name);
    }
    form.fields['street']?.didChange(address.street);
    form.fields['streetSecondary']?.didChange(address.streetSecondary);
    form.fields['city']?.didChange(address.city);
    form.fields['state']?.didChange(address.state);
    form.fields[widget.postalCodeFieldName]?.didChange(address.postalCode);
    _placeId = address.placeId;
    _placeName = address.name;
    _latitude = address.latitude;
    _longitude = address.longitude;
    _addressId = address.id;
    if (address.id != null) {
      form.fields[widget.addressIdFieldName]?.didChange(address.id);
      form.save();
      widget.onAddressSaved?.call(address.id);
    } else {
      Log.w('Selected address missing id', address.toJson());
    }
    _streetController.text = address.street;
    _streetController.selection = TextSelection.fromPosition(
      TextPosition(offset: _streetController.text.length),
    );
    _streetFocusNode.unfocus();
    _isApplyingSelection = false;
    _searchActive = false;
    _isSelectingFromList = false;
    setState(() {
      _dbResults = [];
      _predictions = [];
      _error = null;
    });
  }

  Future<void> _selectPrediction(PlacesPrediction prediction) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final parsed = placeDetailsToAddress(prediction.details);
      final form = widget.formKey.currentState;
      if (form == null) return;
      _isApplyingSelection = true;
      _debounce?.cancel();
      _addressId = null;
      form.fields[widget.addressIdFieldName]?.didChange(null);
      if (widget.showNameField) {
        final nameValue = parsed.name ?? prediction.mainText ?? prediction.description;
        form.fields[widget.nameFieldName]?.didChange(nameValue);
      }
      form.fields['street']?.didChange(parsed.street);
      form.fields['streetSecondary']?.didChange(parsed.streetSecondary);
      form.fields['city']?.didChange(parsed.city);
      form.fields['state']?.didChange(parsed.state);
      form.fields[widget.postalCodeFieldName]?.didChange(parsed.postalCode);
      _placeId = parsed.placeId;
      _placeName = parsed.name;
      _latitude = parsed.latitude;
      _longitude = parsed.longitude;
      _streetController.text = parsed.street.isNotEmpty ? parsed.street : prediction.description;
      _streetController.selection = TextSelection.fromPosition(
        TextPosition(offset: _streetController.text.length),
      );
      _streetFocusNode.unfocus();
      _isApplyingSelection = false;
      _searchActive = false;
      _isSelectingFromList = false;
      setState(() {
        _dbResults = [];
        _predictions = [];
        _isLoading = false;
        _error = null;
      });
    } catch (e, stackTrace) {
      Log.e('Places selection error', e, stackTrace);
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  Future<void> _loadInitialAddress() async {
    final form = widget.formKey.currentState;
    if (form == null || widget.initialAddressId == null) return;
    try {
      _isApplyingSelection = true;
      _searchActive = false;
      _debounce?.cancel();
      final repo = ref.read(addressRepositoryProvider);
      final address = await repo.get(documentId: widget.initialAddressId.toString());
      _placeId = address.placeId;
      _placeName = address.name;
      if (widget.showNameField) {
        form.fields[widget.nameFieldName]?.didChange(address.name);
      }
      _latitude = address.latitude;
      _longitude = address.longitude;
      form.fields['street']?.didChange(address.street);
      form.fields['streetSecondary']?.didChange(address.streetSecondary);
      form.fields['city']?.didChange(address.city);
      form.fields['state']?.didChange(address.state);
      form.fields[widget.postalCodeFieldName]?.didChange(address.postalCode);
      form.fields[widget.addressIdFieldName]?.didChange(address.id);
      _streetController.text = address.street;
      _streetController.selection = TextSelection.fromPosition(
        TextPosition(offset: _streetController.text.length),
      );
    } catch (e, stackTrace) {
      Log.e('Error loading address', e, stackTrace);
    } finally {
      _isApplyingSelection = false;
    }
  }

  Future<void> _saveAddressIfComplete() async {
    final form = widget.formKey.currentState;
    if (form == null) return;
    final nameValue = form.fields[widget.nameFieldName]?.value?.toString().trim();
    final street = form.fields['street']?.value?.toString().trim() ?? '';
    final city = form.fields['city']?.value?.toString().trim() ?? '';
    final rawState = form.fields['state']?.value?.toString().trim() ?? '';
    final normalizedState = normalizeUsState(rawState);
    final state = normalizedState ?? rawState;
    if (normalizedState != null && normalizedState != rawState) {
      form.fields['state']?.didChange(normalizedState);
    }
    final postal = form.fields[widget.postalCodeFieldName]?.value?.toString().trim() ?? '';
    if (street.isEmpty || city.isEmpty || state.isEmpty || postal.isEmpty) return;
    final address = AddressModel.withGeohash(
      street: street,
      streetSecondary: form.fields['streetSecondary']?.value?.toString(),
      city: city,
      state: state,
      country: widget.countryCode,
      postalCode: postal,
      isUserAddress: widget.isUserAddress,
      latitude: _latitude,
      longitude: _longitude,
      placeId: _placeId,
      name: (nameValue != null && nameValue.isNotEmpty) ? nameValue : _placeName,
    );
    try {
      setState(() => _isSaving = true);
      final repo = ref.read(addressRepositoryProvider);
      final saved = await repo.createOrUpdate(obj: address, documentId: _addressId?.toString());
      _addressId = saved.id;
      form.fields[widget.addressIdFieldName]?.didChange(saved.id);
      widget.onAddressSaved?.call(saved.id);
      if (mounted) {
        final loc = AppLocalizations.of(context);
        context.showSuccessSnackbar(loc.addressSaved);
      }
    } catch (e, stackTrace) {
      Log.e('Error saving address', e, stackTrace);
      if (mounted) {
        final loc = AppLocalizations.of(context);
        context.showErrorSnackbar(loc.addressSaveFailed);
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnyStepTextField(
          name: 'street',
          labelText: widget.streetLabelText ?? loc.streetAddress,
          hintText: loc.startTypingAddress,
          controller: _streetController,
          focusNode: _streetFocusNode,
          enabled: widget.enabled,
          onChanged: _onStreetChanged,
          textInputAction: TextInputAction.search,
          validator: widget.streetValidator ?? FormBuilderValidators.street(),
        ),
        if (_isLoading)
          const Padding(
            padding: EdgeInsets.only(bottom: AnyStepSpacing.sm4),
            child: LinearProgressIndicator(minHeight: 2),
          ),
        if (_error != null && !_isSearchDisabled)
          Padding(
            padding: const EdgeInsets.only(bottom: AnyStepSpacing.sm4),
            child: Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),
        if (_searchActive &&
            _dbResults.isEmpty &&
            _predictions.isEmpty &&
            !_isLoading &&
            _streetController.text.trim().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: AnyStepSpacing.sm4),
            child: Text(loc.noMatchesFound),
          ),
        if (_searchActive &&
            (_dbResults.isNotEmpty || (!_isSearchDisabled && _predictions.isNotEmpty)))
          Listener(
            onPointerDown: (_) {
              _pointerDownOnResults = true;
              _isSelectingFromList = true;
            },
            onPointerUp: (_) {
              _pointerDownOnResults = false;
              _isSelectingFromList = false;
            },
            onPointerCancel: (_) {
              _pointerDownOnResults = false;
              _isSelectingFromList = false;
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: AnyStepSpacing.sm8),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _dbResults.length + _predictions.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  if (index < _dbResults.length) {
                    final address = _dbResults[index];
                    final title = address.name ?? address.formattedAddress;
                    final subtitle = address.name != null ? address.formattedAddress : null;
                    return InkWell(
                      onTap: () => _selectAddress(address),
                      child: ListTile(
                        title: Text(title),
                        subtitle: subtitle != null ? Text(subtitle) : null,
                      ),
                    );
                  }
                  final prediction = _predictions[index - _dbResults.length];
                  return InkWell(
                    onTap: () => _selectPrediction(prediction),
                    child: ListTile(
                      title: Text(prediction.mainText ?? prediction.description),
                      subtitle: prediction.secondaryText != null
                          ? Text(prediction.secondaryText!)
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
        FormBuilderField<int>(
          name: widget.addressIdFieldName,
          initialValue: widget.initialAddressId,
          builder: (field) => const SizedBox.shrink(),
        ),
        AnyStepTextField(
          name: 'streetSecondary',
          initialValue: widget.initialStreetSecondary,
          labelText: widget.streetSecondaryLabelText ?? loc.apartmentSuiteOptional,
          validator:
              widget.streetSecondaryValidator ??
              FormBuilderValidators.street(checkNullOrEmpty: false),
        ),
        Row(
          children: [
            Flexible(
              flex: 4,
              child: AnyStepTextField(
                name: 'city',
                initialValue: widget.initialCity,
                labelText: widget.cityLabelText ?? loc.city,
                validator: widget.cityValidator ?? FormBuilderValidators.city(),
                focusNode: _cityFocusNode,
              ),
            ),
            const SizedBox(width: AnyStepSpacing.sm2),
            Flexible(
              flex: 2,
              child: AnyStepTextField(
                name: 'state',
                initialValue: widget.initialState,
                labelText: widget.stateLabelText ?? loc.state,
                validator: widget.stateValidator ?? (value) => _validateState(value, loc),
                focusNode: _stateFocusNode,
              ),
            ),
            const SizedBox(width: AnyStepSpacing.sm2),
            Flexible(
              flex: 3,
              child: AnyStepTextField(
                name: widget.postalCodeFieldName,
                initialValue: widget.initialPostalCode,
                labelText: widget.postalCodeLabelText ?? loc.postalCode,
                keyboardType: TextInputType.number,
                validator: widget.postalCodeValidator ?? FormBuilderValidators.zipCode(),
                focusNode: _postalCodeFocusNode,
              ),
            ),
          ],
        ),
        if (widget.showNameField) ...[
          const SizedBox(height: AnyStepSpacing.sm4),
          AnyStepTextField(
            name: widget.nameFieldName,
            labelText: widget.nameLabelText ?? "${loc.nameLabel} (${loc.optional})",
            validator: widget.nameValidator,
          ),
        ],
        if (widget.showSaveButton)
          Padding(
            padding: const EdgeInsets.only(top: AnyStepSpacing.sm8),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _isSaving ? null : _saveAddressIfComplete,
                child: _isSaving
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                      )
                    : Text(loc.save),
              ),
            ),
          ),
      ],
    );
  }
}
