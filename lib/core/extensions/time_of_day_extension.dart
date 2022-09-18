import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/model/time.dart';

extension TimeOfDayX on TimeOfDay {
  ///converts [TimeOfDay] HOUR - 14 MINUTES - 0 to 02:00 PM for [hr_12] true else 14:00
  String toFormattedString({bool hr_12 = true}) {
    if (hr_12) {
      int hr_12 = hour % 12;
      return '${_addLeadingZeroIfNeeded(hr_12 == 0 ? 12 : hr_12)}:${_addLeadingZeroIfNeeded(minute)} ${(hour >= 12 && hour < 24) ? 'PM' : 'AM'}';
    }
    return '${_addLeadingZeroIfNeeded(hour)}:${_addLeadingZeroIfNeeded(minute)}';
  }

  String _addLeadingZeroIfNeeded(int value) =>
      (value < 10) ? '0$value' : value.toString();

  Time toTime() => Time(hour: hour, minute: minute, second: 0);
}
