import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/extensions/num_extension.dart';

class DoubleNeglectFractionZeroValueAccessor extends DoubleValueAccessor {
  DoubleNeglectFractionZeroValueAccessor({
    super.fractionDigits,
  });

  @override
  String modelToViewValue(double? modelValue) {
    return modelValue == null ? '' : modelValue.neglectFractionZero();
  }
}
