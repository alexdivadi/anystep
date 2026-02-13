// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BlogChannelModel _$BlogChannelModelFromJson(Map<String, dynamic> json) =>
    _BlogChannelModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      eventId: (json['event_id'] as num?)?.toInt(),
      commentPolicy: $enumDecode(
        _$BlogCommentPolicyEnumMap,
        json['comment_policy'],
      ),
      isClosed: json['is_closed'] as bool? ?? false,
      createdByAdminId: json['created_by_admin_id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$BlogChannelModelToJson(_BlogChannelModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'title': instance.title,
      'description': instance.description,
      'event_id': instance.eventId,
      'comment_policy': _$BlogCommentPolicyEnumMap[instance.commentPolicy]!,
      'is_closed': instance.isClosed,
      'created_by_admin_id': instance.createdByAdminId,
    };

const _$BlogCommentPolicyEnumMap = {
  BlogCommentPolicy.adminsOnly: 'admins_only',
  BlogCommentPolicy.authenticated: 'authenticated',
};
