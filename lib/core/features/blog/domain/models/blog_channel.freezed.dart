// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BlogChannelModel {

@JsonKey(includeIfNull: false) int? get id; String get title; String? get description;@JsonKey(name: 'event_id') int? get eventId;@JsonKey(name: 'comment_policy') BlogCommentPolicy get commentPolicy;@JsonKey(name: 'is_closed') bool get isClosed;@JsonKey(name: 'created_by_admin_id') String? get createdByAdminId;@JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) DateTime? get createdAt;@JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true) DateTime? get updatedAt;
/// Create a copy of BlogChannelModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlogChannelModelCopyWith<BlogChannelModel> get copyWith => _$BlogChannelModelCopyWithImpl<BlogChannelModel>(this as BlogChannelModel, _$identity);

  /// Serializes this BlogChannelModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlogChannelModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.commentPolicy, commentPolicy) || other.commentPolicy == commentPolicy)&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed)&&(identical(other.createdByAdminId, createdByAdminId) || other.createdByAdminId == createdByAdminId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,eventId,commentPolicy,isClosed,createdByAdminId,createdAt,updatedAt);

@override
String toString() {
  return 'BlogChannelModel(id: $id, title: $title, description: $description, eventId: $eventId, commentPolicy: $commentPolicy, isClosed: $isClosed, createdByAdminId: $createdByAdminId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BlogChannelModelCopyWith<$Res>  {
  factory $BlogChannelModelCopyWith(BlogChannelModel value, $Res Function(BlogChannelModel) _then) = _$BlogChannelModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, String title, String? description,@JsonKey(name: 'event_id') int? eventId,@JsonKey(name: 'comment_policy') BlogCommentPolicy commentPolicy,@JsonKey(name: 'is_closed') bool isClosed,@JsonKey(name: 'created_by_admin_id') String? createdByAdminId,@JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) DateTime? createdAt,@JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true) DateTime? updatedAt
});




}
/// @nodoc
class _$BlogChannelModelCopyWithImpl<$Res>
    implements $BlogChannelModelCopyWith<$Res> {
  _$BlogChannelModelCopyWithImpl(this._self, this._then);

  final BlogChannelModel _self;
  final $Res Function(BlogChannelModel) _then;

/// Create a copy of BlogChannelModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? description = freezed,Object? eventId = freezed,Object? commentPolicy = null,Object? isClosed = null,Object? createdByAdminId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as int?,commentPolicy: null == commentPolicy ? _self.commentPolicy : commentPolicy // ignore: cast_nullable_to_non_nullable
as BlogCommentPolicy,isClosed: null == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool,createdByAdminId: freezed == createdByAdminId ? _self.createdByAdminId : createdByAdminId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BlogChannelModel].
extension BlogChannelModelPatterns on BlogChannelModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlogChannelModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlogChannelModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlogChannelModel value)  $default,){
final _that = this;
switch (_that) {
case _BlogChannelModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlogChannelModel value)?  $default,){
final _that = this;
switch (_that) {
case _BlogChannelModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  int? id,  String title,  String? description, @JsonKey(name: 'event_id')  int? eventId, @JsonKey(name: 'comment_policy')  BlogCommentPolicy commentPolicy, @JsonKey(name: 'is_closed')  bool isClosed, @JsonKey(name: 'created_by_admin_id')  String? createdByAdminId, @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true)  DateTime? createdAt, @JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true)  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlogChannelModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.eventId,_that.commentPolicy,_that.isClosed,_that.createdByAdminId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  int? id,  String title,  String? description, @JsonKey(name: 'event_id')  int? eventId, @JsonKey(name: 'comment_policy')  BlogCommentPolicy commentPolicy, @JsonKey(name: 'is_closed')  bool isClosed, @JsonKey(name: 'created_by_admin_id')  String? createdByAdminId, @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true)  DateTime? createdAt, @JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true)  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BlogChannelModel():
return $default(_that.id,_that.title,_that.description,_that.eventId,_that.commentPolicy,_that.isClosed,_that.createdByAdminId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  int? id,  String title,  String? description, @JsonKey(name: 'event_id')  int? eventId, @JsonKey(name: 'comment_policy')  BlogCommentPolicy commentPolicy, @JsonKey(name: 'is_closed')  bool isClosed, @JsonKey(name: 'created_by_admin_id')  String? createdByAdminId, @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true)  DateTime? createdAt, @JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true)  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BlogChannelModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.eventId,_that.commentPolicy,_that.isClosed,_that.createdByAdminId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BlogChannelModel implements BlogChannelModel {
  const _BlogChannelModel({@JsonKey(includeIfNull: false) this.id, required this.title, this.description, @JsonKey(name: 'event_id') this.eventId, @JsonKey(name: 'comment_policy') required this.commentPolicy, @JsonKey(name: 'is_closed') this.isClosed = false, @JsonKey(name: 'created_by_admin_id') this.createdByAdminId, @JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) this.createdAt, @JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true) this.updatedAt});
  factory _BlogChannelModel.fromJson(Map<String, dynamic> json) => _$BlogChannelModelFromJson(json);

@override@JsonKey(includeIfNull: false) final  int? id;
@override final  String title;
@override final  String? description;
@override@JsonKey(name: 'event_id') final  int? eventId;
@override@JsonKey(name: 'comment_policy') final  BlogCommentPolicy commentPolicy;
@override@JsonKey(name: 'is_closed') final  bool isClosed;
@override@JsonKey(name: 'created_by_admin_id') final  String? createdByAdminId;
@override@JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true) final  DateTime? updatedAt;

/// Create a copy of BlogChannelModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlogChannelModelCopyWith<_BlogChannelModel> get copyWith => __$BlogChannelModelCopyWithImpl<_BlogChannelModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlogChannelModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlogChannelModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.commentPolicy, commentPolicy) || other.commentPolicy == commentPolicy)&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed)&&(identical(other.createdByAdminId, createdByAdminId) || other.createdByAdminId == createdByAdminId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,eventId,commentPolicy,isClosed,createdByAdminId,createdAt,updatedAt);

@override
String toString() {
  return 'BlogChannelModel(id: $id, title: $title, description: $description, eventId: $eventId, commentPolicy: $commentPolicy, isClosed: $isClosed, createdByAdminId: $createdByAdminId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BlogChannelModelCopyWith<$Res> implements $BlogChannelModelCopyWith<$Res> {
  factory _$BlogChannelModelCopyWith(_BlogChannelModel value, $Res Function(_BlogChannelModel) _then) = __$BlogChannelModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, String title, String? description,@JsonKey(name: 'event_id') int? eventId,@JsonKey(name: 'comment_policy') BlogCommentPolicy commentPolicy,@JsonKey(name: 'is_closed') bool isClosed,@JsonKey(name: 'created_by_admin_id') String? createdByAdminId,@JsonKey(name: 'created_at', includeToJson: false, includeFromJson: true) DateTime? createdAt,@JsonKey(name: 'updated_at', includeToJson: false, includeFromJson: true) DateTime? updatedAt
});




}
/// @nodoc
class __$BlogChannelModelCopyWithImpl<$Res>
    implements _$BlogChannelModelCopyWith<$Res> {
  __$BlogChannelModelCopyWithImpl(this._self, this._then);

  final _BlogChannelModel _self;
  final $Res Function(_BlogChannelModel) _then;

/// Create a copy of BlogChannelModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? description = freezed,Object? eventId = freezed,Object? commentPolicy = null,Object? isClosed = null,Object? createdByAdminId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_BlogChannelModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as int?,commentPolicy: null == commentPolicy ? _self.commentPolicy : commentPolicy // ignore: cast_nullable_to_non_nullable
as BlogCommentPolicy,isClosed: null == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool,createdByAdminId: freezed == createdByAdminId ? _self.createdByAdminId : createdByAdminId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
