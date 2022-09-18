import 'package:restaurant_orders/core/utils/time_of_day_utils.dart';

class Time {
  final int hour;
  final int minute;
  final int second;

  const Time({required int hour, required int minute, required int second})
      : second = second % 60,
        minute = minute % 60 + second ~/ 60,
        hour = hour + minute ~/ 60;

  ///In HH:MM:SS or HH:MM:SS AM
  static Time? tryParse(String formattedString) {
    var dateTime = DateTime.tryParse(formattedString);
    var timeOfDay = TimeOfDayUtils.tryParse(formattedString);
    if (dateTime != null) {
      return Time(
          hour: dateTime.hour,
          minute: dateTime.minute,
          second: dateTime.second);
    } else if (timeOfDay != null) {
      return Time(hour: timeOfDay.hour, minute: timeOfDay.minute, second: 0);
    } else if (formattedString.contains(RegExp(
        "^(?:0?[0-9]|1[0-2]):[0-5][0-9]:[0-5][0-9][ ]{0,}[ap]m",
        multiLine: false,
        caseSensitive: false))) {
      formattedString = formattedString
          .replaceFirst(RegExp('am', caseSensitive: false), ':AM')
          .replaceFirst(RegExp('pm', caseSensitive: false), ':PM');
      final parts = formattedString.split(':');
      if (parts.length != 4) {
        return null;
      }
      final int? hr = int.tryParse(parts[0].trim());
      final int? min = int.tryParse(parts[1].trim());
      final int? second = int.tryParse(parts[2].trim());
      final String timeHalf = parts[3].trim();
      if (hr == null ||
          min == null ||
          second == null ||
          (timeHalf != 'AM' && timeHalf != 'PM')) {
        return null;
      }
      int offsetHr = 0;
      if (timeHalf == 'PM') {
        offsetHr = hr == 12 ? 0 : hr;
      } else if (timeHalf == 'AM') {
        offsetHr = hr == 12 ? hr : 0;
      }
      return Time(
        hour: hr + offsetHr,
        minute: min,
        second: second,
      );
    } else if (formattedString
        .contains(RegExp('^(?:[01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]'))) {
      final parts = formattedString.split(':');
      if (parts.length != 3) {
        return null;
      }
      final int? hr = int.tryParse(parts[0].trim());
      final int? min = int.tryParse(parts[1].trim());
      final int? second = int.tryParse(parts[2].trim());
      if (hr == null || min == null || second == null) {
        return null;
      }
      return Time(
        hour: hr,
        minute: min,
        second: second,
      );
    }
    return null;
  }

  String toFormattedString({bool hr_12 = true}) {
    if (hr_12) {
      int hr_12 = hour % 12;
      return '${_addLeadingZeroIfNeeded(hr_12 == 0 ? 12 : hr_12)}:${_addLeadingZeroIfNeeded(minute)}:${_addLeadingZeroIfNeeded(second)} ${(hour >= 12 && hour < 24) ? 'PM' : 'AM'}';
    }
    return '${_addLeadingZeroIfNeeded(hour)}:${_addLeadingZeroIfNeeded(minute)}:${_addLeadingZeroIfNeeded(second)}';
  }

  String _addLeadingZeroIfNeeded(int value) =>
      (value < 10) ? '0$value' : value.toString();
}
