import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/features/location/domain/places_models.dart';
import 'package:anystep/env/env.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'places_api_client.g.dart';

class PlacesApiClient {
  PlacesApiClient({Dio? dio, String? apiKey})
      : _dio =
            dio ??
            Dio(
              BaseOptions(
                baseUrl: 'https://places.googleapis.com/v1/',
                connectTimeout: const Duration(seconds: 10),
                receiveTimeout: const Duration(seconds: 10),
              ),
            ),
        _apiKey = apiKey ?? Env.placesApiKey;

  final Dio _dio;
  final String _apiKey;
  final Map<String, PlaceDetails> _detailsCache = {};

  Future<List<PlacesPrediction>> autocomplete(String query, {String countryCode = 'US'}) async {
    if (query.trim().isEmpty) return [];
    if (_apiKey.isEmpty) {
      Log.w('Places API key missing; set GOOGLE_PLACES_API_KEY via --dart-define.');
      return [];
    }
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'places:autocomplete',
        data: {
          'input': query,
          'includedRegionCodes': [countryCode],
        },
        options: Options(
          headers: {
            'X-Goog-Api-Key': _apiKey,
            'X-Goog-FieldMask':
                'suggestions.placePrediction.placeId,'
                'suggestions.placePrediction.text,'
                'suggestions.placePrediction.structuredFormat',
          },
        ),
      );
      final suggestions = response.data?['suggestions'] as List<dynamic>? ?? [];
      return suggestions
          .map((e) => PlacesPrediction.fromJson(e as Map<String, dynamic>))
          .where((p) => p.placeId.isNotEmpty)
          .toList();
    } catch (e, stackTrace) {
      Log.e('Places autocomplete error', e, stackTrace);
      rethrow;
    }
  }

  Future<PlaceDetails> placeDetails(String placeId) async {
    if (_detailsCache.containsKey(placeId)) return _detailsCache[placeId]!;
    if (_apiKey.isEmpty) {
      throw StateError('Places API key missing; set GOOGLE_PLACES_API_KEY via --dart-define.');
    }
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        'places/$placeId',
        options: Options(
          headers: {
            'X-Goog-Api-Key': _apiKey,
            'X-Goog-FieldMask': 'id,displayName,addressComponents,location',
          },
        ),
      );
      final details = PlaceDetails.fromJson(response.data ?? {});
      _detailsCache[placeId] = details;
      return details;
    } catch (e, stackTrace) {
      Log.e('Places details error', e, stackTrace);
      rethrow;
    }
  }
}

@riverpod
PlacesApiClient placesApiClient(Ref ref) {
  return PlacesApiClient();
}
