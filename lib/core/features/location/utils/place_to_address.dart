import 'package:anystep/core/common/utils/state_utils.dart';
import 'package:anystep/core/features/location/domain/places_models.dart';

class ParsedPlaceAddress {
  ParsedPlaceAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.streetSecondary,
    this.placeId,
    this.name,
    this.latitude,
    this.longitude,
  });

  final String street;
  final String? streetSecondary;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String? placeId;
  final String? name;
  final double? latitude;
  final double? longitude;
}

ParsedPlaceAddress placeDetailsToAddress(PlaceDetails details) {
  String? firstValue(Iterable<String> keys) {
    for (final key in keys) {
      final value = details.addressDetails[key];
      if (value != null) {
        final trimmed = value.toString().trim();
        if (trimmed.isNotEmpty) return trimmed;
      }
    }
    return null;
  }

  final streetNumber = firstValue(['house_number', 'street_number']) ?? '';
  final route = firstValue(['road', 'pedestrian', 'footway', 'street', 'residential']) ?? '';
  final street = [streetNumber, route].where((p) => p.trim().isNotEmpty).join(' ').trim();
  final streetSecondary = firstValue(['unit', 'floor', 'flat', 'apartment', 'suite']);
  final city = firstValue(['city', 'town', 'village', 'hamlet', 'municipality', 'county']) ?? '';
  final rawState = firstValue(['state', 'region', 'state_district']) ?? '';
  final state = normalizeUsState(rawState) ?? rawState;
  final postalCode = firstValue(['postcode']) ?? '';
  final country = (firstValue(['country_code']) ?? 'US').toUpperCase();

  return ParsedPlaceAddress(
    street: street,
    streetSecondary: streetSecondary,
    city: city,
    state: state,
    postalCode: postalCode,
    country: country,
    placeId: details.placeId,
    latitude: details.latitude,
    longitude: details.longitude,
  );
}
