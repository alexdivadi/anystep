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
  String? componentLong(String type) {
    final component = details.addressComponents.where((c) => c.types.contains(type)).toList();
    return component.isNotEmpty ? component.first.longText : null;
  }

  String? componentShort(String type) {
    final component = details.addressComponents.where((c) => c.types.contains(type)).toList();
    return component.isNotEmpty ? component.first.shortText : null;
  }

  final streetNumber = componentLong('street_number') ?? '';
  final route = componentLong('route') ?? '';
  final street = [streetNumber, route].where((p) => p.trim().isNotEmpty).join(' ').trim();
  final streetSecondary = componentLong('subpremise');
  final city =
      componentLong('locality') ??
      componentLong('postal_town') ??
      componentLong('administrative_area_level_2') ??
      '';
  final state = componentShort('administrative_area_level_1') ?? '';
  final postalCode = componentLong('postal_code') ?? '';
  final country = componentShort('country') ?? 'US';

  return ParsedPlaceAddress(
    street: street,
    streetSecondary: streetSecondary,
    city: city,
    state: state,
    postalCode: postalCode,
    country: country,
    placeId: details.placeId,
    name: details.name,
    latitude: details.latitude,
    longitude: details.longitude,
  );
}
