// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_comment.freezed.dart';
part 'blog_comment.g.dart';

@freezed
abstract class BlogCommentModel with _$BlogCommentModel {
  const factory BlogCommentModel({
    @JsonKey(includeIfNull: false) int? id,
    @JsonKey(name: 'channel_id') required int channelId,
    required String body,
    @JsonKey(name: 'created_by_user_id') required String createdByUserId,
    @JsonKey(name: 'is_pinned') @Default(false) bool isPinned,
    @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) DateTime? createdAt,
    @JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true) DateTime? updatedAt,
  }) = _BlogCommentModel;

  factory BlogCommentModel.fromJson(Map<String, dynamic> json) => _$BlogCommentModelFromJson(json);
}
