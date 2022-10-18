import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

class InputField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextInputAction? textInputAction;
  final FormControl<String> formControl;
  final void Function(FormControl<String> control)? onSubmitted;
  final void Function(FormControl<String> control)? onChanged;

  const InputField(
      {Key? key,
      this.hintText,
      this.labelText,
      required this.formControl,
      this.onSubmitted,
      this.textInputAction,
      this.onChanged})
      : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  StreamSubscription? _subscription;
  final TextStyle _style = const TextStyle(
    color: ColorConstants.kBlack,
    fontSize: StylesConstants.kCaptionSize,
    fontWeight: StylesConstants.kHeadingWeight,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _subscription = widget.formControl.valueChanges.listen((event) {
        if (widget.formControl.valid) {
          widget.onChanged?.call(widget.formControl);
        }
      });
    });
  }

  @override
  void dispose() async {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.formControl.focus(),
      child: InputDecorator(
        decoration: const InputDecoration(
          isDense: true,
          filled: true,
          fillColor: ColorConstants.kWhite,
          contentPadding: EdgeInsets.symmetric(
              horizontal: SpacingConstants.kS8, vertical: SpacingConstants.kS4),
          border: OutlineInputBorder(
            gapPadding: SpacingConstants.kS0,
            borderRadius: BorderRadius.all(RadiusConstants.kR8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if ((widget.labelText?.trim())?.isNotEmpty ?? false)
              Text(
                widget.labelText!,
                textAlign: TextAlign.center,
                style: _style,
              ),
            ReactiveTextField<String>(
              formControl: widget.formControl,
              textInputAction: widget.textInputAction ?? TextInputAction.done,
              maxLines: 3,
              textAlign: TextAlign.center,
              onSubmitted: widget.onSubmitted,
              style: _style.copyWith(
                  fontWeight: StylesConstants.kSubTitleWeight,
                  fontSize: StylesConstants.kSubTitleSize),
              strutStyle: const StrutStyle(height: 1.5),
              minLines: 1,
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                hintText: widget.hintText,
                hintStyle: _style.copyWith(
                    fontWeight: StylesConstants.kCaptionWeight,
                    fontSize: StylesConstants.kSubTitleSize),
                errorMaxLines: 5,
                errorStyle: _style.copyWith(color: ColorConstants.kErrorRed),
                contentPadding: const EdgeInsets.all(SpacingConstants.kS0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
