class PlacesPrediction {
  PlacesPrediction({
    required this.placeId,
    required this.description,
    this.mainText,
    this.secondaryText,
  });

  final String placeId;
  final String description;
  final String? mainText;
  final String? secondaryText;

  factory PlacesPrediction.fromJson(Map<String, dynamic> json) {
    final placePrediction = json['placePrediction'] as Map<String, dynamic>? ?? json;
    final text = placePrediction['text'] as Map<String, dynamic>?;
    final structured = placePrediction['structuredFormat'] as Map<String, dynamic>?;
    final mainText = structured?['mainText'] as Map<String, dynamic>?;
    final secondaryText = structured?['secondaryText'] as Map<String, dynamic>?;
    return PlacesPrediction(
      placeId: (placePrediction['placeId'] ?? placePrediction['place_id'] ?? '').toString(),
      description: (text?['text'] ?? placePrediction['description'] ?? '').toString(),
      mainText: (mainText?['text'] ?? '').toString().trim().isEmpty
          ? null
          : (mainText?['text'] ?? '').toString(),
      secondaryText: (secondaryText?['text'] ?? '').toString().trim().isEmpty
          ? null
          : (secondaryText?['text'] ?? '').toString(),
    );
  }
}

class AddressComponent {
  AddressComponent({required this.longText, required this.shortText, required this.types});

  final String longText;
  final String shortText;
  final List<String> types;

  factory AddressComponent.fromJson(Map<String, dynamic> json) {
    final types = (json['types'] as List<dynamic>? ?? []).map((e) => e.toString()).toList();
    return AddressComponent(
      longText: (json['longText'] ?? json['long_name'] ?? '').toString(),
      shortText: (json['shortText'] ?? json['short_name'] ?? '').toString(),
      types: types,
    );
  }
}

class PlaceDetails {
  PlaceDetails({
    required this.placeId,
    required this.name,
    required this.addressComponents,
    required this.latitude,
    required this.longitude,
  });

  final String placeId;
  final String? name;
  final List<AddressComponent> addressComponents;
  final double? latitude;
  final double? longitude;

  factory PlaceDetails.fromJson(Map<String, dynamic> json) {
    final components = (json['addressComponents'] as List<dynamic>? ?? [])
        .map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
        .toList();
    final location = json['location'] as Map<String, dynamic>? ?? {};
    final displayName = json['displayName'] as Map<String, dynamic>?;
    return PlaceDetails(
      placeId: (json['id'] ?? json['placeId'] ?? json['place_id'] ?? '').toString(),
      name: (displayName?['text'] ?? json['name'])?.toString(),
      addressComponents: components,
      latitude: (location['latitude'] as num?)?.toDouble(),
      longitude: (location['longitude'] as num?)?.toDouble(),
    );
  }
}
