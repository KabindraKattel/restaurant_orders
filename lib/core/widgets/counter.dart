import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

class Counter extends StatefulWidget {
  final Color? buttonColor;
  final TextStyle? countStyle;
  final EdgeInsets countPadding;
  final void Function(FormControl<num> formControl)? onChanged;
  final void Function(FormControl<num> formControl)? onStatusChanged;
  final num min;
  final num initial;
  final num? max;
  final bool includeFraction;
  final bool disabled;

  Counter(
      {Key? key,
      this.min = 0,
      this.max,
      this.disabled = false,
      this.includeFraction = false,
      this.onChanged,
      this.buttonColor,
      this.countStyle,
      num? initial,
      this.countPadding = const EdgeInsets.all(SpacingConstants.kS8),
      this.onStatusChanged})
      : initial = math.max(initial ?? min, min),
        super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late final FormControl<num> _counterControl;

  @override
  void didUpdateWidget(covariant Counter oldWidget) {
    if (widget.initial != _counterControl.value) {
      _counterControl.value = widget.includeFraction
          ? widget.initial.toDouble()
          : widget.initial.toInt();
    }
    if (widget.disabled != oldWidget.disabled) {
      widget.disabled
          ? _counterControl.markAsDisabled()
          : _counterControl.markAsEnabled();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    _counterControl = widget.includeFraction
        ? FormControl<double>(
            value: widget.initial.toDouble(),
            disabled: widget.disabled,
            validators: [
                Validators.required,
                Validators.min(widget.min),
                if (widget.max != null) Validators.max(widget.max),
              ])
        : FormControl<int>(
            value: widget.initial.toInt(),
            disabled: widget.disabled,
            validators: [
                Validators.required,
                Validators.min(widget.min),
                if (widget.max != null) Validators.max(widget.max),
              ]);
    _counterControl.valueChanges.listen(
      (value) {
        if (!_counterControl.invalid) {
          widget.onChanged?.call(_counterControl);
        }
      },
      cancelOnError: true,
    );
    _counterControl.statusChanged.listen(
      (status) {
        widget.onStatusChanged?.call(_counterControl);
      },
      cancelOnError: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildButton(
          widget.disabled ? null : _onDecrement,
          Icons.remove,
        ),
        Flexible(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SpacingConstants.kS4),
            child: _buildCounterField(),
          ),
        ),
        _buildButton(
          widget.disabled ? null : _onIncrement,
          Icons.add,
        )
      ],
    );
  }

  ReactiveTextField<num> _buildCounterField() {
    return ReactiveTextField<num>(
      textAlign: TextAlign.center,
      validationMessages: (_) {
        return {
          ValidationMessage.required:
              '${ValidationMessage.required} ${widget.includeFraction ? '' : 'decimal'} number',
          ValidationMessage.min: '${ValidationMessage.min}: ${widget.min}',
          ValidationMessage.max: '${ValidationMessage.max}: ${widget.max}',
        };
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
          contentPadding: EdgeInsets.all(SpacingConstants.kS4),
          errorMaxLines: 5,
          errorStyle: TextStyle(
            color: ColorConstants.kErrorRed,
          )),
      formControl: _counterControl,
      style: widget.countStyle,
      keyboardType: TextInputType.number,
    );
  }

  void _onIncrement() {
    final num? oldValue = _counterControl.value;
    if (oldValue != null && oldValue != widget.max) {
      var newValue = widget.max == null
          ? oldValue + 1
          : math.min(oldValue + 1, widget.max!);
      _counterControl.value =
          widget.includeFraction ? newValue : newValue.toInt();
    }
  }

  void _onDecrement() {
    final num? oldValue = _counterControl.value;
    if (oldValue != null && oldValue != widget.min) {
      var newValue = math.max(oldValue - 1, widget.min);
      _counterControl.value =
          widget.includeFraction ? newValue : newValue.toInt();
    }
  }

  Widget _buildButton(VoidCallback? onPressed, IconData icon) {
    return GestureDetector(
      onTap: onPressed,
      // splashRadius: widget.countStyle?.fontSize,
      child: Icon(
        color: ColorConstants.kBlack.withOpacity(widget.disabled ? 0.2 : 1),
        icon,
      ),
    );
  }
}
