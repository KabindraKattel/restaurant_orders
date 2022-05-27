import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

class ChipInputTextField extends StatefulWidget {
  ///Updates initial Value to Cart TableId
  final String? initialValue;
  final List<ValidatorFunction> validators;
  final List<AsyncValidatorFunction> asyncValidators;
  final int asyncValidatorsDebounceTime;
  final bool touched;
  final bool disabled;
  final ValueChanged<String>? onChanged;

  const ChipInputTextField({
    Key? key,
    this.initialValue,
    this.validators = const [],
    this.asyncValidators = const [],
    this.asyncValidatorsDebounceTime = 250,
    this.touched = false,
    this.disabled = false,
    this.onChanged,
  }) : super(key: key);

  @override
  State<ChipInputTextField> createState() => _ChipInputTextFieldState();
}

class _ChipInputTextFieldState extends State<ChipInputTextField> {
  late final FormControl<String> _inputTableControl;

  @override
  void initState() {
    super.initState();
    _inputTableControl = FormControl<String>(
      validators: widget.validators,
      value: widget.initialValue,
      asyncValidators: widget.asyncValidators,
      asyncValidatorsDebounceTime: widget.asyncValidatorsDebounceTime,
      touched: widget.touched,
      disabled: widget.disabled,
    );

    if ((_inputTableControl.value)?.trim().isNotEmpty ?? false) {
      widget.onChanged?.call(_inputTableControl.value!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<String, String>(
        formControl: _inputTableControl,
        builder: (ReactiveFormFieldState<String, String> field) {
          final isDisabled = field.control.disabled;
          return InputDecorator(
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(SpacingConstants.kS0),
              enabled: !isDisabled,
              errorText: field.errorText,
              errorStyle: const TextStyle(
                color: ColorConstants.kErrorRed,
                height: 0.2,
              ),
              errorMaxLines: 5,
            ),
            child: Chip(
              shape: StadiumBorder(
                  side: BorderSide(
                      color: field.control.hasErrors
                          ? ColorConstants.kErrorRed
                          : ColorConstants.kTransparent)),
              backgroundColor: ColorConstants.kWhite,
              label: ReactiveTextField<String>(
                formControl: _inputTableControl,
                showErrors: (_) => false,
                onSubmitted: () {
                  if ((_inputTableControl.value)?.trim().isNotEmpty ?? false) {
                    widget.onChanged?.call(_inputTableControl.value!);
                  }
                },
                decoration: const InputDecoration(
                  hintText: StringConstants.kEnterTable,
                  isDense: true,
                  errorText: null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(SpacingConstants.kS4),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConstants.kWhite.getForegroundColor(),
                  fontSize: StylesConstants.kTitleSize,
                  fontWeight: StylesConstants.kTitleWeight,
                ),
              ),
            ),
          );
        });
  }
}
