import 'package:anystep/core/features/auth/domain/address_model.dart';
import 'package:anystep/core/features/events/domain/event_template.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@JsonSerializable()
@freezed
class EventModel with _$EventModel {
  const EventModel({
    required this.id,
    required this.name,
    required this.startTime, // DateTime for event start
    required this.endTime, // DateTime for event end
    required this.address,
    required this.updatedOn,
    required this.createdOn,
    this.template, // Reference to EventTemplate
    this.description,
    this.tags,
    this.imageUrl,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final EventTemplateModel? template;
  @override
  @JsonKey(name: "start_time")
  final DateTime startTime; // DateTime for event start
  @override
  @JsonKey(name: "end_time")
  final DateTime endTime; // DateTime for event end
  @override
  final AddressModel address;
  @override
  final DateTime updatedOn;
  @override
  final DateTime createdOn;
  @override
  final String? description;
  @override
  final List<String>? tags;
  @override
  @JsonKey(name: "image_url")
  final String? imageUrl;

  factory EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);
}
