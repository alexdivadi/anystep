// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WelcomeScreenState {

 bool get isLoading; bool get isOnboarded; String? get error;
/// Create a copy of WelcomeScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeScreenStateCopyWith<WelcomeScreenState> get copyWith => _$WelcomeScreenStateCopyWithImpl<WelcomeScreenState>(this as WelcomeScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeScreenState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isOnboarded, isOnboarded) || other.isOnboarded == isOnboarded)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isOnboarded,error);

@override
String toString() {
  return 'WelcomeScreenState(isLoading: $isLoading, isOnboarded: $isOnboarded, error: $error)';
}


}

/// @nodoc
abstract mixin class $WelcomeScreenStateCopyWith<$Res>  {
  factory $WelcomeScreenStateCopyWith(WelcomeScreenState value, $Res Function(WelcomeScreenState) _then) = _$WelcomeScreenStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isOnboarded, String? error
});




}
/// @nodoc
class _$WelcomeScreenStateCopyWithImpl<$Res>
    implements $WelcomeScreenStateCopyWith<$Res> {
  _$WelcomeScreenStateCopyWithImpl(this._self, this._then);

  final WelcomeScreenState _self;
  final $Res Function(WelcomeScreenState) _then;

/// Create a copy of WelcomeScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isOnboarded = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isOnboarded: null == isOnboarded ? _self.isOnboarded : isOnboarded // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WelcomeScreenState].
extension WelcomeScreenStatePatterns on WelcomeScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WelcomeScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WelcomeScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WelcomeScreenState value)  $default,){
final _that = this;
switch (_that) {
case _WelcomeScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WelcomeScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _WelcomeScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isOnboarded,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WelcomeScreenState() when $default != null:
return $default(_that.isLoading,_that.isOnboarded,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isOnboarded,  String? error)  $default,) {final _that = this;
switch (_that) {
case _WelcomeScreenState():
return $default(_that.isLoading,_that.isOnboarded,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isOnboarded,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _WelcomeScreenState() when $default != null:
return $default(_that.isLoading,_that.isOnboarded,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _WelcomeScreenState implements WelcomeScreenState {
  const _WelcomeScreenState({this.isLoading = false, this.isOnboarded = false, this.error});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isOnboarded;
@override final  String? error;

/// Create a copy of WelcomeScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WelcomeScreenStateCopyWith<_WelcomeScreenState> get copyWith => __$WelcomeScreenStateCopyWithImpl<_WelcomeScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WelcomeScreenState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isOnboarded, isOnboarded) || other.isOnboarded == isOnboarded)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isOnboarded,error);

@override
String toString() {
  return 'WelcomeScreenState(isLoading: $isLoading, isOnboarded: $isOnboarded, error: $error)';
}


}

/// @nodoc
abstract mixin class _$WelcomeScreenStateCopyWith<$Res> implements $WelcomeScreenStateCopyWith<$Res> {
  factory _$WelcomeScreenStateCopyWith(_WelcomeScreenState value, $Res Function(_WelcomeScreenState) _then) = __$WelcomeScreenStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isOnboarded, String? error
});




}
/// @nodoc
class __$WelcomeScreenStateCopyWithImpl<$Res>
    implements _$WelcomeScreenStateCopyWith<$Res> {
  __$WelcomeScreenStateCopyWithImpl(this._self, this._then);

  final _WelcomeScreenState _self;
  final $Res Function(_WelcomeScreenState) _then;

/// Create a copy of WelcomeScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isOnboarded = null,Object? error = freezed,}) {
  return _then(_WelcomeScreenState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isOnboarded: null == isOnboarded ? _self.isOnboarded : isOnboarded // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
