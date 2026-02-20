// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(includeIfNull: false) String? id,
    @JsonKey(name: "user_id") String? userId,
    String? title,
    required String body,
    String? image,
    String? group,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "read") @Default(false) bool isRead,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
