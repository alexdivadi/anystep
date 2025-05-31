import 'package:freezed_annotation/freezed_annotation.dart';
import 'address_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required AddressModel address,
    required String firstName,
    required String lastName,
    required DateTime birthdate,
    String? phoneNumber,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
