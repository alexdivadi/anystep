// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
  id: json['id'] as String,
  name: json['name'] as String,
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: DateTime.parse(json['end_time'] as String),
  address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
  updatedOn: DateTime.parse(json['updatedOn'] as String),
  createdOn: DateTime.parse(json['createdOn'] as String),
  template:
      json['template'] == null
          ? null
          : EventTemplateModel.fromJson(
            json['template'] as Map<String, dynamic>,
          ),
  description: json['description'] as String?,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  imageUrl: json['image_url'] as String?,
);

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'template': instance.template,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'address': instance.address,
      'updatedOn': instance.updatedOn.toIso8601String(),
      'createdOn': instance.createdOn.toIso8601String(),
      'description': instance.description,
      'tags': instance.tags,
      'image_url': instance.imageUrl,
    };
