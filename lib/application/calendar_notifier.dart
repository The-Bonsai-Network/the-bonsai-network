import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:bonsai_network/domain/calendar/week_data.dart';

@injectable
class CalendarNotifier extends ChangeNotifier {
  WeekData? _weekData;

  DateTime? rangeStart;
  DateTime? rangeEnd;

  CalendarNotifier() : super();

  WeekData? get weekData => _weekData;

  void updateWeekData(WeekData? weekData) {
    _weekData = weekData;
    notifyListeners();
  }

  int? weekOfYear(DateTime? date) {
    if (date == null) return null;

    final startOfYear = DateTime(date.year, 1, 1, 0, 0);
    final firstMonday = startOfYear.weekday;
    final daysInFirstWeek = 8 - firstMonday;
    final diff = date.difference(startOfYear);
    return ((diff.inDays - daysInFirstWeek) / 7).ceil();
  }
}
