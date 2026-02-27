// ignore_for_file: invalid_annotation_target

import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.freezed.dart';
part 'user_event.g.dart';

@freezed
abstract class UserEventModel with _$UserEventModel {
  const factory UserEventModel({
    @JsonKey(includeIfNull: false) int? id,
    required bool attended,
    @JsonKey(name: "user") String? userId,
    @JsonKey(name: "user_model", includeToJson: false, includeFromJson: true) UserModel? user,
    @JsonKey(name: "event") int? eventId,
    @JsonKey(name: "event_model", includeToJson: false, includeFromJson: true) EventModel? event,
    @JsonKey(name: "check_in_at", includeIfNull: false) DateTime? checkInAt,
    @JsonKey(name: "check_out_at", includeIfNull: false) DateTime? checkOutAt,
    @JsonKey(name: "created_at", includeToJson: false, includeFromJson: true) DateTime? createdAt,
  }) = _UserEventModel;

  factory UserEventModel.fromJson(Map<String, dynamic> json) => _$UserEventModelFromJson(json);
}
