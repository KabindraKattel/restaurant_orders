import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

import 'lottie_icons/success_icon.dart';

class SuccessWidget extends StatelessWidget {
  final String message;
  final bool hideAnimation;
  final VoidCallback? onContinue;

  const SuccessWidget(
      {Key? key,
      this.message = 'Success!',
      this.onContinue,
      this.hideAnimation = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!hideAnimation) ...[
              const Flexible(
                child: SuccessIcon(),
              ),
            ],
            Text(
              message,
              style: const TextStyle(
                  height: SpacingConstants.kS1Half,
                  fontSize: StylesConstants.kSubTitleSize,
                  fontWeight: StylesConstants.kSubTitleWeight,
                  color: ColorConstants.kSuccess),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ColorConstants.kSuccess),
                foregroundColor:
                    MaterialStateProperty.all(ColorConstants.kWhite),
              ),
              onPressed: onContinue,
              child: Text('OK'),
            )
          ]),
    ));
  }
}
