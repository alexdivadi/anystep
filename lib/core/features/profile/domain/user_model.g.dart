// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  email: json['email'] as String,
  address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  ageGroup: $enumDecode(_$AgeGroupEnumMap, json['ageGroup']),
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  phoneNumber: json['phoneNumber'] as String?,
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'address': instance.address,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'ageGroup': _$AgeGroupEnumMap[instance.ageGroup]!,
      'role': _$UserRoleEnumMap[instance.role]!,
      'phoneNumber': instance.phoneNumber,
    };

const _$AgeGroupEnumMap = {
  AgeGroup.under18: 'under18',
  AgeGroup.over55: 'over55',
  AgeGroup.other: 'other',
};

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.volunteer: 'volunteer',
};
