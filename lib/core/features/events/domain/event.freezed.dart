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

@JsonKey(includeIfNull: false) int? get id; String get name;// EventTemplateModel? template,
@JsonKey(name: "start_time") DateTime get startTime;@JsonKey(name: "end_time") DateTime get endTime;@JsonKey(name: "address") int? get addressId;@JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) AddressModel? get address; List<String>? get tags; String? get description;@JsonKey(name: "image_url") String? get imageUrl;@JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") DateTime? get createdAt;
/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventModelCopyWith<EventModel> get copyWith => _$EventModelCopyWithImpl<EventModel>(this as EventModel, _$identity);

  /// Serializes this EventModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,startTime,endTime,addressId,address,const DeepCollectionEquality().hash(tags),description,imageUrl,createdAt);

@override
String toString() {
  return 'EventModel(id: $id, name: $name, startTime: $startTime, endTime: $endTime, addressId: $addressId, address: $address, tags: $tags, description: $description, imageUrl: $imageUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $EventModelCopyWith<$Res>  {
  factory $EventModelCopyWith(EventModel value, $Res Function(EventModel) _then) = _$EventModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, String name,@JsonKey(name: "start_time") DateTime startTime,@JsonKey(name: "end_time") DateTime endTime,@JsonKey(name: "address") int? addressId,@JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) AddressModel? address, List<String>? tags, String? description,@JsonKey(name: "image_url") String? imageUrl,@JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") DateTime? createdAt
});


$AddressModelCopyWith<$Res>? get address;

}
/// @nodoc
class _$EventModelCopyWithImpl<$Res>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._self, this._then);

  final EventModel _self;
  final $Res Function(EventModel) _then;

/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? startTime = null,Object? endTime = null,Object? addressId = freezed,Object? address = freezed,Object? tags = freezed,Object? description = freezed,Object? imageUrl = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as int?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressModelCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressModelCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _EventModel implements EventModel {
  const _EventModel({@JsonKey(includeIfNull: false) this.id, required this.name, @JsonKey(name: "start_time") required this.startTime, @JsonKey(name: "end_time") required this.endTime, @JsonKey(name: "address") this.addressId, @JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) this.address, final  List<String>? tags, this.description, @JsonKey(name: "image_url") this.imageUrl, @JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") this.createdAt}): _tags = tags;
  factory _EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);

@override@JsonKey(includeIfNull: false) final  int? id;
@override final  String name;
// EventTemplateModel? template,
@override@JsonKey(name: "start_time") final  DateTime startTime;
@override@JsonKey(name: "end_time") final  DateTime endTime;
@override@JsonKey(name: "address") final  int? addressId;
@override@JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) final  AddressModel? address;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? description;
@override@JsonKey(name: "image_url") final  String? imageUrl;
@override@JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") final  DateTime? createdAt;

/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventModelCopyWith<_EventModel> get copyWith => __$EventModelCopyWithImpl<_EventModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,startTime,endTime,addressId,address,const DeepCollectionEquality().hash(_tags),description,imageUrl,createdAt);

@override
String toString() {
  return 'EventModel(id: $id, name: $name, startTime: $startTime, endTime: $endTime, addressId: $addressId, address: $address, tags: $tags, description: $description, imageUrl: $imageUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$EventModelCopyWith<$Res> implements $EventModelCopyWith<$Res> {
  factory _$EventModelCopyWith(_EventModel value, $Res Function(_EventModel) _then) = __$EventModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, String name,@JsonKey(name: "start_time") DateTime startTime,@JsonKey(name: "end_time") DateTime endTime,@JsonKey(name: "address") int? addressId,@JsonKey(name: "address_model", includeToJson: false, includeFromJson: true) AddressModel? address, List<String>? tags, String? description,@JsonKey(name: "image_url") String? imageUrl,@JsonKey(includeToJson: false, includeFromJson: true, name: "created_at") DateTime? createdAt
});


@override $AddressModelCopyWith<$Res>? get address;

}
/// @nodoc
class __$EventModelCopyWithImpl<$Res>
    implements _$EventModelCopyWith<$Res> {
  __$EventModelCopyWithImpl(this._self, this._then);

  final _EventModel _self;
  final $Res Function(_EventModel) _then;

/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? startTime = null,Object? endTime = null,Object? addressId = freezed,Object? address = freezed,Object? tags = freezed,Object? description = freezed,Object? imageUrl = freezed,Object? createdAt = freezed,}) {
  return _then(_EventModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as int?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of EventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressModelCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressModelCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}

// dart format on
