import 'package:bonsai_network/domain/calendar/week.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_data.freezed.dart';

part 'week_data.g.dart';

@freezed
class WeekData with _$WeekData {
  const factory WeekData({
    Week? data,
  }) = _WeekData;

  factory WeekData.fromJson(Map<String, Object?> json) =>
      _$WeekDataFromJson(json);
}
