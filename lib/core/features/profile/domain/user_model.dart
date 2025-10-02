// ignore_for_file: invalid_annotation_target

// import 'package:anystep/core/features/location/domain/address_model.dart';
import 'package:anystep/core/features/location/domain/address_model.dart';
import 'package:anystep/core/features/profile/domain/age_group.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    required String id,
    required String email,
    @JsonKey(name: "address") int? addressId,
    @JsonKey(name: "address_model", includeToJson: false, includeFromJson: true)
    AddressModel? address,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    @JsonKey(name: "age_group") required AgeGroup ageGroup,
    required UserRole role,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") DateTime? createdAt,
    @JsonKey(includeToJson: false, includeFromJson: false) @Default(false) bool isCachedValue,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  String get fullName => "$firstName $lastName";
  String get profileImageUrl =>
      'https://xwbzsprukcwoiaebxgev.supabase.co/storage/v1/object/public/images/profiles/$id.png';
}
