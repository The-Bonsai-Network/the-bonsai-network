// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Week _$$_WeekFromJson(Map<String, dynamic> json) => _$_Week(
      weekNr: json['weekNr'] as int?,
      weekItems: (json['weekItems'] as List<dynamic>?)
          ?.map((e) => WeekItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      weekStartDate: json['weekStartDate'] as int?,
      weekEndDate: json['weekEndDate'] as int?,
    );

Map<String, dynamic> _$$_WeekToJson(_$_Week instance) => <String, dynamic>{
      'weekNr': instance.weekNr,
      'weekItems': instance.weekItems,
      'weekStartDate': instance.weekStartDate,
      'weekEndDate': instance.weekEndDate,
    };
