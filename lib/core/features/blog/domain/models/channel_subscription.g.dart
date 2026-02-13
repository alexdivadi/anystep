// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChannelSubscriptionModel _$ChannelSubscriptionModelFromJson(
  Map<String, dynamic> json,
) => _ChannelSubscriptionModel(
  id: (json['id'] as num?)?.toInt(),
  channelId: (json['channel_id'] as num).toInt(),
  userId: json['user_id'] as String,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ChannelSubscriptionModelToJson(
  _ChannelSubscriptionModel instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'channel_id': instance.channelId,
  'user_id': instance.userId,
};
