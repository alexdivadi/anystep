// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressModel {

@JsonKey(includeIfNull: false) int? get id; String get street;@JsonKey(name: "street_secondary") String? get streetSecondary; String get city; String get state; String? get country;@JsonKey(name: "postal_code") String get postalCode;@JsonKey(name: "is_user_address") bool get isUserAddress; double? get latitude; double? get longitude;@JsonKey(name: "place_id") String? get placeId; String? get name; String? get geohash;
/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressModelCopyWith<AddressModel> get copyWith => _$AddressModelCopyWithImpl<AddressModel>(this as AddressModel, _$identity);

  /// Serializes this AddressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressModel&&(identical(other.id, id) || other.id == id)&&(identical(other.street, street) || other.street == street)&&(identical(other.streetSecondary, streetSecondary) || other.streetSecondary == streetSecondary)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.isUserAddress, isUserAddress) || other.isUserAddress == isUserAddress)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.geohash, geohash) || other.geohash == geohash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,street,streetSecondary,city,state,country,postalCode,isUserAddress,latitude,longitude,placeId,name,geohash);

@override
String toString() {
  return 'AddressModel(id: $id, street: $street, streetSecondary: $streetSecondary, city: $city, state: $state, country: $country, postalCode: $postalCode, isUserAddress: $isUserAddress, latitude: $latitude, longitude: $longitude, placeId: $placeId, name: $name, geohash: $geohash)';
}


}

/// @nodoc
abstract mixin class $AddressModelCopyWith<$Res>  {
  factory $AddressModelCopyWith(AddressModel value, $Res Function(AddressModel) _then) = _$AddressModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, String street,@JsonKey(name: "street_secondary") String? streetSecondary, String city, String state, String? country,@JsonKey(name: "postal_code") String postalCode,@JsonKey(name: "is_user_address") bool isUserAddress, double? latitude, double? longitude,@JsonKey(name: "place_id") String? placeId, String? name, String? geohash
});




}
/// @nodoc
class _$AddressModelCopyWithImpl<$Res>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._self, this._then);

  final AddressModel _self;
  final $Res Function(AddressModel) _then;

/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? street = null,Object? streetSecondary = freezed,Object? city = null,Object? state = null,Object? country = freezed,Object? postalCode = null,Object? isUserAddress = null,Object? latitude = freezed,Object? longitude = freezed,Object? placeId = freezed,Object? name = freezed,Object? geohash = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,streetSecondary: freezed == streetSecondary ? _self.streetSecondary : streetSecondary // ignore: cast_nullable_to_non_nullable
as String?,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,isUserAddress: null == isUserAddress ? _self.isUserAddress : isUserAddress // ignore: cast_nullable_to_non_nullable
as bool,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,placeId: freezed == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,geohash: freezed == geohash ? _self.geohash : geohash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AddressModel extends AddressModel {
  const _AddressModel({@JsonKey(includeIfNull: false) this.id, required this.street, @JsonKey(name: "street_secondary") this.streetSecondary, required this.city, required this.state, this.country, @JsonKey(name: "postal_code") required this.postalCode, @JsonKey(name: "is_user_address") required this.isUserAddress, this.latitude, this.longitude, @JsonKey(name: "place_id") this.placeId, this.name, this.geohash}): super._();
  factory _AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

@override@JsonKey(includeIfNull: false) final  int? id;
@override final  String street;
@override@JsonKey(name: "street_secondary") final  String? streetSecondary;
@override final  String city;
@override final  String state;
@override final  String? country;
@override@JsonKey(name: "postal_code") final  String postalCode;
@override@JsonKey(name: "is_user_address") final  bool isUserAddress;
@override final  double? latitude;
@override final  double? longitude;
@override@JsonKey(name: "place_id") final  String? placeId;
@override final  String? name;
@override final  String? geohash;

/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressModelCopyWith<_AddressModel> get copyWith => __$AddressModelCopyWithImpl<_AddressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressModel&&(identical(other.id, id) || other.id == id)&&(identical(other.street, street) || other.street == street)&&(identical(other.streetSecondary, streetSecondary) || other.streetSecondary == streetSecondary)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.isUserAddress, isUserAddress) || other.isUserAddress == isUserAddress)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.geohash, geohash) || other.geohash == geohash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,street,streetSecondary,city,state,country,postalCode,isUserAddress,latitude,longitude,placeId,name,geohash);

@override
String toString() {
  return 'AddressModel(id: $id, street: $street, streetSecondary: $streetSecondary, city: $city, state: $state, country: $country, postalCode: $postalCode, isUserAddress: $isUserAddress, latitude: $latitude, longitude: $longitude, placeId: $placeId, name: $name, geohash: $geohash)';
}


}

/// @nodoc
abstract mixin class _$AddressModelCopyWith<$Res> implements $AddressModelCopyWith<$Res> {
  factory _$AddressModelCopyWith(_AddressModel value, $Res Function(_AddressModel) _then) = __$AddressModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, String street,@JsonKey(name: "street_secondary") String? streetSecondary, String city, String state, String? country,@JsonKey(name: "postal_code") String postalCode,@JsonKey(name: "is_user_address") bool isUserAddress, double? latitude, double? longitude,@JsonKey(name: "place_id") String? placeId, String? name, String? geohash
});




}
/// @nodoc
class __$AddressModelCopyWithImpl<$Res>
    implements _$AddressModelCopyWith<$Res> {
  __$AddressModelCopyWithImpl(this._self, this._then);

  final _AddressModel _self;
  final $Res Function(_AddressModel) _then;

/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? street = null,Object? streetSecondary = freezed,Object? city = null,Object? state = null,Object? country = freezed,Object? postalCode = null,Object? isUserAddress = null,Object? latitude = freezed,Object? longitude = freezed,Object? placeId = freezed,Object? name = freezed,Object? geohash = freezed,}) {
  return _then(_AddressModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,streetSecondary: freezed == streetSecondary ? _self.streetSecondary : streetSecondary // ignore: cast_nullable_to_non_nullable
as String?,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,isUserAddress: null == isUserAddress ? _self.isUserAddress : isUserAddress // ignore: cast_nullable_to_non_nullable
as bool,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,placeId: freezed == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,geohash: freezed == geohash ? _self.geohash : geohash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
