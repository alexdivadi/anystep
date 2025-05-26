// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpScreenState {

 bool get isLoading; bool get success; String? get error;
/// Create a copy of SignUpScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpScreenStateCopyWith<SignUpScreenState> get copyWith => _$SignUpScreenStateCopyWithImpl<SignUpScreenState>(this as SignUpScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpScreenState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,success,error);

@override
String toString() {
  return 'SignUpScreenState(isLoading: $isLoading, success: $success, error: $error)';
}


}

/// @nodoc
abstract mixin class $SignUpScreenStateCopyWith<$Res>  {
  factory $SignUpScreenStateCopyWith(SignUpScreenState value, $Res Function(SignUpScreenState) _then) = _$SignUpScreenStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool success, String? error
});




}
/// @nodoc
class _$SignUpScreenStateCopyWithImpl<$Res>
    implements $SignUpScreenStateCopyWith<$Res> {
  _$SignUpScreenStateCopyWithImpl(this._self, this._then);

  final SignUpScreenState _self;
  final $Res Function(SignUpScreenState) _then;

/// Create a copy of SignUpScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? success = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _SignUpScreenState implements SignUpScreenState {
  const _SignUpScreenState({this.isLoading = false, this.success = false, this.error});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool success;
@override final  String? error;

/// Create a copy of SignUpScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpScreenStateCopyWith<_SignUpScreenState> get copyWith => __$SignUpScreenStateCopyWithImpl<_SignUpScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpScreenState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,success,error);

@override
String toString() {
  return 'SignUpScreenState(isLoading: $isLoading, success: $success, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SignUpScreenStateCopyWith<$Res> implements $SignUpScreenStateCopyWith<$Res> {
  factory _$SignUpScreenStateCopyWith(_SignUpScreenState value, $Res Function(_SignUpScreenState) _then) = __$SignUpScreenStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool success, String? error
});




}
/// @nodoc
class __$SignUpScreenStateCopyWithImpl<$Res>
    implements _$SignUpScreenStateCopyWith<$Res> {
  __$SignUpScreenStateCopyWithImpl(this._self, this._then);

  final _SignUpScreenState _self;
  final $Res Function(_SignUpScreenState) _then;

/// Create a copy of SignUpScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? success = null,Object? error = freezed,}) {
  return _then(_SignUpScreenState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
