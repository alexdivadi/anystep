import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/features/location/domain/places_models.dart';
import 'package:flutter_nominatim/flutter_nominatim.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'places_api_client.g.dart';

class PlacesApiClient {
  PlacesApiClient({Nominatim? nominatim}) : _nominatim = nominatim ?? Nominatim.instance;

  Future<List<PlacesPrediction>> autocomplete(
    String query, {
    String countryCode = 'US',
    int? limit,
  }) async {
    if (query.trim().isEmpty) return [];
    final normalizedQuery = countryCode.trim().isEmpty ? query : '$query, ${countryCode.trim()}';
    try {
      final results = await _nominatim.search(normalizedQuery);
      return (limit != null ? results.take(limit) : results)
          .map(PlacesPrediction.fromPlace)
          .toList();
    } catch (e, stackTrace) {
      Log.e('Nominatim search error', e, stackTrace);
      rethrow;
    }
  }

  final Nominatim _nominatim;
}

@riverpod
PlacesApiClient placesApiClient(Ref ref) {
  return PlacesApiClient();
}
