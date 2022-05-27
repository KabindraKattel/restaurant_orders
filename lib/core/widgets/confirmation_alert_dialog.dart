import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

class ConfirmationAlertDialog extends StatelessWidget {
  final Function() onContinue;
  final Widget? content;

  const ConfirmationAlertDialog(
      {Key? key, this.content, required this.onContinue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text(
        "CANCEL",
        style: TextStyle(
          fontSize: StylesConstants.kTitleSize,
          fontWeight: StylesConstants.kTitleWeight,
        ),
      ),
      onPressed: () => Navigator.of(context).pop(false),
    );
    Widget continueButton = TextButton(
      child: const Text(
        "PROCEED",
        style: TextStyle(
          color: ColorConstants.kErrorRed,
          fontSize: StylesConstants.kTitleSize,
          fontWeight: StylesConstants.kTitleWeight,
        ),
      ),
      onPressed: () {
        onContinue();
        Navigator.of(context).pop(true);
      },
    );

    // set up the AlertDialog
    return AlertDialog(
      title: Text(
        "Confirmation Alert !".toUpperCase(),
        style: const TextStyle(
            color: ColorConstants.kErrorRed,
            fontSize: StylesConstants.kHeadingSize,
            fontWeight: StylesConstants.kHeadingWeight),
      ),
      content: content,
      elevation: 0.5,
      actions: [
        cancelButton,
        continueButton,
      ],
    );
  }
}
