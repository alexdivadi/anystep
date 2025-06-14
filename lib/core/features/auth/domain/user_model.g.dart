// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  updatedOn: DateTime.parse(json['updatedOn'] as String),
  createdOn: DateTime.parse(json['createdOn'] as String),
  phoneNumber: json['phoneNumber'] as String?,
  isOver55: json['isOver55'] as bool? ?? false,
  isUnder18: json['isUnder18'] as bool? ?? false,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'address': instance.address,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'phoneNumber': instance.phoneNumber,
  'updatedOn': instance.updatedOn.toIso8601String(),
  'createdOn': instance.createdOn.toIso8601String(),
  'isOver55': instance.isOver55,
  'isUnder18': instance.isUnder18,
};
