import 'dart:convert';

extension MapX on Map {
  String prettify() {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(this);
  }
}
