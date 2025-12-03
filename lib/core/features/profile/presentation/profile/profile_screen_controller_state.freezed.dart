// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_screen_controller_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileScreenControllerState {

 bool get isLoading; String? get error;
/// Create a copy of ProfileScreenControllerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileScreenControllerStateCopyWith<ProfileScreenControllerState> get copyWith => _$ProfileScreenControllerStateCopyWithImpl<ProfileScreenControllerState>(this as ProfileScreenControllerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileScreenControllerState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error);

@override
String toString() {
  return 'ProfileScreenControllerState(isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ProfileScreenControllerStateCopyWith<$Res>  {
  factory $ProfileScreenControllerStateCopyWith(ProfileScreenControllerState value, $Res Function(ProfileScreenControllerState) _then) = _$ProfileScreenControllerStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? error
});




}
/// @nodoc
class _$ProfileScreenControllerStateCopyWithImpl<$Res>
    implements $ProfileScreenControllerStateCopyWith<$Res> {
  _$ProfileScreenControllerStateCopyWithImpl(this._self, this._then);

  final ProfileScreenControllerState _self;
  final $Res Function(ProfileScreenControllerState) _then;

/// Create a copy of ProfileScreenControllerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileScreenControllerState].
extension ProfileScreenControllerStatePatterns on ProfileScreenControllerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileScreenControllerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileScreenControllerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileScreenControllerState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileScreenControllerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileScreenControllerState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileScreenControllerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileScreenControllerState() when $default != null:
return $default(_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ProfileScreenControllerState():
return $default(_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ProfileScreenControllerState() when $default != null:
return $default(_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileScreenControllerState implements ProfileScreenControllerState {
  const _ProfileScreenControllerState({this.isLoading = false, this.error});
  

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of ProfileScreenControllerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileScreenControllerStateCopyWith<_ProfileScreenControllerState> get copyWith => __$ProfileScreenControllerStateCopyWithImpl<_ProfileScreenControllerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileScreenControllerState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error);

@override
String toString() {
  return 'ProfileScreenControllerState(isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ProfileScreenControllerStateCopyWith<$Res> implements $ProfileScreenControllerStateCopyWith<$Res> {
  factory _$ProfileScreenControllerStateCopyWith(_ProfileScreenControllerState value, $Res Function(_ProfileScreenControllerState) _then) = __$ProfileScreenControllerStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? error
});




}
/// @nodoc
class __$ProfileScreenControllerStateCopyWithImpl<$Res>
    implements _$ProfileScreenControllerStateCopyWith<$Res> {
  __$ProfileScreenControllerStateCopyWithImpl(this._self, this._then);

  final _ProfileScreenControllerState _self;
  final $Res Function(_ProfileScreenControllerState) _then;

/// Create a copy of ProfileScreenControllerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ProfileScreenControllerState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
