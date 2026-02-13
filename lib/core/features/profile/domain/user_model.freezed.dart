// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 String get id; String get email;@JsonKey(name: "address") int? get addressId;@JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) AddressModel? get address;@JsonKey(name: "first_name") String get firstName;@JsonKey(name: "last_name") String get lastName;@JsonKey(name: "age_group", toJson: AgeGroupJson.toJsonStatic, fromJson: AgeGroupJson.fromJson) AgeGroup get ageGroup; UserRole get role;@JsonKey(name: "phone_number") String? get phoneNumber;@JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") DateTime? get createdAt;@JsonKey(includeToJson: false, includeFromJson: false) bool get isCachedValue;@JsonKey(name: "agreement_signed_on") DateTime? get agreementSignedOn;@JsonKey(name: "fcm_token") String? get fcmToken;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.address, address) || other.address == address)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.role, role) || other.role == role)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isCachedValue, isCachedValue) || other.isCachedValue == isCachedValue)&&(identical(other.agreementSignedOn, agreementSignedOn) || other.agreementSignedOn == agreementSignedOn)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,addressId,address,firstName,lastName,ageGroup,role,phoneNumber,createdAt,isCachedValue,agreementSignedOn,fcmToken);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, addressId: $addressId, address: $address, firstName: $firstName, lastName: $lastName, ageGroup: $ageGroup, role: $role, phoneNumber: $phoneNumber, createdAt: $createdAt, isCachedValue: $isCachedValue, agreementSignedOn: $agreementSignedOn, fcmToken: $fcmToken)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String email,@JsonKey(name: "address") int? addressId,@JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) AddressModel? address,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName,@JsonKey(name: "age_group", toJson: AgeGroupJson.toJsonStatic, fromJson: AgeGroupJson.fromJson) AgeGroup ageGroup, UserRole role,@JsonKey(name: "phone_number") String? phoneNumber,@JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") DateTime? createdAt,@JsonKey(includeToJson: false, includeFromJson: false) bool isCachedValue,@JsonKey(name: "agreement_signed_on") DateTime? agreementSignedOn,@JsonKey(name: "fcm_token") String? fcmToken
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? addressId = freezed,Object? address = freezed,Object? firstName = null,Object? lastName = null,Object? ageGroup = null,Object? role = null,Object? phoneNumber = freezed,Object? createdAt = freezed,Object? isCachedValue = null,Object? agreementSignedOn = freezed,Object? fcmToken = freezed,}) {
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
as bool,agreementSignedOn: freezed == agreementSignedOn ? _self.agreementSignedOn : agreementSignedOn // ignore: cast_nullable_to_non_nullable
as DateTime?,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,
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


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email, @JsonKey(name: "address")  int? addressId, @JsonKey(name: "address_model", includeToJson: false, includeFromJson: true)  AddressModel? address, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "age_group", toJson: AgeGroupJson.toJsonStatic, fromJson: AgeGroupJson.fromJson)  AgeGroup ageGroup,  UserRole role, @JsonKey(name: "phone_number")  String? phoneNumber, @JsonKey(includeToJson: false, includeFromJson: true, name: "created_at")  DateTime? createdAt, @JsonKey(includeToJson: false, includeFromJson: false)  bool isCachedValue, @JsonKey(name: "agreement_signed_on")  DateTime? agreementSignedOn, @JsonKey(name: "fcm_token")  String? fcmToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.email,_that.addressId,_that.address,_that.firstName,_that.lastName,_that.ageGroup,_that.role,_that.phoneNumber,_that.createdAt,_that.isCachedValue,_that.agreementSignedOn,_that.fcmToken);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email, @JsonKey(name: "address")  int? addressId, @JsonKey(name: "address_model", includeToJson: false, includeFromJson: true)  AddressModel? address, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "age_group", toJson: AgeGroupJson.toJsonStatic, fromJson: AgeGroupJson.fromJson)  AgeGroup ageGroup,  UserRole role, @JsonKey(name: "phone_number")  String? phoneNumber, @JsonKey(includeToJson: false, includeFromJson: true, name: "created_at")  DateTime? createdAt, @JsonKey(includeToJson: false, includeFromJson: false)  bool isCachedValue, @JsonKey(name: "agreement_signed_on")  DateTime? agreementSignedOn, @JsonKey(name: "fcm_token")  String? fcmToken)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.email,_that.addressId,_that.address,_that.firstName,_that.lastName,_that.ageGroup,_that.role,_that.phoneNumber,_that.createdAt,_that.isCachedValue,_that.agreementSignedOn,_that.fcmToken);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email, @JsonKey(name: "address")  int? addressId, @JsonKey(name: "address_model", includeToJson: false, includeFromJson: true)  AddressModel? address, @JsonKey(name: "first_name")  String firstName, @JsonKey(name: "last_name")  String lastName, @JsonKey(name: "age_group", toJson: AgeGroupJson.toJsonStatic, fromJson: AgeGroupJson.fromJson)  AgeGroup ageGroup,  UserRole role, @JsonKey(name: "phone_number")  String? phoneNumber, @JsonKey(includeToJson: false, includeFromJson: true, name: "created_at")  DateTime? createdAt, @JsonKey(includeToJson: false, includeFromJson: false)  bool isCachedValue, @JsonKey(name: "agreement_signed_on")  DateTime? agreementSignedOn, @JsonKey(name: "fcm_token")  String? fcmToken)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.email,_that.addressId,_that.address,_that.firstName,_that.lastName,_that.ageGroup,_that.role,_that.phoneNumber,_that.createdAt,_that.isCachedValue,_that.agreementSignedOn,_that.fcmToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel extends UserModel {
  const _UserModel({required this.id, required this.email, @JsonKey(name: "address") this.addressId, @JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) this.address, @JsonKey(name: "first_name") required this.firstName, @JsonKey(name: "last_name") required this.lastName, @JsonKey(name: "age_group", toJson: AgeGroupJson.toJsonStatic, fromJson: AgeGroupJson.fromJson) required this.ageGroup, required this.role, @JsonKey(name: "phone_number") this.phoneNumber, @JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") this.createdAt, @JsonKey(includeToJson: false, includeFromJson: false) this.isCachedValue = false, @JsonKey(name: "agreement_signed_on") this.agreementSignedOn, @JsonKey(name: "fcm_token") this.fcmToken}): super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String id;
@override final  String email;
@override@JsonKey(name: "address") final  int? addressId;
@override@JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) final  AddressModel? address;
@override@JsonKey(name: "first_name") final  String firstName;
@override@JsonKey(name: "last_name") final  String lastName;
@override@JsonKey(name: "age_group", toJson: AgeGroupJson.toJsonStatic, fromJson: AgeGroupJson.fromJson) final  AgeGroup ageGroup;
@override final  UserRole role;
@override@JsonKey(name: "phone_number") final  String? phoneNumber;
@override@JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") final  DateTime? createdAt;
@override@JsonKey(includeToJson: false, includeFromJson: false) final  bool isCachedValue;
@override@JsonKey(name: "agreement_signed_on") final  DateTime? agreementSignedOn;
@override@JsonKey(name: "fcm_token") final  String? fcmToken;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.address, address) || other.address == address)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.ageGroup, ageGroup) || other.ageGroup == ageGroup)&&(identical(other.role, role) || other.role == role)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isCachedValue, isCachedValue) || other.isCachedValue == isCachedValue)&&(identical(other.agreementSignedOn, agreementSignedOn) || other.agreementSignedOn == agreementSignedOn)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,addressId,address,firstName,lastName,ageGroup,role,phoneNumber,createdAt,isCachedValue,agreementSignedOn,fcmToken);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, addressId: $addressId, address: $address, firstName: $firstName, lastName: $lastName, ageGroup: $ageGroup, role: $role, phoneNumber: $phoneNumber, createdAt: $createdAt, isCachedValue: $isCachedValue, agreementSignedOn: $agreementSignedOn, fcmToken: $fcmToken)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String email,@JsonKey(name: "address") int? addressId,@JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) AddressModel? address,@JsonKey(name: "first_name") String firstName,@JsonKey(name: "last_name") String lastName,@JsonKey(name: "age_group", toJson: AgeGroupJson.toJsonStatic, fromJson: AgeGroupJson.fromJson) AgeGroup ageGroup, UserRole role,@JsonKey(name: "phone_number") String? phoneNumber,@JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") DateTime? createdAt,@JsonKey(includeToJson: false, includeFromJson: false) bool isCachedValue,@JsonKey(name: "agreement_signed_on") DateTime? agreementSignedOn,@JsonKey(name: "fcm_token") String? fcmToken
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? addressId = freezed,Object? address = freezed,Object? firstName = null,Object? lastName = null,Object? ageGroup = null,Object? role = null,Object? phoneNumber = freezed,Object? createdAt = freezed,Object? isCachedValue = null,Object? agreementSignedOn = freezed,Object? fcmToken = freezed,}) {
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
as bool,agreementSignedOn: freezed == agreementSignedOn ? _self.agreementSignedOn : agreementSignedOn // ignore: cast_nullable_to_non_nullable
as DateTime?,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,
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
