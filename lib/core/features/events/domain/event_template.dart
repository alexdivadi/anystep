import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_template.freezed.dart';
part 'event_template.g.dart';

@JsonSerializable()
@freezed
class EventTemplateModel with _$EventTemplateModel {
  const EventTemplateModel({
    required this.name,
    required this.description,
    required this.tags,
    required this.imageUrl,
  });

  @override
  final String name;
  @override
  final String description;
  @override
  final List<String> tags;
  @override
  @JsonKey(name: "image_url")
  final String imageUrl;

  factory EventTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$EventTemplateModelFromJson(json);
}
