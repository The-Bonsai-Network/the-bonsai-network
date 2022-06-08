import 'package:bonsai_network/domain/calendar/week_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'week.freezed.dart';

part 'week.g.dart';

@freezed
class Week with _$Week {
  const factory Week({
    int? weekNr,
    List<WeekItem>? weekItems,
    int? weekStartDate,
    int? weekEndDate,
  }) = _Week;

  factory Week.fromJson(Map<String, Object?> json) => _$WeekFromJson(json);
}
