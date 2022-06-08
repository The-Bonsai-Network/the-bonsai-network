import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_item.freezed.dart';

part 'week_item.g.dart';

@freezed
class WeekItem with _$WeekItem {
  const factory WeekItem({
    String? dayName,
    int? dayOfWeek,
  }) = _WeekItem;

  factory WeekItem.fromJson(Map<String, Object?> json) =>
      _$WeekItemFromJson(json);
}
