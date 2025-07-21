// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String get email; AddressModel get address; String get firstName; String get lastName; AgeGroup get ageGroup; UserRole get role; String? get phoneNumber;@JsonKey(includeToJson: false, includeFromJson: true) DateTime? get updatedAt;@JsonKey(includeToJson: false, includeFromJson: true) DateTime? get createdAt;@JsonKey(includeToJson: false, includeFromJson: false) bool get isCachedValue;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.role, role) || other.role == role)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isCachedValue, isCachedValue) || other.isCachedValue == isCachedValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,address,firstName,lastName,ageGroup,role,phoneNumber,updatedAt,createdAt,isCachedValue);

@override
String toString() {
  return 'UserModel(email: $email, address: $address, firstName: $firstName, lastName: $lastName, ageGroup: $ageGroup, role: $role, phoneNumber: $phoneNumber, updatedAt: $updatedAt, createdAt: $createdAt, isCachedValue: $isCachedValue)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String email, AddressModel address, String firstName, String lastName, AgeGroup ageGroup, UserRole role, String? phoneNumber,@JsonKey(includeToJson: false, includeFromJson: true) DateTime? updatedAt,@JsonKey(includeToJson: false, includeFromJson: true) DateTime? createdAt,@JsonKey(includeToJson: false, includeFromJson: false) bool isCachedValue
});


$AddressModelCopyWith<$Res> get address;

}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? address = null,Object? firstName = null,Object? lastName = null,Object? ageGroup = null,Object? role = null,Object? phoneNumber = freezed,Object? updatedAt = freezed,Object? createdAt = freezed,Object? isCachedValue = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,ageGroup: null == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as AgeGroup,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isCachedValue: null == isCachedValue ? _self.isCachedValue : isCachedValue // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressModelCopyWith<$Res> get address {
  
  return $AddressModelCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({required this.email, required this.address, required this.firstName, required this.lastName, required this.ageGroup, required this.role, this.phoneNumber, @JsonKey(includeToJson: false, includeFromJson: true) this.updatedAt, @JsonKey(includeToJson: false, includeFromJson: true) this.createdAt, @JsonKey(includeToJson: false, includeFromJson: false) this.isCachedValue = false});
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String email;
@override final  AddressModel address;
@override final  String firstName;
@override final  String lastName;
@override final  AgeGroup ageGroup;
@override final  UserRole role;
@override final  String? phoneNumber;
@override@JsonKey(includeToJson: false, includeFromJson: true) final  DateTime? updatedAt;
@override@JsonKey(includeToJson: false, includeFromJson: true) final  DateTime? createdAt;
@override@JsonKey(includeToJson: false, includeFromJson: false) final  bool isCachedValue;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.role, role) || other.role == role)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isCachedValue, isCachedValue) || other.isCachedValue == isCachedValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,address,firstName,lastName,ageGroup,role,phoneNumber,updatedAt,createdAt,isCachedValue);

@override
String toString() {
  return 'UserModel(email: $email, address: $address, firstName: $firstName, lastName: $lastName, ageGroup: $ageGroup, role: $role, phoneNumber: $phoneNumber, updatedAt: $updatedAt, createdAt: $createdAt, isCachedValue: $isCachedValue)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String email, AddressModel address, String firstName, String lastName, AgeGroup ageGroup, UserRole role, String? phoneNumber,@JsonKey(includeToJson: false, includeFromJson: true) DateTime? updatedAt,@JsonKey(includeToJson: false, includeFromJson: true) DateTime? createdAt,@JsonKey(includeToJson: false, includeFromJson: false) bool isCachedValue
});


@override $AddressModelCopyWith<$Res> get address;

}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? address = null,Object? firstName = null,Object? lastName = null,Object? ageGroup = null,Object? role = null,Object? phoneNumber = freezed,Object? updatedAt = freezed,Object? createdAt = freezed,Object? isCachedValue = null,}) {
  return _then(_UserModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,ageGroup: null == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as AgeGroup,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isCachedValue: null == isCachedValue ? _self.isCachedValue : isCachedValue // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressModelCopyWith<$Res> get address {
  
  return $AddressModelCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}

// dart format on
