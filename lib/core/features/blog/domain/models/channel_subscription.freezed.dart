// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelSubscriptionModel {

@JsonKey(includeIfNull: false) int? get id;@JsonKey(name: 'channel_id') int get channelId;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) DateTime? get createdAt;
/// Create a copy of ChannelSubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChannelSubscriptionModelCopyWith<ChannelSubscriptionModel> get copyWith => _$ChannelSubscriptionModelCopyWithImpl<ChannelSubscriptionModel>(this as ChannelSubscriptionModel, _$identity);

  /// Serializes this ChannelSubscriptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChannelSubscriptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,channelId,userId,createdAt);

@override
String toString() {
  return 'ChannelSubscriptionModel(id: $id, channelId: $channelId, userId: $userId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ChannelSubscriptionModelCopyWith<$Res>  {
  factory $ChannelSubscriptionModelCopyWith(ChannelSubscriptionModel value, $Res Function(ChannelSubscriptionModel) _then) = _$ChannelSubscriptionModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) int? id,@JsonKey(name: 'channel_id') int channelId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) DateTime? createdAt
});




}
/// @nodoc
class _$ChannelSubscriptionModelCopyWithImpl<$Res>
    implements $ChannelSubscriptionModelCopyWith<$Res> {
  _$ChannelSubscriptionModelCopyWithImpl(this._self, this._then);

  final ChannelSubscriptionModel _self;
  final $Res Function(ChannelSubscriptionModel) _then;

/// Create a copy of ChannelSubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? channelId = null,Object? userId = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChannelSubscriptionModel].
extension ChannelSubscriptionModelPatterns on ChannelSubscriptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChannelSubscriptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChannelSubscriptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChannelSubscriptionModel value)  $default,){
final _that = this;
switch (_that) {
case _ChannelSubscriptionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChannelSubscriptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChannelSubscriptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  int? id, @JsonKey(name: 'channel_id')  int channelId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true)  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChannelSubscriptionModel() when $default != null:
return $default(_that.id,_that.channelId,_that.userId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  int? id, @JsonKey(name: 'channel_id')  int channelId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true)  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ChannelSubscriptionModel():
return $default(_that.id,_that.channelId,_that.userId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  int? id, @JsonKey(name: 'channel_id')  int channelId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true)  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ChannelSubscriptionModel() when $default != null:
return $default(_that.id,_that.channelId,_that.userId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChannelSubscriptionModel implements ChannelSubscriptionModel {
  const _ChannelSubscriptionModel({@JsonKey(includeIfNull: false) this.id, @JsonKey(name: 'channel_id') required this.channelId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) this.createdAt});
  factory _ChannelSubscriptionModel.fromJson(Map<String, dynamic> json) => _$ChannelSubscriptionModelFromJson(json);

@override@JsonKey(includeIfNull: false) final  int? id;
@override@JsonKey(name: 'channel_id') final  int channelId;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) final  DateTime? createdAt;

/// Create a copy of ChannelSubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChannelSubscriptionModelCopyWith<_ChannelSubscriptionModel> get copyWith => __$ChannelSubscriptionModelCopyWithImpl<_ChannelSubscriptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChannelSubscriptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChannelSubscriptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,channelId,userId,createdAt);

@override
String toString() {
  return 'ChannelSubscriptionModel(id: $id, channelId: $channelId, userId: $userId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ChannelSubscriptionModelCopyWith<$Res> implements $ChannelSubscriptionModelCopyWith<$Res> {
  factory _$ChannelSubscriptionModelCopyWith(_ChannelSubscriptionModel value, $Res Function(_ChannelSubscriptionModel) _then) = __$ChannelSubscriptionModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) int? id,@JsonKey(name: 'channel_id') int channelId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) DateTime? createdAt
});




}
/// @nodoc
class __$ChannelSubscriptionModelCopyWithImpl<$Res>
    implements _$ChannelSubscriptionModelCopyWith<$Res> {
  __$ChannelSubscriptionModelCopyWithImpl(this._self, this._then);

  final _ChannelSubscriptionModel _self;
  final $Res Function(_ChannelSubscriptionModel) _then;

/// Create a copy of ChannelSubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? channelId = null,Object? userId = null,Object? createdAt = freezed,}) {
  return _then(_ChannelSubscriptionModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
