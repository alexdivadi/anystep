// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEventModel _$UserEventModelFromJson(Map<String, dynamic> json) =>
    _UserEventModel(
      id: (json['id'] as num?)?.toInt(),
      attended: json['attended'] as bool,
      userId: json['user'] as String?,
      user: json['user_model'] == null
          ? null
          : UserModel.fromJson(json['user_model'] as Map<String, dynamic>),
      eventId: (json['event'] as num?)?.toInt(),
      event: json['event_model'] == null
          ? null
          : EventModel.fromJson(json['event_model'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$UserEventModelToJson(_UserEventModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'attended': instance.attended,
      'user': instance.userId,
      'event': instance.eventId,
    };
