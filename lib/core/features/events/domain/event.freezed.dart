// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventModel {

 String get id; String get name; EventTemplateModel? get template; DateTime get startTime;// DateTime for event start
 DateTime get endTime;// DateTime for event end
 AddressModel get address; DateTime get updatedOn; DateTime get createdOn; String? get description; List<String>? get tags; String? get imageUrl;
/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventModelCopyWith<EventModel> get copyWith => _$EventModelCopyWithImpl<EventModel>(this as EventModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.template, template) || other.template == template)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.address, address) || other.address == address)&&(identical(other.updatedOn, updatedOn) || other.updatedOn == updatedOn)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,template,startTime,endTime,address,updatedOn,createdOn,description,const DeepCollectionEquality().hash(tags),imageUrl);

@override
String toString() {
  return 'EventModel(id: $id, name: $name, template: $template, startTime: $startTime, endTime: $endTime, address: $address, updatedOn: $updatedOn, createdOn: $createdOn, description: $description, tags: $tags, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $EventModelCopyWith<$Res>  {
  factory $EventModelCopyWith(EventModel value, $Res Function(EventModel) _then) = _$EventModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, DateTime startTime, DateTime endTime, AddressModel address, DateTime updatedOn, DateTime createdOn, EventTemplateModel? template, String? description, List<String>? tags, String? imageUrl
});




}
/// @nodoc
class _$EventModelCopyWithImpl<$Res>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._self, this._then);

  final EventModel _self;
  final $Res Function(EventModel) _then;

/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? startTime = null,Object? endTime = null,Object? address = null,Object? updatedOn = null,Object? createdOn = null,Object? template = freezed,Object? description = freezed,Object? tags = freezed,Object? imageUrl = freezed,}) {
  return _then(EventModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel,updatedOn: null == updatedOn ? _self.updatedOn : updatedOn // ignore: cast_nullable_to_non_nullable
as DateTime,createdOn: null == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as DateTime,template: freezed == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as EventTemplateModel?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


// dart format on
