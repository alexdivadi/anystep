// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BlogCommentModel _$BlogCommentModelFromJson(Map<String, dynamic> json) =>
    _BlogCommentModel(
      id: (json['id'] as num?)?.toInt(),
      channelId: (json['channel_id'] as num).toInt(),
      body: json['body'] as String,
      createdByUserId: json['created_by_user_id'] as String,
      isPinned: json['is_pinned'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$BlogCommentModelToJson(_BlogCommentModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'channel_id': instance.channelId,
      'body': instance.body,
      'created_by_user_id': instance.createdByUserId,
      'is_pinned': instance.isPinned,
    };
