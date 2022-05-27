import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/resources/spacing_constants.dart';
import 'package:restaurant_orders/core/resources/styles_constants.dart';
import 'package:restaurant_orders/core/widgets/retry_button.dart';

import '../exceptions_and_failures/failures.dart';
import 'lottie_icons/error_icon.dart';
import 'lottie_icons/network_error_icon.dart';

class MyErrorWidget extends StatelessWidget {
  final Failure failure;
  final bool hideAnimation;
  final VoidCallback? onRetry;
  const MyErrorWidget({
    Key? key,
    this.failure = const OtherFailure(),
    this.onRetry,
    this.hideAnimation = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!hideAnimation) ...[
              const Spacer(),
              Flexible(
                child: failure is NetworkFailure
                    ? const NetworkErrorIcon()
                    : const ErrorIcon(),
              ),
            ],
            Text(
              failure.message,
              style: const TextStyle(
                height: SpacingConstants.kS1Half,
                fontSize: StylesConstants.kTitleSize,
                fontWeight: StylesConstants.kTitleWeight,
                color: ColorConstants.kErrorRed,
              ),
            ),
            if (onRetry != null)
              RetryButton(
                size: StylesConstants.kTitleSize,
                color: ColorConstants.kErrorRed,
                onRetry: onRetry,
              ),
            if (!hideAnimation) const Spacer(),
          ],
        ),
      ),
    );
  }
}
