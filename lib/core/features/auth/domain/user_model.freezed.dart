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

 String get id; String get email; AddressModel get address; String get firstName; String get lastName; String? get phoneNumber; DateTime get updatedOn; DateTime get createdOn; bool get isOver55; bool get isUnder18;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.updatedOn, updatedOn) || other.updatedOn == updatedOn)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.isOver55, isOver55) || other.isOver55 == isOver55)&&(identical(other.isUnder18, isUnder18) || other.isUnder18 == isUnder18));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,address,firstName,lastName,phoneNumber,updatedOn,createdOn,isOver55,isUnder18);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, address: $address, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, updatedOn: $updatedOn, createdOn: $createdOn, isOver55: $isOver55, isUnder18: $isUnder18)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String email, AddressModel address, String firstName, String lastName, DateTime updatedOn, DateTime createdOn, String? phoneNumber, bool isOver55, bool isUnder18
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? address = null,Object? firstName = null,Object? lastName = null,Object? updatedOn = null,Object? createdOn = null,Object? phoneNumber = freezed,Object? isOver55 = null,Object? isUnder18 = null,}) {
  return _then(UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,updatedOn: null == updatedOn ? _self.updatedOn : updatedOn // ignore: cast_nullable_to_non_nullable
as DateTime,createdOn: null == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as DateTime,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,isOver55: null == isOver55 ? _self.isOver55 : isOver55 // ignore: cast_nullable_to_non_nullable
as bool,isUnder18: null == isUnder18 ? _self.isUnder18 : isUnder18 // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


// dart format on
