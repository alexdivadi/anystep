// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthState _$AuthStateFromJson(Map<String, dynamic> json) => _AuthState(
  uid: json['uid'] as String,
  email: json['email'] as String,
  isCachedValue: json['isCachedValue'] as bool? ?? false,
);

Map<String, dynamic> _$AuthStateToJson(_AuthState instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'isCachedValue': instance.isCachedValue,
    };
