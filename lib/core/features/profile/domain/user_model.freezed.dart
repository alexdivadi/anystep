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

 String get id; String get email;@JsonKey(name: "address") int? get addressId;@JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) AddressModel? get address;@JsonKey(name: "first_name") String get firstName;@JsonKey(name: "last_name") String get lastName;@JsonKey(name: "age_group") AgeGroup get ageGroup; UserRole get role;@JsonKey(name: "phone_number") String? get phoneNumber;@JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") DateTime? get createdAt;@JsonKey(includeToJson: false, includeFromJson: false) bool get isCachedValue;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.address, address) || other.address == address)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.role, role) || other.role == role)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isCachedValue, isCachedValue) || other.isCachedValue == isCachedValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,addressId,address,firstName,lastName,ageGroup,role,phoneNumber,createdAt,isCachedValue);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, addressId: $addressId, address: $address, firstName: $firstName, lastName: $lastName, ageGroup: $ageGroup, role: $role, phoneNumber: $phoneNumber, createdAt: $createdAt, isCachedValue: $isCachedValue)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String email,@JsonKey(name: "address") int? addressId,@JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) AddressModel? address,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName,@JsonKey(name: "age_group") AgeGroup ageGroup, UserRole role,@JsonKey(name: "phone_number") String? phoneNumber,@JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") DateTime? createdAt,@JsonKey(includeToJson: false, includeFromJson: false) bool isCachedValue
});


$AddressModelCopyWith<$Res>? get address;

}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? addressId = freezed,Object? address = freezed,Object? firstName = null,Object? lastName = null,Object? ageGroup = null,Object? role = null,Object? phoneNumber = freezed,Object? createdAt = freezed,Object? isCachedValue = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as int?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,ageGroup: null == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as AgeGroup,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isCachedValue: null == isCachedValue ? _self.isCachedValue : isCachedValue // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressModelCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressModelCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserModel extends UserModel {
  const _UserModel({required this.id, required this.email, @JsonKey(name: "address") this.addressId, @JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) this.address, @JsonKey(name: "first_name") required this.firstName, @JsonKey(name: "last_name") required this.lastName, @JsonKey(name: "age_group") required this.ageGroup, required this.role, @JsonKey(name: "phone_number") this.phoneNumber, @JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") this.createdAt, @JsonKey(includeToJson: false, includeFromJson: false) this.isCachedValue = false}): super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String id;
@override final  String email;
@override@JsonKey(name: "address") final  int? addressId;
@override@JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) final  AddressModel? address;
@override@JsonKey(name: "first_name") final  String firstName;
@override@JsonKey(name: "last_name") final  String lastName;
@override@JsonKey(name: "age_group") final  AgeGroup ageGroup;
@override final  UserRole role;
@override@JsonKey(name: "phone_number") final  String? phoneNumber;
@override@JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") final  DateTime? createdAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.address, address) || other.address == address)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.role, role) || other.role == role)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isCachedValue, isCachedValue) || other.isCachedValue == isCachedValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,addressId,address,firstName,lastName,ageGroup,role,phoneNumber,createdAt,isCachedValue);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, addressId: $addressId, address: $address, firstName: $firstName, lastName: $lastName, ageGroup: $ageGroup, role: $role, phoneNumber: $phoneNumber, createdAt: $createdAt, isCachedValue: $isCachedValue)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String email,@JsonKey(name: "address") int? addressId,@JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) AddressModel? address,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName,@JsonKey(name: "age_group") AgeGroup ageGroup, UserRole role,@JsonKey(name: "phone_number") String? phoneNumber,@JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") DateTime? createdAt,@JsonKey(includeToJson: false, includeFromJson: false) bool isCachedValue
});


@override $AddressModelCopyWith<$Res>? get address;

}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? addressId = freezed,Object? address = freezed,Object? firstName = null,Object? lastName = null,Object? ageGroup = null,Object? role = null,Object? phoneNumber = freezed,Object? createdAt = freezed,Object? isCachedValue = null,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as int?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,ageGroup: null == ageGroup ? _self.ageGroup : ageGroup // ignore: cast_nullable_to_non_nullable
as AgeGroup,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isCachedValue: null == isCachedValue ? _self.isCachedValue : isCachedValue // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressModelCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressModelCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}

// dart format on
