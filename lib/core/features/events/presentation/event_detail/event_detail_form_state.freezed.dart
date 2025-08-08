// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_detail_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EventDetailFormState {

 bool get isLoading; String? get error; int? get eventId;
/// Create a copy of EventDetailFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventDetailFormStateCopyWith<EventDetailFormState> get copyWith => _$EventDetailFormStateCopyWithImpl<EventDetailFormState>(this as EventDetailFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventDetailFormState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.eventId, eventId) || other.eventId == eventId));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,eventId);

@override
String toString() {
  return 'EventDetailFormState(isLoading: $isLoading, error: $error, eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class $EventDetailFormStateCopyWith<$Res>  {
  factory $EventDetailFormStateCopyWith(EventDetailFormState value, $Res Function(EventDetailFormState) _then) = _$EventDetailFormStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? error, int? eventId
});




}
/// @nodoc
class _$EventDetailFormStateCopyWithImpl<$Res>
    implements $EventDetailFormStateCopyWith<$Res> {
  _$EventDetailFormStateCopyWithImpl(this._self, this._then);

  final EventDetailFormState _self;
  final $Res Function(EventDetailFormState) _then;

/// Create a copy of EventDetailFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? error = freezed,Object? eventId = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc


class _EventDetailFormState implements EventDetailFormState {
  const _EventDetailFormState({this.isLoading = false, this.error, this.eventId});
  

@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override final  int? eventId;

/// Create a copy of EventDetailFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventDetailFormStateCopyWith<_EventDetailFormState> get copyWith => __$EventDetailFormStateCopyWithImpl<_EventDetailFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDetailFormState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.eventId, eventId) || other.eventId == eventId));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,eventId);

@override
String toString() {
  return 'EventDetailFormState(isLoading: $isLoading, error: $error, eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class _$EventDetailFormStateCopyWith<$Res> implements $EventDetailFormStateCopyWith<$Res> {
  factory _$EventDetailFormStateCopyWith(_EventDetailFormState value, $Res Function(_EventDetailFormState) _then) = __$EventDetailFormStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? error, int? eventId
});




}
/// @nodoc
class __$EventDetailFormStateCopyWithImpl<$Res>
    implements _$EventDetailFormStateCopyWith<$Res> {
  __$EventDetailFormStateCopyWithImpl(this._self, this._then);

  final _EventDetailFormState _self;
  final $Res Function(_EventDetailFormState) _then;

/// Create a copy of EventDetailFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? error = freezed,Object? eventId = freezed,}) {
  return _then(_EventDetailFormState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
