// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_subscription.freezed.dart';
part 'channel_subscription.g.dart';

@freezed
abstract class ChannelSubscriptionModel with _$ChannelSubscriptionModel {
  const factory ChannelSubscriptionModel({
    @JsonKey(includeIfNull: false) int? id,
    @JsonKey(name: 'channel_id') required int channelId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) DateTime? createdAt,
  }) = _ChannelSubscriptionModel;

  factory ChannelSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelSubscriptionModelFromJson(json);
}
