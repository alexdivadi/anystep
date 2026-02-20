import 'package:dart_geohash/dart_geohash.dart';

final geoHasher = GeoHasher();

/// Utility function to calculate geohash from latitude and longitude.
String? calculateGeohash(double? latitude, double? longitude, {int precision = 9}) {
  if (latitude == null || longitude == null) return null;
  // dart_geohash expects (longitude, latitude)
  try {
    final geohash = geoHasher.encode(longitude, latitude, precision: precision);
    return geohash;
  } catch (_) {
    return null;
  }
}
