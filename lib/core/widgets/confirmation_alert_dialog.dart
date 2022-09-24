import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

class ConfirmationAlertDialog extends StatelessWidget {
  final Future<bool> Function() onContinue;
  final bool isDanger;
  final String? title;
  final Widget? content;

  const ConfirmationAlertDialog({
    Key? key,
    this.title,
    this.content,
    required this.onContinue,
    this.isDanger = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        "CANCEL",
        style: isDanger ? _getNonDangerStyle(context) : _getDangerStyle(),
      ),
      onPressed: () => Navigator.of(context).pop(false),
    );
    Widget continueButton = TextButton(
      child: Text(
        "PROCEED",
        style: !isDanger ? _getNonDangerStyle(context) : _getDangerStyle(),
      ),
      onPressed: () async {
        if (await onContinue()) {
          Navigator.of(context).pop(true);
        }
      },
    );

    // set up the AlertDialog
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 2,
        sigmaY: 2,
      ),
      child: AlertDialog(
        title: Text(
          title ?? "Confirmation Alert !".toUpperCase(),
          style: !isDanger
              ? _getNonDangerStyle(context, false)
              : _getDangerStyle(false),
        ),
        content: content,
        elevation: 0.5,
        actions: [
          cancelButton,
          continueButton,
        ],
      ),
    );
  }

  TextStyle _getDangerStyle([bool isContent = true]) {
    return TextStyle(
      color: ColorConstants.kErrorRed,
      fontSize: isContent
          ? StylesConstants.kSubTitleSize
          : StylesConstants.kTitleSize,
      fontWeight: isContent
          ? StylesConstants.kSubTitleWeight
          : StylesConstants.kTitleWeight,
    );
  }

  TextStyle _getNonDangerStyle(BuildContext context, [bool isContent = true]) {
    return TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: isContent
          ? StylesConstants.kSubTitleSize
          : StylesConstants.kTitleSize,
      fontWeight: isContent
          ? StylesConstants.kSubTitleWeight
          : StylesConstants.kTitleWeight,
    );
  }
}
