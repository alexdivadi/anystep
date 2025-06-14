import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@JsonSerializable()
@freezed
class AddressModel with _$AddressModel {
  const AddressModel({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.isUserAddress,
    this.latitude,
    this.longitude,
    this.placeId,
    this.name,
    this.geohash,
  });

  @override
  final String street;
  @override
  final String city;
  @override
  final String state;
  @override
  @Default('United States')
  final String country;
  @override
  final String postalCode;
  @override
  @JsonKey(name: "is_user_address")
  @Default(false)
  final bool isUserAddress;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? placeId;
  @override
  final String? name;
  @override
  final String? geohash;

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);
}
