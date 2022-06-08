// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'week.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Week _$WeekFromJson(Map<String, dynamic> json) {
  return _Week.fromJson(json);
}

/// @nodoc
mixin _$Week {
  int? get weekNr => throw _privateConstructorUsedError;
  List<WeekItem>? get weekItems => throw _privateConstructorUsedError;
  int? get weekStartDate => throw _privateConstructorUsedError;
  int? get weekEndDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeekCopyWith<Week> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekCopyWith<$Res> {
  factory $WeekCopyWith(Week value, $Res Function(Week) then) =
      _$WeekCopyWithImpl<$Res>;
  $Res call(
      {int? weekNr,
      List<WeekItem>? weekItems,
      int? weekStartDate,
      int? weekEndDate});
}

/// @nodoc
class _$WeekCopyWithImpl<$Res> implements $WeekCopyWith<$Res> {
  _$WeekCopyWithImpl(this._value, this._then);

  final Week _value;
  // ignore: unused_field
  final $Res Function(Week) _then;

  @override
  $Res call({
    Object? weekNr = freezed,
    Object? weekItems = freezed,
    Object? weekStartDate = freezed,
    Object? weekEndDate = freezed,
  }) {
    return _then(_value.copyWith(
      weekNr: weekNr == freezed
          ? _value.weekNr
          : weekNr // ignore: cast_nullable_to_non_nullable
              as int?,
      weekItems: weekItems == freezed
          ? _value.weekItems
          : weekItems // ignore: cast_nullable_to_non_nullable
              as List<WeekItem>?,
      weekStartDate: weekStartDate == freezed
          ? _value.weekStartDate
          : weekStartDate // ignore: cast_nullable_to_non_nullable
              as int?,
      weekEndDate: weekEndDate == freezed
          ? _value.weekEndDate
          : weekEndDate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_WeekCopyWith<$Res> implements $WeekCopyWith<$Res> {
  factory _$$_WeekCopyWith(_$_Week value, $Res Function(_$_Week) then) =
      __$$_WeekCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? weekNr,
      List<WeekItem>? weekItems,
      int? weekStartDate,
      int? weekEndDate});
}

/// @nodoc
class __$$_WeekCopyWithImpl<$Res> extends _$WeekCopyWithImpl<$Res>
    implements _$$_WeekCopyWith<$Res> {
  __$$_WeekCopyWithImpl(_$_Week _value, $Res Function(_$_Week) _then)
      : super(_value, (v) => _then(v as _$_Week));

  @override
  _$_Week get _value => super._value as _$_Week;

  @override
  $Res call({
    Object? weekNr = freezed,
    Object? weekItems = freezed,
    Object? weekStartDate = freezed,
    Object? weekEndDate = freezed,
  }) {
    return _then(_$_Week(
      weekNr: weekNr == freezed
          ? _value.weekNr
          : weekNr // ignore: cast_nullable_to_non_nullable
              as int?,
      weekItems: weekItems == freezed
          ? _value._weekItems
          : weekItems // ignore: cast_nullable_to_non_nullable
              as List<WeekItem>?,
      weekStartDate: weekStartDate == freezed
          ? _value.weekStartDate
          : weekStartDate // ignore: cast_nullable_to_non_nullable
              as int?,
      weekEndDate: weekEndDate == freezed
          ? _value.weekEndDate
          : weekEndDate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Week implements _Week {
  const _$_Week(
      {this.weekNr,
      final List<WeekItem>? weekItems,
      this.weekStartDate,
      this.weekEndDate})
      : _weekItems = weekItems;

  factory _$_Week.fromJson(Map<String, dynamic> json) => _$$_WeekFromJson(json);

  @override
  final int? weekNr;
  final List<WeekItem>? _weekItems;
  @override
  List<WeekItem>? get weekItems {
    final value = _weekItems;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? weekStartDate;
  @override
  final int? weekEndDate;

  @override
  String toString() {
    return 'Week(weekNr: $weekNr, weekItems: $weekItems, weekStartDate: $weekStartDate, weekEndDate: $weekEndDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Week &&
            const DeepCollectionEquality().equals(other.weekNr, weekNr) &&
            const DeepCollectionEquality()
                .equals(other._weekItems, _weekItems) &&
            const DeepCollectionEquality()
                .equals(other.weekStartDate, weekStartDate) &&
            const DeepCollectionEquality()
                .equals(other.weekEndDate, weekEndDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(weekNr),
      const DeepCollectionEquality().hash(_weekItems),
      const DeepCollectionEquality().hash(weekStartDate),
      const DeepCollectionEquality().hash(weekEndDate));

  @JsonKey(ignore: true)
  @override
  _$$_WeekCopyWith<_$_Week> get copyWith =>
      __$$_WeekCopyWithImpl<_$_Week>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeekToJson(this);
  }
}

abstract class _Week implements Week {
  const factory _Week(
      {final int? weekNr,
      final List<WeekItem>? weekItems,
      final int? weekStartDate,
      final int? weekEndDate}) = _$_Week;

  factory _Week.fromJson(Map<String, dynamic> json) = _$_Week.fromJson;

  @override
  int? get weekNr => throw _privateConstructorUsedError;
  @override
  List<WeekItem>? get weekItems => throw _privateConstructorUsedError;
  @override
  int? get weekStartDate => throw _privateConstructorUsedError;
  @override
  int? get weekEndDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WeekCopyWith<_$_Week> get copyWith => throw _privateConstructorUsedError;
}
