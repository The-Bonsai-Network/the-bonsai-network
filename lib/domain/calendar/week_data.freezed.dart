// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'week_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeekData _$WeekDataFromJson(Map<String, dynamic> json) {
  return _WeekData.fromJson(json);
}

/// @nodoc
mixin _$WeekData {
  Week? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeekDataCopyWith<WeekData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekDataCopyWith<$Res> {
  factory $WeekDataCopyWith(WeekData value, $Res Function(WeekData) then) =
      _$WeekDataCopyWithImpl<$Res>;
  $Res call({Week? data});

  $WeekCopyWith<$Res>? get data;
}

/// @nodoc
class _$WeekDataCopyWithImpl<$Res> implements $WeekDataCopyWith<$Res> {
  _$WeekDataCopyWithImpl(this._value, this._then);

  final WeekData _value;
  // ignore: unused_field
  final $Res Function(WeekData) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Week?,
    ));
  }

  @override
  $WeekCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $WeekCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$$_WeekDataCopyWith<$Res> implements $WeekDataCopyWith<$Res> {
  factory _$$_WeekDataCopyWith(
          _$_WeekData value, $Res Function(_$_WeekData) then) =
      __$$_WeekDataCopyWithImpl<$Res>;
  @override
  $Res call({Week? data});

  @override
  $WeekCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_WeekDataCopyWithImpl<$Res> extends _$WeekDataCopyWithImpl<$Res>
    implements _$$_WeekDataCopyWith<$Res> {
  __$$_WeekDataCopyWithImpl(
      _$_WeekData _value, $Res Function(_$_WeekData) _then)
      : super(_value, (v) => _then(v as _$_WeekData));

  @override
  _$_WeekData get _value => super._value as _$_WeekData;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_WeekData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Week?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeekData implements _WeekData {
  const _$_WeekData({this.data});

  factory _$_WeekData.fromJson(Map<String, dynamic> json) =>
      _$$_WeekDataFromJson(json);

  @override
  final Week? data;

  @override
  String toString() {
    return 'WeekData(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeekData &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_WeekDataCopyWith<_$_WeekData> get copyWith =>
      __$$_WeekDataCopyWithImpl<_$_WeekData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeekDataToJson(this);
  }
}

abstract class _WeekData implements WeekData {
  const factory _WeekData({final Week? data}) = _$_WeekData;

  factory _WeekData.fromJson(Map<String, dynamic> json) = _$_WeekData.fromJson;

  @override
  Week? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WeekDataCopyWith<_$_WeekData> get copyWith =>
      throw _privateConstructorUsedError;
}
