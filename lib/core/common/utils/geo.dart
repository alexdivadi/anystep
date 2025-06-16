import 'package:dart_geohash/dart_geohash.dart';

final geoHasher = GeoHasher();

/// Utility function to calculate geohash from latitude and longitude.
String? calculateGeohash(double? latitude, double? longitude, {int precision = 9}) {
  if (latitude == null || longitude == null) return null;
  final geohash = geoHasher.encode(latitude, longitude, precision: precision);
  return geohash;
}
