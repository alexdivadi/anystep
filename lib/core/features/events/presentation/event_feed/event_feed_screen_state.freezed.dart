// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_feed_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EventFeedScreenState {

 List<EventModel> get items; List<EventModel> get page; String? get lastId;
/// Create a copy of EventFeedScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventFeedScreenStateCopyWith<EventFeedScreenState> get copyWith => _$EventFeedScreenStateCopyWithImpl<EventFeedScreenState>(this as EventFeedScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventFeedScreenState&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.page, page)&&(identical(other.lastId, lastId) || other.lastId == lastId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(page),lastId);

@override
String toString() {
  return 'EventFeedScreenState(items: $items, page: $page, lastId: $lastId)';
}


}

/// @nodoc
abstract mixin class $EventFeedScreenStateCopyWith<$Res>  {
  factory $EventFeedScreenStateCopyWith(EventFeedScreenState value, $Res Function(EventFeedScreenState) _then) = _$EventFeedScreenStateCopyWithImpl;
@useResult
$Res call({
 List<EventModel> items, List<EventModel> page, String? lastId
});




}
/// @nodoc
class _$EventFeedScreenStateCopyWithImpl<$Res>
    implements $EventFeedScreenStateCopyWith<$Res> {
  _$EventFeedScreenStateCopyWithImpl(this._self, this._then);

  final EventFeedScreenState _self;
  final $Res Function(EventFeedScreenState) _then;

/// Create a copy of EventFeedScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? lastId = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<EventModel>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as List<EventModel>,lastId: freezed == lastId ? _self.lastId : lastId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _EventFeedScreenState implements EventFeedScreenState {
  const _EventFeedScreenState({final  List<EventModel> items = const [], final  List<EventModel> page = const [], this.lastId}): _items = items,_page = page;
  

 final  List<EventModel> _items;
@override@JsonKey() List<EventModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<EventModel> _page;
@override@JsonKey() List<EventModel> get page {
  if (_page is EqualUnmodifiableListView) return _page;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_page);
}

@override final  String? lastId;

/// Create a copy of EventFeedScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventFeedScreenStateCopyWith<_EventFeedScreenState> get copyWith => __$EventFeedScreenStateCopyWithImpl<_EventFeedScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventFeedScreenState&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._page, _page)&&(identical(other.lastId, lastId) || other.lastId == lastId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_page),lastId);

@override
String toString() {
  return 'EventFeedScreenState(items: $items, page: $page, lastId: $lastId)';
}


}

/// @nodoc
abstract mixin class _$EventFeedScreenStateCopyWith<$Res> implements $EventFeedScreenStateCopyWith<$Res> {
  factory _$EventFeedScreenStateCopyWith(_EventFeedScreenState value, $Res Function(_EventFeedScreenState) _then) = __$EventFeedScreenStateCopyWithImpl;
@override @useResult
$Res call({
 List<EventModel> items, List<EventModel> page, String? lastId
});




}
/// @nodoc
class __$EventFeedScreenStateCopyWithImpl<$Res>
    implements _$EventFeedScreenStateCopyWith<$Res> {
  __$EventFeedScreenStateCopyWithImpl(this._self, this._then);

  final _EventFeedScreenState _self;
  final $Res Function(_EventFeedScreenState) _then;

/// Create a copy of EventFeedScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? lastId = freezed,}) {
  return _then(_EventFeedScreenState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<EventModel>,page: null == page ? _self._page : page // ignore: cast_nullable_to_non_nullable
as List<EventModel>,lastId: freezed == lastId ? _self.lastId : lastId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
