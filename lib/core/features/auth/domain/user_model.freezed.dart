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

 int get volunteerId; String get uid; String get email; AddressModel get address; String get firstName; String get lastName; AgeGroup get ageGroup; List<String> get permissions; String? get phoneNumber;@JsonKey(includeToJson: false, includeFromJson: true) DateTime? get updatedAt;@JsonKey(includeToJson: false, includeFromJson: true) DateTime? get createdAt;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.volunteerId, volunteerId) || other.volunteerId == volunteerId)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,volunteerId,uid,email,address,firstName,lastName,ageGroup,const DeepCollectionEquality().hash(permissions),phoneNumber,updatedAt,createdAt);

@override
String toString() {
  return 'UserModel(volunteerId: $volunteerId, uid: $uid, email: $email, address: $address, firstName: $firstName, lastName: $lastName, ageGroup: $ageGroup, permissions: $permissions, phoneNumber: $phoneNumber, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 int volunteerId, String uid, String email, AddressModel address, String firstName, String lastName, AgeGroup ageGroup, List<String> permissions, String? phoneNumber,@JsonKey(includeToJson: false, includeFromJson: true) DateTime? updatedAt,@JsonKey(includeToJson: false, includeFromJson: true) DateTime? createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? volunteerId = null,Object? uid = null,Object? email = null,Object? address = null,Object? firstName = null,Object? lastName = null,Object? ageGroup = null,Object? permissions = null,Object? phoneNumber = freezed,Object? updatedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
volunteerId: null == volunteerId ? _self.volunteerId : volunteerId // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,ageGroup: null == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as AgeGroup,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
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
  const _UserModel({required this.volunteerId, required this.uid, required this.email, required this.address, required this.firstName, required this.lastName, required this.ageGroup, required final  List<String> permissions, this.phoneNumber, @JsonKey(includeToJson: false, includeFromJson: true) this.updatedAt, @JsonKey(includeToJson: false, includeFromJson: true) this.createdAt}): _permissions = permissions;
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  int volunteerId;
@override final  String uid;
@override final  String email;
@override final  AddressModel address;
@override final  String firstName;
@override final  String lastName;
@override final  AgeGroup ageGroup;
 final  List<String> _permissions;
@override List<String> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}

@override final  String? phoneNumber;
@override@JsonKey(includeToJson: false, includeFromJson: true) final  DateTime? updatedAt;
@override@JsonKey(includeToJson: false, includeFromJson: true) final  DateTime? createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.volunteerId, volunteerId) || other.volunteerId == volunteerId)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,volunteerId,uid,email,address,firstName,lastName,ageGroup,const DeepCollectionEquality().hash(_permissions),phoneNumber,updatedAt,createdAt);

@override
String toString() {
  return 'UserModel(volunteerId: $volunteerId, uid: $uid, email: $email, address: $address, firstName: $firstName, lastName: $lastName, ageGroup: $ageGroup, permissions: $permissions, phoneNumber: $phoneNumber, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 int volunteerId, String uid, String email, AddressModel address, String firstName, String lastName, AgeGroup ageGroup, List<String> permissions, String? phoneNumber,@JsonKey(includeToJson: false, includeFromJson: true) DateTime? updatedAt,@JsonKey(includeToJson: false, includeFromJson: true) DateTime? createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? volunteerId = null,Object? uid = null,Object? email = null,Object? address = null,Object? firstName = null,Object? lastName = null,Object? ageGroup = null,Object? permissions = null,Object? phoneNumber = freezed,Object? updatedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_UserModel(
volunteerId: null == volunteerId ? _self.volunteerId : volunteerId // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,ageGroup: null == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as AgeGroup,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
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
