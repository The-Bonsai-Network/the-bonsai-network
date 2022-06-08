// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'week_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeekItem _$WeekItemFromJson(Map<String, dynamic> json) {
  return _WeekItem.fromJson(json);
}

/// @nodoc
mixin _$WeekItem {
  String? get dayName => throw _privateConstructorUsedError;
  int? get dayOfWeek => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeekItemCopyWith<WeekItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekItemCopyWith<$Res> {
  factory $WeekItemCopyWith(WeekItem value, $Res Function(WeekItem) then) =
      _$WeekItemCopyWithImpl<$Res>;
  $Res call({String? dayName, int? dayOfWeek});
}

/// @nodoc
class _$WeekItemCopyWithImpl<$Res> implements $WeekItemCopyWith<$Res> {
  _$WeekItemCopyWithImpl(this._value, this._then);

  final WeekItem _value;
  // ignore: unused_field
  final $Res Function(WeekItem) _then;

  @override
  $Res call({
    Object? dayName = freezed,
    Object? dayOfWeek = freezed,
  }) {
    return _then(_value.copyWith(
      dayName: dayName == freezed
          ? _value.dayName
          : dayName // ignore: cast_nullable_to_non_nullable
              as String?,
      dayOfWeek: dayOfWeek == freezed
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_WeekItemCopyWith<$Res> implements $WeekItemCopyWith<$Res> {
  factory _$$_WeekItemCopyWith(
          _$_WeekItem value, $Res Function(_$_WeekItem) then) =
      __$$_WeekItemCopyWithImpl<$Res>;
  @override
  $Res call({String? dayName, int? dayOfWeek});
}

/// @nodoc
class __$$_WeekItemCopyWithImpl<$Res> extends _$WeekItemCopyWithImpl<$Res>
    implements _$$_WeekItemCopyWith<$Res> {
  __$$_WeekItemCopyWithImpl(
      _$_WeekItem _value, $Res Function(_$_WeekItem) _then)
      : super(_value, (v) => _then(v as _$_WeekItem));

  @override
  _$_WeekItem get _value => super._value as _$_WeekItem;

  @override
  $Res call({
    Object? dayName = freezed,
    Object? dayOfWeek = freezed,
  }) {
    return _then(_$_WeekItem(
      dayName: dayName == freezed
          ? _value.dayName
          : dayName // ignore: cast_nullable_to_non_nullable
              as String?,
      dayOfWeek: dayOfWeek == freezed
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeekItem implements _WeekItem {
  const _$_WeekItem({this.dayName, this.dayOfWeek});

  factory _$_WeekItem.fromJson(Map<String, dynamic> json) =>
      _$$_WeekItemFromJson(json);

  @override
  final String? dayName;
  @override
  final int? dayOfWeek;

  @override
  String toString() {
    return 'WeekItem(dayName: $dayName, dayOfWeek: $dayOfWeek)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeekItem &&
            const DeepCollectionEquality().equals(other.dayName, dayName) &&
            const DeepCollectionEquality().equals(other.dayOfWeek, dayOfWeek));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dayName),
      const DeepCollectionEquality().hash(dayOfWeek));

  @JsonKey(ignore: true)
  @override
  _$$_WeekItemCopyWith<_$_WeekItem> get copyWith =>
      __$$_WeekItemCopyWithImpl<_$_WeekItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeekItemToJson(this);
  }
}

abstract class _WeekItem implements WeekItem {
  const factory _WeekItem({final String? dayName, final int? dayOfWeek}) =
      _$_WeekItem;

  factory _WeekItem.fromJson(Map<String, dynamic> json) = _$_WeekItem.fromJson;

  @override
  String? get dayName => throw _privateConstructorUsedError;
  @override
  int? get dayOfWeek => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WeekItemCopyWith<_$_WeekItem> get copyWith =>
      throw _privateConstructorUsedError;
}
