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

 String get name; String get description; List<String> get tags; String get imageUrl;
/// Create a copy of EventTemplateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventTemplateModelCopyWith<EventTemplateModel> get copyWith => _$EventTemplateModelCopyWithImpl<EventTemplateModel>(this as EventTemplateModel, _$identity);



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
 String name, String description, List<String> tags, String imageUrl
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? tags = null,Object? imageUrl = null,}) {
  return _then(EventTemplateModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
