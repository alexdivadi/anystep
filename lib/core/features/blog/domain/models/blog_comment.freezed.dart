// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BlogCommentModel {

@JsonKey(includeIfNull: false) int? get id;@JsonKey(name: 'channel_id') int get channelId; String get body;@JsonKey(name: 'created_by_user_id') String get createdByUserId;@JsonKey(name: 'is_pinned') bool get isPinned;@JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) DateTime? get createdAt;@JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true) DateTime? get updatedAt;
/// Create a copy of BlogCommentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlogCommentModelCopyWith<BlogCommentModel> get copyWith => _$BlogCommentModelCopyWithImpl<BlogCommentModel>(this as BlogCommentModel, _$identity);

  /// Serializes this BlogCommentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlogCommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&(identical(other.body, body) || other.body == body)&&(identical(other.createdByUserId, createdByUserId) || other.createdByUserId == createdByUserId)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,channelId,body,createdByUserId,isPinned,createdAt,updatedAt);

@override
String toString() {
  return 'BlogCommentModel(id: $id, channelId: $channelId, body: $body, createdByUserId: $createdByUserId, isPinned: $isPinned, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BlogCommentModelCopyWith<$Res>  {
  factory $BlogCommentModelCopyWith(BlogCommentModel value, $Res Function(BlogCommentModel) _then) = _$BlogCommentModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) int? id,@JsonKey(name: 'channel_id') int channelId, String body,@JsonKey(name: 'created_by_user_id') String createdByUserId,@JsonKey(name: 'is_pinned') bool isPinned,@JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) DateTime? createdAt,@JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true) DateTime? updatedAt
});




}
/// @nodoc
class _$BlogCommentModelCopyWithImpl<$Res>
    implements $BlogCommentModelCopyWith<$Res> {
  _$BlogCommentModelCopyWithImpl(this._self, this._then);

  final BlogCommentModel _self;
  final $Res Function(BlogCommentModel) _then;

/// Create a copy of BlogCommentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? channelId = null,Object? body = null,Object? createdByUserId = null,Object? isPinned = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as int,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,createdByUserId: null == createdByUserId ? _self.createdByUserId : createdByUserId // ignore: cast_nullable_to_non_nullable
as String,isPinned: null == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BlogCommentModel].
extension BlogCommentModelPatterns on BlogCommentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlogCommentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlogCommentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlogCommentModel value)  $default,){
final _that = this;
switch (_that) {
case _BlogCommentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlogCommentModel value)?  $default,){
final _that = this;
switch (_that) {
case _BlogCommentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  int? id, @JsonKey(name: 'channel_id')  int channelId,  String body, @JsonKey(name: 'created_by_user_id')  String createdByUserId, @JsonKey(name: 'is_pinned')  bool isPinned, @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true)  DateTime? createdAt, @JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true)  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlogCommentModel() when $default != null:
return $default(_that.id,_that.channelId,_that.body,_that.createdByUserId,_that.isPinned,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  int? id, @JsonKey(name: 'channel_id')  int channelId,  String body, @JsonKey(name: 'created_by_user_id')  String createdByUserId, @JsonKey(name: 'is_pinned')  bool isPinned, @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true)  DateTime? createdAt, @JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true)  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BlogCommentModel():
return $default(_that.id,_that.channelId,_that.body,_that.createdByUserId,_that.isPinned,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  int? id, @JsonKey(name: 'channel_id')  int channelId,  String body, @JsonKey(name: 'created_by_user_id')  String createdByUserId, @JsonKey(name: 'is_pinned')  bool isPinned, @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true)  DateTime? createdAt, @JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true)  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BlogCommentModel() when $default != null:
return $default(_that.id,_that.channelId,_that.body,_that.createdByUserId,_that.isPinned,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BlogCommentModel implements BlogCommentModel {
  const _BlogCommentModel({@JsonKey(includeIfNull: false) this.id, @JsonKey(name: 'channel_id') required this.channelId, required this.body, @JsonKey(name: 'created_by_user_id') required this.createdByUserId, @JsonKey(name: 'is_pinned') this.isPinned = false, @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) this.createdAt, @JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true) this.updatedAt});
  factory _BlogCommentModel.fromJson(Map<String, dynamic> json) => _$BlogCommentModelFromJson(json);

@override@JsonKey(includeIfNull: false) final  int? id;
@override@JsonKey(name: 'channel_id') final  int channelId;
@override final  String body;
@override@JsonKey(name: 'created_by_user_id') final  String createdByUserId;
@override@JsonKey(name: 'is_pinned') final  bool isPinned;
@override@JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true) final  DateTime? updatedAt;

/// Create a copy of BlogCommentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlogCommentModelCopyWith<_BlogCommentModel> get copyWith => __$BlogCommentModelCopyWithImpl<_BlogCommentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlogCommentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlogCommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&(identical(other.body, body) || other.body == body)&&(identical(other.createdByUserId, createdByUserId) || other.createdByUserId == createdByUserId)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,channelId,body,createdByUserId,isPinned,createdAt,updatedAt);

@override
String toString() {
  return 'BlogCommentModel(id: $id, channelId: $channelId, body: $body, createdByUserId: $createdByUserId, isPinned: $isPinned, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BlogCommentModelCopyWith<$Res> implements $BlogCommentModelCopyWith<$Res> {
  factory _$BlogCommentModelCopyWith(_BlogCommentModel value, $Res Function(_BlogCommentModel) _then) = __$BlogCommentModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) int? id,@JsonKey(name: 'channel_id') int channelId, String body,@JsonKey(name: 'created_by_user_id') String createdByUserId,@JsonKey(name: 'is_pinned') bool isPinned,@JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) DateTime? createdAt,@JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true) DateTime? updatedAt
});




}
/// @nodoc
class __$BlogCommentModelCopyWithImpl<$Res>
    implements _$BlogCommentModelCopyWith<$Res> {
  __$BlogCommentModelCopyWithImpl(this._self, this._then);

  final _BlogCommentModel _self;
  final $Res Function(_BlogCommentModel) _then;

/// Create a copy of BlogCommentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? channelId = null,Object? body = null,Object? createdByUserId = null,Object? isPinned = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_BlogCommentModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as int,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,createdByUserId: null == createdByUserId ? _self.createdByUserId : createdByUserId // ignore: cast_nullable_to_non_nullable
as String,isPinned: null == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
