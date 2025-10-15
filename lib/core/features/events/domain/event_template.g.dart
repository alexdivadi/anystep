// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventTemplateModel _$EventTemplateModelFromJson(Map<String, dynamic> json) =>
    _EventTemplateModel(
      name: json['name'] as String,
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$EventTemplateModelToJson(_EventTemplateModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'tags': instance.tags,
      'imageUrl': instance.imageUrl,
    };
