// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpStatus()';
}


}

/// @nodoc
class $SignUpStatusCopyWith<$Res>  {
$SignUpStatusCopyWith(SignUpStatus _, $Res Function(SignUpStatus) __);
}


/// @nodoc


class SignUpStatusError extends SignUpStatus {
  const SignUpStatusError(this.message): super._();
  

 final  String message;

/// Create a copy of SignUpStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpStatusErrorCopyWith<SignUpStatusError> get copyWith => _$SignUpStatusErrorCopyWithImpl<SignUpStatusError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpStatusError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SignUpStatus.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SignUpStatusErrorCopyWith<$Res> implements $SignUpStatusCopyWith<$Res> {
  factory $SignUpStatusErrorCopyWith(SignUpStatusError value, $Res Function(SignUpStatusError) _then) = _$SignUpStatusErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SignUpStatusErrorCopyWithImpl<$Res>
    implements $SignUpStatusErrorCopyWith<$Res> {
  _$SignUpStatusErrorCopyWithImpl(this._self, this._then);

  final SignUpStatusError _self;
  final $Res Function(SignUpStatusError) _then;

/// Create a copy of SignUpStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SignUpStatusError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignUpStatusData extends SignUpStatus {
  const SignUpStatusData({required this.canSignUp, required this.didSignUp, this.userEvent}): super._();
  

 final  bool canSignUp;
 final  bool didSignUp;
 final  UserEventModel? userEvent;

/// Create a copy of SignUpStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpStatusDataCopyWith<SignUpStatusData> get copyWith => _$SignUpStatusDataCopyWithImpl<SignUpStatusData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpStatusData&&(identical(other.canSignUp, canSignUp) || other.canSignUp == canSignUp)&&(identical(other.didSignUp, didSignUp) || other.didSignUp == didSignUp)&&(identical(other.userEvent, userEvent) || other.userEvent == userEvent));
}


@override
int get hashCode => Object.hash(runtimeType,canSignUp,didSignUp,userEvent);

@override
String toString() {
  return 'SignUpStatus.data(canSignUp: $canSignUp, didSignUp: $didSignUp, userEvent: $userEvent)';
}


}

/// @nodoc
abstract mixin class $SignUpStatusDataCopyWith<$Res> implements $SignUpStatusCopyWith<$Res> {
  factory $SignUpStatusDataCopyWith(SignUpStatusData value, $Res Function(SignUpStatusData) _then) = _$SignUpStatusDataCopyWithImpl;
@useResult
$Res call({
 bool canSignUp, bool didSignUp, UserEventModel? userEvent
});


$UserEventModelCopyWith<$Res>? get userEvent;

}
/// @nodoc
class _$SignUpStatusDataCopyWithImpl<$Res>
    implements $SignUpStatusDataCopyWith<$Res> {
  _$SignUpStatusDataCopyWithImpl(this._self, this._then);

  final SignUpStatusData _self;
  final $Res Function(SignUpStatusData) _then;

/// Create a copy of SignUpStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? canSignUp = null,Object? didSignUp = null,Object? userEvent = freezed,}) {
  return _then(SignUpStatusData(
canSignUp: null == canSignUp ? _self.canSignUp : canSignUp // ignore: cast_nullable_to_non_nullable
as bool,didSignUp: null == didSignUp ? _self.didSignUp : didSignUp // ignore: cast_nullable_to_non_nullable
as bool,userEvent: freezed == userEvent ? _self.userEvent : userEvent // ignore: cast_nullable_to_non_nullable
as UserEventModel?,
  ));
}

/// Create a copy of SignUpStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEventModelCopyWith<$Res>? get userEvent {
    if (_self.userEvent == null) {
    return null;
  }

  return $UserEventModelCopyWith<$Res>(_self.userEvent!, (value) {
    return _then(_self.copyWith(userEvent: value));
  });
}
}

// dart format on
