import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/extensions/num_extension.dart';
import 'package:restaurant_orders/core/resources/custom_input_field_value_accessors.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

import 'confirmation_alert_dialog.dart';

class Counter extends HookConsumerWidget {
  final Color? buttonColor;
  final String updateTitle;
  final TextStyle? countStyle;
  final EdgeInsets countPadding;
  final void Function(num value)? onChanged;
  final num min;
  final num initial;
  final num? max;
  final bool includeFraction;
  final bool disabled;

  final ValueNotifier<num> _control = ValueNotifier(0);

  Counter({
    Key? key,
    this.min = 0,
    this.max,
    this.updateTitle = 'Update Value',
    this.disabled = false,
    this.includeFraction = false,
    this.onChanged,
    this.buttonColor,
    this.countStyle,
    num? initial,
    this.countPadding = const EdgeInsets.all(SpacingConstants.kS8),
  })  : initial = math.max(initial ?? min, min),
        super(key: key);

  FormControl<num> _getControl() {
    return includeFraction
        ? FormControl<double>(
            value: _control.value.toDouble(),
            disabled: disabled,
            validators: [
                Validators.required,
                Validators.min(min),
                if (max != null) Validators.max(max),
              ])
        : FormControl<int>(
            value: _control.value.toInt(),
            disabled: disabled,
            validators: [
                Validators.required,
                Validators.min(min),
                if (max != null) Validators.max(max),
              ]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (_control.value != initial) {
      _control.value = includeFraction ? initial.toDouble() : initial.toInt();
    }
    return Row(
      children: [
        _buildButton(
          disabled ? null : () => _onDecrement(),
          Icons.remove,
        ),
        Flexible(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SpacingConstants.kS4),
            child:
                // Text(_counterControl.value?.toString() ?? ''),
                _buildCounterField(context),
          ),
        ),
        _buildButton(
          disabled ? null : () => _onIncrement(),
          Icons.add,
        )
      ],
    );
  }

  Widget _buildCounterField(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : () => _showUpdateDialog(context),
      child: InputDecorator(
        decoration: const InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(SpacingConstants.kS4)),
        child: ValueListenableBuilder<num>(
          valueListenable: _control,
          builder: (context, value, _) {
            return Text(
              value.neglectFractionZero(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: _control.value == 0
                    ? StylesConstants.kSubTitleSize - 2
                    : StylesConstants.kSubTitleSize,
                fontWeight: _control.value == 0
                    ? StylesConstants.kCaptionWeight
                    : StylesConstants.kSubTitleWeight,
              ),
              maxLines: null,
            );
          },
        ),
      ),
    );
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          final formControl = _getControl();
          return Center(
            child: SingleChildScrollView(
              child: ConfirmationAlertDialog(
                isDanger: false,
                title: updateTitle.toUpperCase(),
                content: ReactiveTextField<num>(
                  valueAccessor: includeFraction
                      ? DoubleNeglectFractionZeroValueAccessor()
                      : null,
                  validationMessages: {
                    ValidationMessage.required: (_) =>
                        '${ValidationMessage.required} ${includeFraction ? '' : 'decimal'} number',
                    ValidationMessage.min: (_) =>
                        '${ValidationMessage.min}: $min',
                    ValidationMessage.max: (_) =>
                        '${ValidationMessage.max}: $max',
                  },
                  maxLines: null,
                  toolbarOptions: const ToolbarOptions(
                    copy: true,
                    paste: true,
                    cut: true,
                    selectAll: true,
                  ),
                  decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(SpacingConstants.kS16),
                      errorMaxLines: 5,
                      errorStyle: TextStyle(
                        color: ColorConstants.kErrorRed,
                      )),
                  formControl: formControl,
                  style: countStyle,
                  keyboardType: TextInputType.number,
                ),
                onContinue: () async {
                  if (formControl.valid) {
                    _control.value = formControl.value!;
                    onChanged?.call(formControl.value!);
                    return true;
                  } else {
                    formControl.markAsTouched();
                    return false;
                  }
                },
              ),
            ),
          );
        });
  }

  void _onIncrement() {
    final num oldValue = _control.value;
    if (oldValue != max) {
      var newValue = max == null ? oldValue + 1 : math.min(oldValue + 1, max!);
      _control.value = includeFraction ? newValue.toDouble() : newValue.toInt();
      onChanged?.call(_control.value);
    }
  }

//0.5->0 reads afterwards
  void _onDecrement() {
    final num oldValue = _control.value;
    if (oldValue != min) {
      var newValue = math.max(oldValue - 1, min);
      _control.value = includeFraction ? newValue.toDouble() : newValue.toInt();
      onChanged?.call(_control.value);
    }
  }

  Widget _buildButton(VoidCallback? onPressed, IconData icon) {
    return GestureDetector(
      onTap: onPressed,
      // splashRadius: countStyle?.fontSize,
      child: Icon(
        color: ColorConstants.kBlack.withOpacity(disabled ? 0.2 : 1),
        icon,
      ),
    );
  }
}
