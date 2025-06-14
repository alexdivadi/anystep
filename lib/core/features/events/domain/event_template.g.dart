// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventTemplateModel _$EventTemplateModelFromJson(Map<String, dynamic> json) =>
    EventTemplateModel(
      name: json['name'] as String,
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$EventTemplateModelToJson(EventTemplateModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'tags': instance.tags,
      'image_url': instance.imageUrl,
    };
