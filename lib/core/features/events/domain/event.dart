// ignore_for_file: invalid_annotation_target

import 'package:anystep/core/features/location/domain/address_model.dart';
// import 'package:anystep/core/features/events/domain/event_template.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
abstract class EventModel with _$EventModel {
  const factory EventModel({
    required String id,
    required String name,
    // EventTemplateModel? template,
    @JsonKey(name: "start_time") required DateTime startTime,
    @JsonKey(name: "end_time") required DateTime endTime,
    required AddressModel address,
    List<String>? tags,
    String? description,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") DateTime? createdAt,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);
}
