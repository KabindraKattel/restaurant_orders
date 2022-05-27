import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/confirmation_alert_dialog.dart';

import '../../../main.dart';

class WillPopPage extends StatelessWidget {
  final Widget child;
  const WillPopPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!Navigator.of(context).canPop()) {
          showDialog<bool>(
              context: context,
              barrierColor: ColorConstants.kErrorRed.withOpacity(0.5),
              builder: (context) {
                return ConfirmationAlertDialog(
                    content: Text(
                      "Do you want to exit from ${packageInfo.appName} ?",
                      style: const TextStyle(
                        fontSize: StylesConstants.kTitleSize,
                        fontWeight: StylesConstants.kTitleWeight,
                      ),
                    ),
                    onContinue: () async {
                      await SystemNavigator.pop();
                      // exit(0);
                    });
              });
          return true;
        }
        return true;
      },
      child: child,
    );
  }
}
