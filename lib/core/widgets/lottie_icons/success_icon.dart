import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_orders/core/resources/image_assets.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Lottie.asset(ImageAssets.kAnimatedSuccessIcon,
          repeat: false,
          fit: BoxFit.scaleDown,
          width: constraints.maxWidth == double.infinity ? 36 : null,
          height: constraints.maxHeight == double.infinity ? 36 : null,
          alignment: Alignment.center);
    });
  }
}
