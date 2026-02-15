import 'dart:async';

import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/common/widgets/inputs/any_step_text_field.dart';
import 'package:anystep/core/features/location/data/places_api_client.dart';
import 'package:anystep/core/features/location/domain/places_models.dart';
import 'package:anystep/core/features/location/utils/place_to_address.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressAutocompleteField extends ConsumerStatefulWidget {
  const AddressAutocompleteField({
    super.key,
    required this.formKey,
    this.countryCode = 'US',
    this.enabled = true,
  });

  final GlobalKey<FormBuilderState> formKey;
  final String countryCode;
  final bool enabled;

  @override
  ConsumerState<AddressAutocompleteField> createState() => _AddressAutocompleteFieldState();
}

class _AddressAutocompleteFieldState extends ConsumerState<AddressAutocompleteField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;
  List<PlacesPrediction> _predictions = [];
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      setState(() {
        _predictions = [];
        _error = null;
      });
    }
  }

  void _onChanged(String? value) {
    _debounce?.cancel();
    final query = value?.trim() ?? '';
    if (query.isEmpty) {
      setState(() {
        _predictions = [];
        _error = null;
      });
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      setState(() {
        _isLoading = true;
        _error = null;
      });
      try {
        final results = await ref
            .read(placesApiClientProvider)
            .autocomplete(query, countryCode: widget.countryCode);
        if (!mounted) return;
        setState(() {
          _predictions = results;
          _isLoading = false;
        });
      } catch (e) {
        if (!mounted) return;
        setState(() {
          _predictions = [];
          _isLoading = false;
          _error = e.toString();
        });
      }
    });
  }

  Future<void> _selectPrediction(PlacesPrediction prediction) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final details = await ref.read(placesApiClientProvider).placeDetails(prediction.placeId);
      final parsed = placeDetailsToAddress(details);
      final form = widget.formKey.currentState;
      if (form == null) return;
      form.fields['street']?.didChange(parsed.street);
      form.fields['streetSecondary']?.didChange(parsed.streetSecondary);
      form.fields['city']?.didChange(parsed.city);
      form.fields['state']?.didChange(parsed.state);
      form.fields['postalCode']?.didChange(parsed.postalCode);
      form.fields['zipCode']?.didChange(parsed.postalCode);
      form.fields['placeId']?.didChange(parsed.placeId);
      form.fields['latitude']?.didChange(parsed.latitude);
      form.fields['longitude']?.didChange(parsed.longitude);
      form.fields['placeName']?.didChange(parsed.name ?? prediction.description);
      _controller.text = prediction.description;
      _controller.selection =
          TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
      _focusNode.unfocus();
      setState(() {
        _predictions = [];
        _isLoading = false;
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

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnyStepTextField(
          name: 'addressSearch',
          labelText: loc.searchAddress,
          hintText: loc.startTypingAddress,
          controller: _controller,
          focusNode: _focusNode,
          enabled: widget.enabled,
          onChanged: _onChanged,
          textInputAction: TextInputAction.search,
        ),
        if (_isLoading)
          Padding(
            padding: const EdgeInsets.only(bottom: AnyStepSpacing.sm4),
            child: LinearProgressIndicator(minHeight: 2),
          ),
        if (_error != null)
          Padding(
            padding: const EdgeInsets.only(bottom: AnyStepSpacing.sm4),
            child: Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        if (_predictions.isEmpty && !_isLoading && _controller.text.trim().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: AnyStepSpacing.sm4),
            child: Text(loc.noMatchesFound),
          ),
        if (_predictions.isNotEmpty)
          Card(
            margin: const EdgeInsets.only(bottom: AnyStepSpacing.sm8),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _predictions.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final prediction = _predictions[index];
                return ListTile(
                  title: Text(prediction.mainText ?? prediction.description),
                  subtitle:
                      prediction.secondaryText != null ? Text(prediction.secondaryText!) : null,
                  onTap: () => _selectPrediction(prediction),
                );
              },
            ),
          ),
      ],
    );
  }
}
