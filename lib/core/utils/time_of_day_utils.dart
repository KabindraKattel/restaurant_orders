import 'package:flutter/material.dart';

class TimeOfDayUtils {
  ///Can be [DateTime.tryParse] compatible
  ///Can be in 12hr or 24 hr format without year month date entry
  ///Example:
  ///1999-01-02 13:00 or
  /// 13:00 or
  /// 1:00 pm (non-case-sensitive) or
  /// 1:00pm (non-case-sensitive)
  static TimeOfDay? tryParse(String formattedString) {
    var dateTime = DateTime.tryParse(formattedString);
    if (dateTime != null) {
      return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
    } else if (formattedString.contains(RegExp(
        "^(?:0?[0-9]|1[0-2]):[0-5][0-9][ ]{0,}[ap]m",
        multiLine: false,
        caseSensitive: false))) {
      formattedString = formattedString
          .replaceFirst(RegExp('am', caseSensitive: false), ':AM')
          .replaceFirst(RegExp('pm', caseSensitive: false), ':PM');
      final parts = formattedString.split(':');
      if (parts.length != 3) {
        return null;
      }
      final int? hr = int.tryParse(parts[0].trim());
      final int? min = int.tryParse(parts[1].trim());
      final String timeHalf = parts[2].trim();
      if (hr == null || min == null || (timeHalf != 'AM' && timeHalf != 'PM')) {
        return null;
      }
      int offsetHr = 0;
      if (timeHalf == 'PM') {
        offsetHr = hr == 12 ? 0 : hr;
      } else if (timeHalf == 'AM') {
        offsetHr = hr == 12 ? hr : 0;
      }
      return TimeOfDay(
        hour: hr + offsetHr,
        minute: min,
      );
    } else if (formattedString
        .contains(RegExp('^(?:[01][0-9]|2[0-3]):[0-5][0-9]'))) {
      final parts = formattedString.split(':');
      if (parts.length != 2) {
        return null;
      }
      final int? hr = int.tryParse(parts[0].trim());
      final int? min = int.tryParse(parts[1].trim());
      if (hr == null || min == null) {
        return null;
      }
      return TimeOfDay(
        hour: hr,
        minute: min,
      );
    }
    return null;
  }

  ///converts [TimeOfDay] HOUR - 14 MINUTES - 0 to 02:00 PM for [hr_12] true else 14:00
  static String jm(TimeOfDay model, {bool hr_12 = true}) {
    if (hr_12) {
      int hr_12 = model.hour % 12;
      return '${_addLeadingZeroIfNeeded(hr_12 == 0 ? 12 : hr_12)}:${_addLeadingZeroIfNeeded(model.minute)} ${(model.hour >= 12 && model.hour < 24) ? 'PM' : 'AM'}';
    }
    return '${_addLeadingZeroIfNeeded(model.hour)}:${_addLeadingZeroIfNeeded(model.minute)}';
  }

  static String _addLeadingZeroIfNeeded(int value) =>
      (value < 10) ? '0$value' : value.toString();
}
