import 'package:flutter_nominatim/flutter_nominatim.dart';

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

  factory PlacesPrediction.fromPlace(Place place) {
    final description = place.displayName;
    final split = description.split(',');
    final mainText = split.isNotEmpty ? split.first.trim() : description;
    final secondaryText =
        split.length > 1 ? split.sublist(1).map((e) => e.trim()).join(', ') : null;
    return PlacesPrediction(
      placeId: place.placeId,
      description: description,
      mainText: mainText.isEmpty ? null : mainText,
      secondaryText: secondaryText?.isEmpty == true ? null : secondaryText,
      details: PlaceDetails.fromPlace(place),
    );
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

  factory PlaceDetails.fromPlace(Place place) {
    return PlaceDetails(
      placeId: place.placeId,
      displayName: place.displayName,
      addressDetails: Map<String, dynamic>.from(place.addressDetails),
      latitude: place.latitude,
      longitude: place.longitude,
    );
  }
}
