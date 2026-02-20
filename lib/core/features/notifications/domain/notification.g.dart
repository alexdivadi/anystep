// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String,
      image: json['image'] as String?,
      group: json['group'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      isRead: json['read'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'body': instance.body,
      'image': instance.image,
      'group': instance.group,
      'created_at': instance.createdAt.toIso8601String(),
      'read': instance.isRead,
    };
