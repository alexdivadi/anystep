// ignore_for_file: invalid_annotation_target

import 'package:anystep/core/common/domain/address_model.dart';
import 'package:anystep/core/features/auth/domain/age_group.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required int volunteerId,
    required String uid,
    required String email,
    required AddressModel address,
    required String firstName,
    required String lastName,
    required AgeGroup ageGroup,
    required List<String> permissions,
    String? phoneNumber,
    @JsonKey(includeToJson: false, includeFromJson: true) DateTime? updatedAt,
    @JsonKey(includeToJson: false, includeFromJson: true) DateTime? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
