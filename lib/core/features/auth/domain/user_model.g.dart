// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  volunteerId: (json['volunteerId'] as num).toInt(),
  uid: json['uid'] as String,
  email: json['email'] as String,
  address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  ageGroup: $enumDecode(_$AgeGroupEnumMap, json['ageGroup']),
  permissions:
      (json['permissions'] as List<dynamic>).map((e) => e as String).toList(),
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
      'volunteerId': instance.volunteerId,
      'uid': instance.uid,
      'email': instance.email,
      'address': instance.address,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'ageGroup': _$AgeGroupEnumMap[instance.ageGroup]!,
      'permissions': instance.permissions,
      'phoneNumber': instance.phoneNumber,
    };

const _$AgeGroupEnumMap = {
  AgeGroup.over55: 'over55',
  AgeGroup.under18: 'under18',
  AgeGroup.other: 'other',
};
