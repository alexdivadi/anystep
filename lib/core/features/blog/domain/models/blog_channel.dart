// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_channel.freezed.dart';
part 'blog_channel.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum BlogCommentPolicy { adminsOnly, authenticated }

@freezed
abstract class BlogChannelModel with _$BlogChannelModel {
  const factory BlogChannelModel({
    @JsonKey(includeIfNull: false) int? id,
    required String title,
    String? description,
    @JsonKey(name: 'event_id') int? eventId,
    @JsonKey(name: 'comment_policy') required BlogCommentPolicy commentPolicy,
    @JsonKey(name: 'is_closed') @Default(false) bool isClosed,
    @JsonKey(name: 'created_by_admin_id') String? createdByAdminId,
    @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) DateTime? createdAt,
    @JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true) DateTime? updatedAt,
  }) = _BlogChannelModel;

  factory BlogChannelModel.fromJson(Map<String, dynamic> json) => _$BlogChannelModelFromJson(json);
}
