// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 bool get isLoading; bool get success; bool get needsEmailConfirmation; String? get error;
/// Create a copy of SignUpScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpScreenStateCopyWith<SignUpScreenState> get copyWith => _$SignUpScreenStateCopyWithImpl<SignUpScreenState>(this as SignUpScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpScreenState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.success, success) || other.success == success)&&(identical(other.needsEmailConfirmation, needsEmailConfirmation) || other.needsEmailConfirmation == needsEmailConfirmation)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,success,needsEmailConfirmation,error);

@override
String toString() {
  return 'SignUpScreenState(isLoading: $isLoading, success: $success, needsEmailConfirmation: $needsEmailConfirmation, error: $error)';
}


}

/// @nodoc
abstract mixin class $SignUpScreenStateCopyWith<$Res>  {
  factory $SignUpScreenStateCopyWith(SignUpScreenState value, $Res Function(SignUpScreenState) _then) = _$SignUpScreenStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool success, bool needsEmailConfirmation, String? error
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
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? success = null,Object? needsEmailConfirmation = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,needsEmailConfirmation: null == needsEmailConfirmation ? _self.needsEmailConfirmation : needsEmailConfirmation // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpScreenState].
extension SignUpScreenStatePatterns on SignUpScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpScreenState value)  $default,){
final _that = this;
switch (_that) {
case _SignUpScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool success,  bool needsEmailConfirmation,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpScreenState() when $default != null:
return $default(_that.isLoading,_that.success,_that.needsEmailConfirmation,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool success,  bool needsEmailConfirmation,  String? error)  $default,) {final _that = this;
switch (_that) {
case _SignUpScreenState():
return $default(_that.isLoading,_that.success,_that.needsEmailConfirmation,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool success,  bool needsEmailConfirmation,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _SignUpScreenState() when $default != null:
return $default(_that.isLoading,_that.success,_that.needsEmailConfirmation,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SignUpScreenState implements SignUpScreenState {
  const _SignUpScreenState({this.isLoading = false, this.success = false, this.needsEmailConfirmation = false, this.error});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool success;
@override@JsonKey() final  bool needsEmailConfirmation;
@override final  String? error;

/// Create a copy of SignUpScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpScreenStateCopyWith<_SignUpScreenState> get copyWith => __$SignUpScreenStateCopyWithImpl<_SignUpScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpScreenState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.success, success) || other.success == success)&&(identical(other.needsEmailConfirmation, needsEmailConfirmation) || other.needsEmailConfirmation == needsEmailConfirmation)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,success,needsEmailConfirmation,error);

@override
String toString() {
  return 'SignUpScreenState(isLoading: $isLoading, success: $success, needsEmailConfirmation: $needsEmailConfirmation, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SignUpScreenStateCopyWith<$Res> implements $SignUpScreenStateCopyWith<$Res> {
  factory _$SignUpScreenStateCopyWith(_SignUpScreenState value, $Res Function(_SignUpScreenState) _then) = __$SignUpScreenStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool success, bool needsEmailConfirmation, String? error
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
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? success = null,Object? needsEmailConfirmation = null,Object? error = freezed,}) {
  return _then(_SignUpScreenState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,needsEmailConfirmation: null == needsEmailConfirmation ? _self.needsEmailConfirmation : needsEmailConfirmation // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
