// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventModel _$EventModelFromJson(Map<String, dynamic> json) => _EventModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: DateTime.parse(json['end_time'] as String),
  addressId: (json['address'] as num?)?.toInt(),
  address: json['address_model'] == null
      ? null
      : AddressModel.fromJson(json['address_model'] as Map<String, dynamic>),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  description: json['description'] as String?,
  imageUrl: json['image_url'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  active: json['active'] as bool? ?? true,
  isVolunteerEligible: json['is_volunteer_eligible'] as bool? ?? true,
  maxHours: (json['max_hours'] as num?)?.toInt(),
  maxVolunteers: (json['max_volunteers'] as num?)?.toInt(),
  registrationDeadline: json['registration_deadline'] == null
      ? null
      : DateTime.parse(json['registration_deadline'] as String),
  externalLink: json['external_link'] as String?,
  isPrivate: json['is_private'] as bool? ?? false,
  isVirtual: json['is_virtual'] as bool? ?? false,
);

Map<String, dynamic> _$EventModelToJson(_EventModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': instance.name,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'address': instance.addressId,
      'tags': instance.tags,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'active': instance.active,
      'is_volunteer_eligible': instance.isVolunteerEligible,
      'max_hours': instance.maxHours,
      'max_volunteers': instance.maxVolunteers,
      'registration_deadline': instance.registrationDeadline?.toIso8601String(),
      'external_link': instance.externalLink,
      'is_private': instance.isPrivate,
      'is_virtual': instance.isVirtual,
    };
