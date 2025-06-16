// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventModel _$EventModelFromJson(Map<String, dynamic> json) => _EventModel(
  id: json['id'] as String,
  name: json['name'] as String,
  template:
      json['template'] == null
          ? null
          : EventTemplateModel.fromJson(
            json['template'] as Map<String, dynamic>,
          ),
  startTime: DateTime.parse(json['startTime'] as String),
  endTime: DateTime.parse(json['endTime'] as String),
  address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  description: json['description'] as String?,
  imageUrl: json['imageUrl'] as String?,
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$EventModelToJson(_EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'template': instance.template,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'address': instance.address,
      'tags': instance.tags,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
