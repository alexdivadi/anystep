// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteer_hours_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VolunteerHoursReport {

 UserModel get user;/// Total hours in the range after applying per-event/day cap.
 double get totalHours;/// Count of distinct events (user events) included.
 int get eventsCount;/// Hours bucketed by year-month (e.g. '2025-10' -> 12.5)
 Map<String, double> get hoursPerMonth;
/// Create a copy of VolunteerHoursReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VolunteerHoursReportCopyWith<VolunteerHoursReport> get copyWith => _$VolunteerHoursReportCopyWithImpl<VolunteerHoursReport>(this as VolunteerHoursReport, _$identity);

  /// Serializes this VolunteerHoursReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VolunteerHoursReport&&(identical(other.user, user) || other.user == user)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.eventsCount, eventsCount) || other.eventsCount == eventsCount)&&const DeepCollectionEquality().equals(other.hoursPerMonth, hoursPerMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,totalHours,eventsCount,const DeepCollectionEquality().hash(hoursPerMonth));

@override
String toString() {
  return 'VolunteerHoursReport(user: $user, totalHours: $totalHours, eventsCount: $eventsCount, hoursPerMonth: $hoursPerMonth)';
}


}

/// @nodoc
abstract mixin class $VolunteerHoursReportCopyWith<$Res>  {
  factory $VolunteerHoursReportCopyWith(VolunteerHoursReport value, $Res Function(VolunteerHoursReport) _then) = _$VolunteerHoursReportCopyWithImpl;
@useResult
$Res call({
 UserModel user, double totalHours, int eventsCount, Map<String, double> hoursPerMonth
});


$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$VolunteerHoursReportCopyWithImpl<$Res>
    implements $VolunteerHoursReportCopyWith<$Res> {
  _$VolunteerHoursReportCopyWithImpl(this._self, this._then);

  final VolunteerHoursReport _self;
  final $Res Function(VolunteerHoursReport) _then;

/// Create a copy of VolunteerHoursReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? totalHours = null,Object? eventsCount = null,Object? hoursPerMonth = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,totalHours: null == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as double,eventsCount: null == eventsCount ? _self.eventsCount : eventsCount // ignore: cast_nullable_to_non_nullable
as int,hoursPerMonth: null == hoursPerMonth ? _self.hoursPerMonth : hoursPerMonth // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}
/// Create a copy of VolunteerHoursReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [VolunteerHoursReport].
extension VolunteerHoursReportPatterns on VolunteerHoursReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VolunteerHoursReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VolunteerHoursReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VolunteerHoursReport value)  $default,){
final _that = this;
switch (_that) {
case _VolunteerHoursReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VolunteerHoursReport value)?  $default,){
final _that = this;
switch (_that) {
case _VolunteerHoursReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserModel user,  double totalHours,  int eventsCount,  Map<String, double> hoursPerMonth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VolunteerHoursReport() when $default != null:
return $default(_that.user,_that.totalHours,_that.eventsCount,_that.hoursPerMonth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserModel user,  double totalHours,  int eventsCount,  Map<String, double> hoursPerMonth)  $default,) {final _that = this;
switch (_that) {
case _VolunteerHoursReport():
return $default(_that.user,_that.totalHours,_that.eventsCount,_that.hoursPerMonth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserModel user,  double totalHours,  int eventsCount,  Map<String, double> hoursPerMonth)?  $default,) {final _that = this;
switch (_that) {
case _VolunteerHoursReport() when $default != null:
return $default(_that.user,_that.totalHours,_that.eventsCount,_that.hoursPerMonth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VolunteerHoursReport implements VolunteerHoursReport {
  const _VolunteerHoursReport({required this.user, required this.totalHours, required this.eventsCount, required final  Map<String, double> hoursPerMonth}): _hoursPerMonth = hoursPerMonth;
  factory _VolunteerHoursReport.fromJson(Map<String, dynamic> json) => _$VolunteerHoursReportFromJson(json);

@override final  UserModel user;
/// Total hours in the range after applying per-event/day cap.
@override final  double totalHours;
/// Count of distinct events (user events) included.
@override final  int eventsCount;
/// Hours bucketed by year-month (e.g. '2025-10' -> 12.5)
 final  Map<String, double> _hoursPerMonth;
/// Hours bucketed by year-month (e.g. '2025-10' -> 12.5)
@override Map<String, double> get hoursPerMonth {
  if (_hoursPerMonth is EqualUnmodifiableMapView) return _hoursPerMonth;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_hoursPerMonth);
}


/// Create a copy of VolunteerHoursReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VolunteerHoursReportCopyWith<_VolunteerHoursReport> get copyWith => __$VolunteerHoursReportCopyWithImpl<_VolunteerHoursReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VolunteerHoursReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VolunteerHoursReport&&(identical(other.user, user) || other.user == user)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.eventsCount, eventsCount) || other.eventsCount == eventsCount)&&const DeepCollectionEquality().equals(other._hoursPerMonth, _hoursPerMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,totalHours,eventsCount,const DeepCollectionEquality().hash(_hoursPerMonth));

@override
String toString() {
  return 'VolunteerHoursReport(user: $user, totalHours: $totalHours, eventsCount: $eventsCount, hoursPerMonth: $hoursPerMonth)';
}


}

/// @nodoc
abstract mixin class _$VolunteerHoursReportCopyWith<$Res> implements $VolunteerHoursReportCopyWith<$Res> {
  factory _$VolunteerHoursReportCopyWith(_VolunteerHoursReport value, $Res Function(_VolunteerHoursReport) _then) = __$VolunteerHoursReportCopyWithImpl;
@override @useResult
$Res call({
 UserModel user, double totalHours, int eventsCount, Map<String, double> hoursPerMonth
});


@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$VolunteerHoursReportCopyWithImpl<$Res>
    implements _$VolunteerHoursReportCopyWith<$Res> {
  __$VolunteerHoursReportCopyWithImpl(this._self, this._then);

  final _VolunteerHoursReport _self;
  final $Res Function(_VolunteerHoursReport) _then;

/// Create a copy of VolunteerHoursReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? totalHours = null,Object? eventsCount = null,Object? hoursPerMonth = null,}) {
  return _then(_VolunteerHoursReport(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,totalHours: null == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as double,eventsCount: null == eventsCount ? _self.eventsCount : eventsCount // ignore: cast_nullable_to_non_nullable
as int,hoursPerMonth: null == hoursPerMonth ? _self._hoursPerMonth : hoursPerMonth // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

/// Create a copy of VolunteerHoursReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
