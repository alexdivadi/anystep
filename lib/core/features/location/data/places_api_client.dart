import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/features/location/domain/places_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_osm_interface/flutter_osm_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'places_api_client.g.dart';

class PlacesApiClient {
  static const _photonBaseUrl = 'https://photon.komoot.io/api/';

  PlacesApiClient({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<PlacesPrediction>> autocomplete(
    String query, {
    String countryCode = 'US',
    int? limit,
  }) async {
    if (query.trim().isEmpty) return [];
    final normalizedQuery = countryCode.trim().isEmpty
        ? query.trim()
        : '${query.trim()}, ${countryCode.trim()}';
    try {
      final locale = _mapLocale(countryCode);
      final response = await _dio.get(
        _photonBaseUrl,
        queryParameters: {
          'q': normalizedQuery,
          'limit': limit ?? 10,
          if (locale.isNotEmpty) 'lang': locale,
        },
        options: Options(
          headers: const {
            // Photon demo server expects a descriptive User-Agent.
            // Update with a contact URL/email if you have one.
            'User-Agent': 'AnyStepApp/1.0',
          },
        ),
      );
      final data = response.data as Map<String, dynamic>;
      final features = (data['features'] as List?) ?? const [];
      final results = features.map((d) => SearchInfo.fromPhotonAPI(d)).toList();
      return results.map(PlacesPrediction.fromSearchInfo).toList();
    } catch (e, stackTrace) {
      Log.e('Address suggestion error', e, stackTrace);
      rethrow;
    }
  }

  String _mapLocale(String countryCode) {
    final normalized = countryCode.trim().toLowerCase();
    switch (normalized) {
      case 'de':
      case 'en':
      case 'fr':
        return normalized;
      default:
        return 'en';
    }
  }

  final Dio _dio;
}

@riverpod
PlacesApiClient placesApiClient(Ref ref) {
  return PlacesApiClient();
}
