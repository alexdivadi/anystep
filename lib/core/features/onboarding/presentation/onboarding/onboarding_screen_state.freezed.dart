// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingScreenState {

 bool get isLoading; bool get isOnboarded; String? get error;
/// Create a copy of OnboardingScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingScreenStateCopyWith<OnboardingScreenState> get copyWith => _$OnboardingScreenStateCopyWithImpl<OnboardingScreenState>(this as OnboardingScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingScreenState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isOnboarded, isOnboarded) || other.isOnboarded == isOnboarded)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isOnboarded,error);

@override
String toString() {
  return 'OnboardingScreenState(isLoading: $isLoading, isOnboarded: $isOnboarded, error: $error)';
}


}

/// @nodoc
abstract mixin class $OnboardingScreenStateCopyWith<$Res>  {
  factory $OnboardingScreenStateCopyWith(OnboardingScreenState value, $Res Function(OnboardingScreenState) _then) = _$OnboardingScreenStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isOnboarded, String? error
});




}
/// @nodoc
class _$OnboardingScreenStateCopyWithImpl<$Res>
    implements $OnboardingScreenStateCopyWith<$Res> {
  _$OnboardingScreenStateCopyWithImpl(this._self, this._then);

  final OnboardingScreenState _self;
  final $Res Function(OnboardingScreenState) _then;

/// Create a copy of OnboardingScreenState
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


/// @nodoc


class _OnboardingScreenState implements OnboardingScreenState {
  const _OnboardingScreenState({this.isLoading = false, this.isOnboarded = false, this.error});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isOnboarded;
@override final  String? error;

/// Create a copy of OnboardingScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingScreenStateCopyWith<_OnboardingScreenState> get copyWith => __$OnboardingScreenStateCopyWithImpl<_OnboardingScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingScreenState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isOnboarded, isOnboarded) || other.isOnboarded == isOnboarded)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isOnboarded,error);

@override
String toString() {
  return 'OnboardingScreenState(isLoading: $isLoading, isOnboarded: $isOnboarded, error: $error)';
}


}

/// @nodoc
abstract mixin class _$OnboardingScreenStateCopyWith<$Res> implements $OnboardingScreenStateCopyWith<$Res> {
  factory _$OnboardingScreenStateCopyWith(_OnboardingScreenState value, $Res Function(_OnboardingScreenState) _then) = __$OnboardingScreenStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isOnboarded, String? error
});




}
/// @nodoc
class __$OnboardingScreenStateCopyWithImpl<$Res>
    implements _$OnboardingScreenStateCopyWith<$Res> {
  __$OnboardingScreenStateCopyWithImpl(this._self, this._then);

  final _OnboardingScreenState _self;
  final $Res Function(_OnboardingScreenState) _then;

/// Create a copy of OnboardingScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isOnboarded = null,Object? error = freezed,}) {
  return _then(_OnboardingScreenState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isOnboarded: null == isOnboarded ? _self.isOnboarded : isOnboarded // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
