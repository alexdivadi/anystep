// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
  street: json['street'] as String,
  city: json['city'] as String,
  state: json['state'] as String,
  country: json['country'] as String,
  postalCode: json['postalCode'] as String,
  isUserAddress: json['is_user_address'] as bool,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  placeId: json['placeId'] as String?,
  name: json['name'] as String?,
  geohash: json['geohash'] as String?,
);

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postalCode': instance.postalCode,
      'is_user_address': instance.isUserAddress,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'placeId': instance.placeId,
      'name': instance.name,
      'geohash': instance.geohash,
    };
