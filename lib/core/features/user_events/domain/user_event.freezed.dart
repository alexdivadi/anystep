// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserEventModel {

@JsonKey(includeIfNull: false) int? get id; bool get attended;@JsonKey(name: "user") String? get userId;@JsonKey(name: "user_model", includeToJson: false, includeFromJson: true) UserModel? get user;@JsonKey(name: "event") int? get eventId;@JsonKey(name: "event_model", includeToJson: false, includeFromJson: true) EventModel? get event;@JsonKey(name: "check_in_at", includeIfNull: false) DateTime? get checkInAt;@JsonKey(name: "check_out_at", includeIfNull: false) DateTime? get checkOutAt;@JsonKey(name: "created_at", includeToJson: false, includeFromJson: true) DateTime? get createdAt;
/// Create a copy of UserEventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEventModelCopyWith<UserEventModel> get copyWith => _$UserEventModelCopyWithImpl<UserEventModel>(this as UserEventModel, _$identity);

  /// Serializes this UserEventModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.attended, attended) || other.attended == attended)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.event, event) || other.event == event)&&(identical(other.checkInAt, checkInAt) || other.checkInAt == checkInAt)&&(identical(other.checkOutAt, checkOutAt) || other.checkOutAt == checkOutAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,attended,userId,user,eventId,event,checkInAt,checkOutAt,createdAt);

@override
String toString() {
  return 'UserEventModel(id: $id, attended: $attended, userId: $userId, user: $user, eventId: $eventId, event: $event, checkInAt: $checkInAt, checkOutAt: $checkOutAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserEventModelCopyWith<$Res>  {
  factory $UserEventModelCopyWith(UserEventModel value, $Res Function(UserEventModel) _then) = _$UserEventModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, bool attended,@JsonKey(name: "user") String? userId,@JsonKey(name: "user_model", includeToJson: false, includeFromJson: true) UserModel? user,@JsonKey(name: "event") int? eventId,@JsonKey(name: "event_model", includeToJson: false, includeFromJson: true) EventModel? event,@JsonKey(name: "check_in_at", includeIfNull: false) DateTime? checkInAt,@JsonKey(name: "check_out_at", includeIfNull: false) DateTime? checkOutAt,@JsonKey(name: "created_at", includeToJson: false, includeFromJson: true) DateTime? createdAt
});


$UserModelCopyWith<$Res>? get user;$EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class _$UserEventModelCopyWithImpl<$Res>
    implements $UserEventModelCopyWith<$Res> {
  _$UserEventModelCopyWithImpl(this._self, this._then);

  final UserEventModel _self;
  final $Res Function(UserEventModel) _then;

/// Create a copy of UserEventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? attended = null,Object? userId = freezed,Object? user = freezed,Object? eventId = freezed,Object? event = freezed,Object? checkInAt = freezed,Object? checkOutAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,attended: null == attended ? _self.attended : attended // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as int?,event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,checkInAt: freezed == checkInAt ? _self.checkInAt : checkInAt // ignore: cast_nullable_to_non_nullable
as DateTime?,checkOutAt: freezed == checkOutAt ? _self.checkOutAt : checkOutAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of UserEventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of UserEventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserEventModel].
extension UserEventModelPatterns on UserEventModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEventModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEventModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEventModel value)  $default,){
final _that = this;
switch (_that) {
case _UserEventModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEventModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserEventModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  int? id,  bool attended, @JsonKey(name: "user")  String? userId, @JsonKey(name: "user_model", includeToJson: false, includeFromJson: true)  UserModel? user, @JsonKey(name: "event")  int? eventId, @JsonKey(name: "event_model", includeToJson: false, includeFromJson: true)  EventModel? event, @JsonKey(name: "check_in_at", includeIfNull: false)  DateTime? checkInAt, @JsonKey(name: "check_out_at", includeIfNull: false)  DateTime? checkOutAt, @JsonKey(name: "created_at", includeToJson: false, includeFromJson: true)  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEventModel() when $default != null:
return $default(_that.id,_that.attended,_that.userId,_that.user,_that.eventId,_that.event,_that.checkInAt,_that.checkOutAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  int? id,  bool attended, @JsonKey(name: "user")  String? userId, @JsonKey(name: "user_model", includeToJson: false, includeFromJson: true)  UserModel? user, @JsonKey(name: "event")  int? eventId, @JsonKey(name: "event_model", includeToJson: false, includeFromJson: true)  EventModel? event, @JsonKey(name: "check_in_at", includeIfNull: false)  DateTime? checkInAt, @JsonKey(name: "check_out_at", includeIfNull: false)  DateTime? checkOutAt, @JsonKey(name: "created_at", includeToJson: false, includeFromJson: true)  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserEventModel():
return $default(_that.id,_that.attended,_that.userId,_that.user,_that.eventId,_that.event,_that.checkInAt,_that.checkOutAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  int? id,  bool attended, @JsonKey(name: "user")  String? userId, @JsonKey(name: "user_model", includeToJson: false, includeFromJson: true)  UserModel? user, @JsonKey(name: "event")  int? eventId, @JsonKey(name: "event_model", includeToJson: false, includeFromJson: true)  EventModel? event, @JsonKey(name: "check_in_at", includeIfNull: false)  DateTime? checkInAt, @JsonKey(name: "check_out_at", includeIfNull: false)  DateTime? checkOutAt, @JsonKey(name: "created_at", includeToJson: false, includeFromJson: true)  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserEventModel() when $default != null:
return $default(_that.id,_that.attended,_that.userId,_that.user,_that.eventId,_that.event,_that.checkInAt,_that.checkOutAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserEventModel implements UserEventModel {
  const _UserEventModel({@JsonKey(includeIfNull: false) this.id, required this.attended, @JsonKey(name: "user") this.userId, @JsonKey(name: "user_model", includeToJson: false, includeFromJson: true) this.user, @JsonKey(name: "event") this.eventId, @JsonKey(name: "event_model", includeToJson: false, includeFromJson: true) this.event, @JsonKey(name: "check_in_at", includeIfNull: false) this.checkInAt, @JsonKey(name: "check_out_at", includeIfNull: false) this.checkOutAt, @JsonKey(name: "created_at", includeToJson: false, includeFromJson: true) this.createdAt});
  factory _UserEventModel.fromJson(Map<String, dynamic> json) => _$UserEventModelFromJson(json);

@override@JsonKey(includeIfNull: false) final  int? id;
@override final  bool attended;
@override@JsonKey(name: "user") final  String? userId;
@override@JsonKey(name: "user_model", includeToJson: false, includeFromJson: true) final  UserModel? user;
@override@JsonKey(name: "event") final  int? eventId;
@override@JsonKey(name: "event_model", includeToJson: false, includeFromJson: true) final  EventModel? event;
@override@JsonKey(name: "check_in_at", includeIfNull: false) final  DateTime? checkInAt;
@override@JsonKey(name: "check_out_at", includeIfNull: false) final  DateTime? checkOutAt;
@override@JsonKey(name: "created_at", includeToJson: false, includeFromJson: true) final  DateTime? createdAt;

/// Create a copy of UserEventModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEventModelCopyWith<_UserEventModel> get copyWith => __$UserEventModelCopyWithImpl<_UserEventModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserEventModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.attended, attended) || other.attended == attended)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.event, event) || other.event == event)&&(identical(other.checkInAt, checkInAt) || other.checkInAt == checkInAt)&&(identical(other.checkOutAt, checkOutAt) || other.checkOutAt == checkOutAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,attended,userId,user,eventId,event,checkInAt,checkOutAt,createdAt);

@override
String toString() {
  return 'UserEventModel(id: $id, attended: $attended, userId: $userId, user: $user, eventId: $eventId, event: $event, checkInAt: $checkInAt, checkOutAt: $checkOutAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserEventModelCopyWith<$Res> implements $UserEventModelCopyWith<$Res> {
  factory _$UserEventModelCopyWith(_UserEventModel value, $Res Function(_UserEventModel) _then) = __$UserEventModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, bool attended,@JsonKey(name: "user") String? userId,@JsonKey(name: "user_model", includeToJson: false, includeFromJson: true) UserModel? user,@JsonKey(name: "event") int? eventId,@JsonKey(name: "event_model", includeToJson: false, includeFromJson: true) EventModel? event,@JsonKey(name: "check_in_at", includeIfNull: false) DateTime? checkInAt,@JsonKey(name: "check_out_at", includeIfNull: false) DateTime? checkOutAt,@JsonKey(name: "created_at", includeToJson: false, includeFromJson: true) DateTime? createdAt
});


@override $UserModelCopyWith<$Res>? get user;@override $EventModelCopyWith<$Res>? get event;

}
/// @nodoc
class __$UserEventModelCopyWithImpl<$Res>
    implements _$UserEventModelCopyWith<$Res> {
  __$UserEventModelCopyWithImpl(this._self, this._then);

  final _UserEventModel _self;
  final $Res Function(_UserEventModel) _then;

/// Create a copy of UserEventModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? attended = null,Object? userId = freezed,Object? user = freezed,Object? eventId = freezed,Object? event = freezed,Object? checkInAt = freezed,Object? checkOutAt = freezed,Object? createdAt = freezed,}) {
  return _then(_UserEventModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,attended: null == attended ? _self.attended : attended // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as int?,event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as EventModel?,checkInAt: freezed == checkInAt ? _self.checkInAt : checkInAt // ignore: cast_nullable_to_non_nullable
as DateTime?,checkOutAt: freezed == checkOutAt ? _self.checkOutAt : checkOutAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of UserEventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of UserEventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventModelCopyWith<$Res>? get event {
    if (_self.event == null) {
    return null;
  }

  return $EventModelCopyWith<$Res>(_self.event!, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

// dart format on
