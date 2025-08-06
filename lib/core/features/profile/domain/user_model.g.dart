// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  addressId: (json['address'] as num?)?.toInt(),
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  ageGroup: $enumDecode(_$AgeGroupEnumMap, json['age_group']),
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  phoneNumber: json['phone_number'] as String?,
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'address': instance.addressId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'age_group': _$AgeGroupEnumMap[instance.ageGroup]!,
      'role': _$UserRoleEnumMap[instance.role]!,
      'phone_number': instance.phoneNumber,
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
