// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  birthdate: DateTime.parse(json['birthdate'] as String),
  phoneNumber: json['phoneNumber'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'address': instance.address,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthdate': instance.birthdate.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
    };
