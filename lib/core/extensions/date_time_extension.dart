import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String format(String formatPattern) => DateFormat(formatPattern).format(this);
}
