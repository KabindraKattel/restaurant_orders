import 'package:flutter/widgets.dart';

import '../resources/resources.dart';

class NoDataFound extends StatelessWidget {
  final String? message;
  final Widget? child;
  const NoDataFound({Key? key, this.message, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SpacingConstants.kS8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            Text(
              message ?? MessageConstants.kNoData,
              style: const TextStyle(
                  fontSize: StylesConstants.kTitleSize,
                  fontWeight: StylesConstants.kTitleWeight,
                  color: ColorConstants.kErrorRed),
            ),
            if (child != null) child!,
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
