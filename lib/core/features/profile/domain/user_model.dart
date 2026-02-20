// ignore_for_file: invalid_annotation_target

// import 'package:anystep/core/features/location/domain/address_model.dart';
import 'package:anystep/core/features/location/domain/address_model.dart';
import 'package:anystep/core/features/profile/domain/age_group.dart';
import 'package:anystep/core/features/profile/domain/user_agreement_type.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/database/storage.dart';
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
    @JsonKey(name: "age_group", toJson: AgeGroupJson.toJsonStatic, fromJson: AgeGroupJson.fromJson)
    required AgeGroup ageGroup,
    required UserRole role,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") DateTime? createdAt,
    @JsonKey(includeToJson: false, includeFromJson: false) @Default(false) bool isCachedValue,
    @JsonKey(name: "agreement_signed_on") DateTime? agreementSignedOn,
    @JsonKey(name: "fcm_token") String? fcmToken,
    @JsonKey(name: "new_event_notifications_enabled")
    @Default(true)
    bool newEventNotificationsEnabled,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  String get fullName => "$firstName $lastName";
  String get profileImageUrl => '${Storage.publicUrl}/profiles/$id.png';
  bool get hasSignedAgreement => agreementSignedOn != null;
  UserAgreementType get requiredAgreementType => ageGroup == AgeGroup.under18
      ? UserAgreementType.minorAgreement
      : UserAgreementType.adultAgreement;
}
