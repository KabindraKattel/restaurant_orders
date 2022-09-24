import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/confirmation_alert_dialog.dart';
import 'package:restaurant_orders/main.dart';
import 'package:restaurant_orders/repos/baseUrl/base_url_repo.dart';

class BaseUrlUtils {
  static Future<bool?> showInputDialog(
      {required FormControl<String> formControl,
      required BaseUrlRepo repo}) async {
    return await showDialog<bool>(
        context: navigatorKey.currentContext!,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: ConfirmationAlertDialog(
                isDanger: false,
                title: StringConstants.kServerUrlSetup.toUpperCase(),
                content: ReactiveTextField<String>(
                  toolbarOptions: const ToolbarOptions(
                    copy: true,
                    paste: true,
                    cut: true,
                    selectAll: true,
                  ),
                  decoration: const InputDecoration(
                      isDense: true,
                      labelText: '${StringConstants.kServerUrl}*',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(SpacingConstants.kS16),
                      errorStyle: TextStyle(
                        color: ColorConstants.kErrorRed,
                      )),
                  formControl: formControl,
                  keyboardType: TextInputType.url,
                ),
                onContinue: () async {
                  if (formControl.valid) {
                    return true;
                  } else {
                    formControl.markAsTouched();
                    return false;
                  }
                },
              ),
            ),
          );
        });
  }

  static Future<bool?> showConfirmBaseUrlDialog(
      {required FormControl<String> formControl}) async {
    return await showDialog<bool>(
        barrierColor: ColorConstants.kErrorRed.withOpacity(0.5),
        context: navigatorKey.currentContext!,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: ConfirmationAlertDialog(
                isDanger: true,
                title: StringConstants.kServerUrlSetup.toUpperCase(),
                content: Text(
                    'Do yo want to proceed with server url:\n ${formControl.value ?? ''}?'),
                onContinue: () async {
                  if (formControl.valid) {
                    return true;
                  } else {
                    formControl.markAsTouched();
                    return false;
                  }
                },
              ),
            ),
          );
        });
  }
}
