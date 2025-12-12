// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressModel _$AddressModelFromJson(Map<String, dynamic> json) =>
    _AddressModel(
      id: (json['id'] as num?)?.toInt(),
      street: json['street'] as String,
      streetSecondary: json['street_secondary'] as String?,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String?,
      postalCode: json['postal_code'] as String,
      isUserAddress: json['is_user_address'] as bool,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      placeId: json['place_id'] as String?,
      name: json['name'] as String?,
      geohash: json['geohash'] as String?,
    );

Map<String, dynamic> _$AddressModelToJson(_AddressModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'street': instance.street,
      'street_secondary': instance.streetSecondary,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postal_code': instance.postalCode,
      'is_user_address': instance.isUserAddress,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'place_id': instance.placeId,
      'name': instance.name,
      'geohash': instance.geohash,
    };
