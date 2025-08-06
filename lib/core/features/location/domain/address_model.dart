// ignore_for_file: invalid_annotation_target

import 'package:anystep/core/common/utils/geo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
abstract class AddressModel with _$AddressModel {
  const factory AddressModel({
    @JsonKey(includeIfNull: false) int? id,
    required String street,
    @JsonKey(name: "street_secondary") String? streetSecondary,
    required String city,
    required String state,
    String? country,
    @JsonKey(name: "postal_code") required String postalCode,
    @JsonKey(name: "is_user_address") required bool isUserAddress,
    double? latitude,
    double? longitude,
    @JsonKey(name: "place_id") String? placeId,
    String? name,
    String? geohash,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

  factory AddressModel.withGeohash({
    int? id,
    required String street,
    String? streetSecondary,
    required String city,
    required String state,
    required String country,
    required String postalCode,
    required bool isUserAddress,
    double? latitude,
    double? longitude,
    String? placeId,
    String? name,
  }) {
    final geohash = calculateGeohash(latitude, longitude);
    return AddressModel(
      id: id,
      street: street,
      streetSecondary: streetSecondary,
      city: city,
      state: state,
      country: country,
      postalCode: postalCode,
      isUserAddress: isUserAddress,
      latitude: latitude,
      longitude: longitude,
      placeId: placeId,
      name: name,
      geohash: geohash,
    );
  }
}
