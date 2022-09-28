import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

class LocalTableInputScreen extends StatefulWidget {
  final FormControl<String> formControl;
  final void Function(FormControl<String> control)? onChanged;
  const LocalTableInputScreen(
      {Key? key, required this.formControl, this.onChanged})
      : super(key: key);

  @override
  State<LocalTableInputScreen> createState() => _LocalTableInputScreenState();
}

class _LocalTableInputScreenState extends State<LocalTableInputScreen> {
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
            Text(
              StringConstants.kTableNumber,
              textAlign: TextAlign.center,
              style: _style,
            ),
            ReactiveTextField<String>(
              formControl: widget.formControl,
              textInputAction: TextInputAction.done,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: _style.copyWith(
                  fontWeight: StylesConstants.kSubTitleWeight,
                  fontSize: StylesConstants.kSubTitleSize),
              strutStyle: const StrutStyle(height: 1.5),
              minLines: 1,
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                hintText: 'Example: 101',
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
