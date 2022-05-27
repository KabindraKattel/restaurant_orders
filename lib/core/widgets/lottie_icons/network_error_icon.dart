import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_orders/core/resources/color_constants.dart';
import 'package:restaurant_orders/core/resources/image_assets.dart';

class NetworkErrorIcon extends StatelessWidget {
  const NetworkErrorIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Lottie.asset(
        ImageAssets.kAnimatedNetworkErrorIcon,
        repeat: true,
        fit: BoxFit.scaleDown,
        width: constraints.maxWidth == double.infinity ? 36 : null,
        height: constraints.maxHeight == double.infinity ? 36 : null,
        options: LottieOptions(
          enableMergePaths: true,
        ),
        alignment: Alignment.center,
        delegates: LottieDelegates(
          values: [
            ValueDelegate.color(
              const [
                // 'Comp 1',
                'Shape Layer 5',
                'Shape Layer 4',
                'Shape Layer 3',
                'Shape Layer 2',
                'Shape Layer 1'
              ],
              value: ColorConstants.kErrorRed,
            ),
          ],
        ),
      );
    });
  }
}
