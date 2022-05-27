import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_orders/core/resources/image_assets.dart';

class ErrorIcon extends StatelessWidget {
  const ErrorIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Lottie.asset(
        ImageAssets.kAnimatedErrorIcon,
        repeat: true,
        fit: BoxFit.scaleDown,
        width: constraints.maxWidth == double.infinity ? 36 : null,
        height: constraints.maxHeight == double.infinity ? 36 : null,
        alignment: Alignment.center,
      );
    });
  }
}
