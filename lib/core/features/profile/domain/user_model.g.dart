// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  addressId: (json['address'] as num?)?.toInt(),
  address: json['address_model'] == null
      ? null
      : AddressModel.fromJson(json['address_model'] as Map<String, dynamic>),
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  ageGroup: AgeGroupJson.fromJson(json['age_group'] as String),
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  phoneNumber: json['phone_number'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  agreementSignedOn: json['agreement_signed_on'] == null
      ? null
      : DateTime.parse(json['agreement_signed_on'] as String),
  fcmToken: json['fcm_token'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'address': instance.addressId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'age_group': AgeGroupJson.toJsonStatic(instance.ageGroup),
      'role': _$UserRoleEnumMap[instance.role]!,
      'phone_number': instance.phoneNumber,
      'agreement_signed_on': instance.agreementSignedOn?.toIso8601String(),
      'fcm_token': instance.fcmToken,
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.volunteer: 'volunteer',
};
