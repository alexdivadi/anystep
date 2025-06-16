import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_template.freezed.dart';
part 'event_template.g.dart';

@freezed
abstract class EventTemplateModel with _$EventTemplateModel {
  const factory EventTemplateModel({
    required String name,
    required String description,
    required List<String> tags,
    String? imageUrl,
  }) = _EventTemplateModel;

  factory EventTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$EventTemplateModelFromJson(json);
}
