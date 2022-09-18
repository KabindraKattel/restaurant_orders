// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_orders/core/extensions/num_extension.dart';

void main() {
  test('Num', () async {
    print("TEST_ME " + await 1.50.neglectFractionZero());
  });
}
