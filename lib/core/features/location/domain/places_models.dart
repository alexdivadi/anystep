import 'package:flutter_osm_interface/flutter_osm_interface.dart';

class PlacesPrediction {
  PlacesPrediction({
    required this.placeId,
    required this.description,
    required this.details,
    this.mainText,
    this.secondaryText,
  });

  final String placeId;
  final String description;
  final String? mainText;
  final String? secondaryText;
  final PlaceDetails details;

  factory PlacesPrediction.fromSearchInfo(SearchInfo info) {
    final address = info.address;
    final description = address?.toString(separator: ", ") ?? '';
    final mainText = _formatMainText(address, description);
    final secondaryText = _formatSecondaryText(address, description, mainText);
    return PlacesPrediction(
      placeId: _buildPlaceId(info, description),
      description: description.isNotEmpty ? description : mainText,
      mainText: mainText,
      secondaryText: secondaryText,
      details: PlaceDetails.fromSearchInfo(info),
    );
  }

  static String _formatMainText(Address? address, String fallback) {
    if (address == null) return fallback.isNotEmpty ? fallback : '';
    final name = address.name?.trim();
    if (name != null && name.isNotEmpty) return name;
    final street = address.street?.trim();
    final house = address.housenumber?.trim();
    if (street != null && street.isNotEmpty && house != null && house.isNotEmpty) {
      return '$street $house';
    }
    if (street != null && street.isNotEmpty) return street;
    return fallback;
  }

  static String? _formatSecondaryText(Address? address, String description, String? mainText) {
    if (address == null) return null;
    final parts = <String>[];
    final city = address.city?.trim();
    final state = address.state?.trim();
    final postcode = address.postcode?.trim();
    final country = address.country?.trim();
    if (city != null && city.isNotEmpty) parts.add(city);
    if (state != null && state.isNotEmpty) parts.add(state);
    if (postcode != null && postcode.isNotEmpty) parts.add(postcode);
    if (country != null && country.isNotEmpty) parts.add(country);
    final secondary = parts.join(', ');
    if (secondary.isEmpty) return null;
    if (mainText != null && description.startsWith(mainText)) {
      return secondary;
    }
    return secondary;
  }

  static String _buildPlaceId(SearchInfo info, String description) {
    final point = info.point;
    final lat = point?.latitude.toStringAsFixed(6) ?? '0';
    final lng = point?.longitude.toStringAsFixed(6) ?? '0';
    final base = description.isNotEmpty ? description : 'unknown';
    return '$lat,$lng:$base';
  }
}

class PlaceDetails {
  PlaceDetails({
    required this.placeId,
    required this.displayName,
    required this.addressDetails,
    required this.latitude,
    required this.longitude,
  });

  final String placeId;
  final String displayName;
  final Map<String, dynamic> addressDetails;
  final double latitude;
  final double longitude;

  factory PlaceDetails.fromSearchInfo(SearchInfo info) {
    final address = info.address;
    final point = info.point;
    final addressDetails = <String, dynamic>{
      if (address?.street != null) 'road': address?.street,
      if (address?.housenumber != null) 'house_number': address?.housenumber,
      if (address?.postcode != null) 'postcode': address?.postcode,
      if (address?.city != null) 'city': address?.city,
      if (address?.state != null) 'state': address?.state,
      if (address?.country != null) 'country': address?.country,
      if (address?.name != null) 'name': address?.name,
    };
    return PlaceDetails(
      placeId: PlacesPrediction._buildPlaceId(info, address?.toString(separator: ", ") ?? ''),
      displayName: address?.toString(separator: ", ") ?? '',
      addressDetails: addressDetails,
      latitude: point?.latitude ?? 0,
      longitude: point?.longitude ?? 0,
    );
  }
}
