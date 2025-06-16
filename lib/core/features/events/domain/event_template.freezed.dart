// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventTemplateModel {

 String get name; String get description; List<String> get tags; String? get imageUrl;
/// Create a copy of EventTemplateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventTemplateModelCopyWith<EventTemplateModel> get copyWith => _$EventTemplateModelCopyWithImpl<EventTemplateModel>(this as EventTemplateModel, _$identity);

  /// Serializes this EventTemplateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventTemplateModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(tags),imageUrl);

@override
String toString() {
  return 'EventTemplateModel(name: $name, description: $description, tags: $tags, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $EventTemplateModelCopyWith<$Res>  {
  factory $EventTemplateModelCopyWith(EventTemplateModel value, $Res Function(EventTemplateModel) _then) = _$EventTemplateModelCopyWithImpl;
@useResult
$Res call({
 String name, String description, List<String> tags, String? imageUrl
});




}
/// @nodoc
class _$EventTemplateModelCopyWithImpl<$Res>
    implements $EventTemplateModelCopyWith<$Res> {
  _$EventTemplateModelCopyWithImpl(this._self, this._then);

  final EventTemplateModel _self;
  final $Res Function(EventTemplateModel) _then;

/// Create a copy of EventTemplateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? tags = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EventTemplateModel implements EventTemplateModel {
  const _EventTemplateModel({required this.name, required this.description, required final  List<String> tags, this.imageUrl}): _tags = tags;
  factory _EventTemplateModel.fromJson(Map<String, dynamic> json) => _$EventTemplateModelFromJson(json);

@override final  String name;
@override final  String description;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  String? imageUrl;

/// Create a copy of EventTemplateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventTemplateModelCopyWith<_EventTemplateModel> get copyWith => __$EventTemplateModelCopyWithImpl<_EventTemplateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventTemplateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventTemplateModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(_tags),imageUrl);

@override
String toString() {
  return 'EventTemplateModel(name: $name, description: $description, tags: $tags, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$EventTemplateModelCopyWith<$Res> implements $EventTemplateModelCopyWith<$Res> {
  factory _$EventTemplateModelCopyWith(_EventTemplateModel value, $Res Function(_EventTemplateModel) _then) = __$EventTemplateModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, List<String> tags, String? imageUrl
});




}
/// @nodoc
class __$EventTemplateModelCopyWithImpl<$Res>
    implements _$EventTemplateModelCopyWith<$Res> {
  __$EventTemplateModelCopyWithImpl(this._self, this._then);

  final _EventTemplateModel _self;
  final $Res Function(_EventTemplateModel) _then;

/// Create a copy of EventTemplateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? tags = null,Object? imageUrl = freezed,}) {
  return _then(_EventTemplateModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
