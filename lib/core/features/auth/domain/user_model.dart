import 'package:freezed_annotation/freezed_annotation.dart';
import 'address_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@JsonSerializable()
@freezed
class UserModel with _$UserModel {
  const UserModel({
    required this.id,
    required this.email,
    required this.address,
    required this.firstName,
    required this.lastName,
    required this.updatedOn,
    required this.createdOn,
    this.phoneNumber,
    this.isOver55 = false,
    this.isUnder18 = false,
  });

  @override
  final String id;
  @override
  final String email;
  @override
  final AddressModel address;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? phoneNumber;
  @override
  final DateTime updatedOn;
  @override
  final DateTime createdOn;
  @override
  final bool isOver55;
  @override
  final bool isUnder18;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
