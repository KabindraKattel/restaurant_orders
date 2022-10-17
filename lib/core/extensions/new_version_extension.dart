import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:version/version.dart';

import '../../main.dart';

extension NewVersionX on NewVersionPlus {
  showAlertDialogIfNecessary({required BuildContext context}) async {
    VersionStatus? versionStatus;
    try {
      versionStatus = await getVersionStatus();
    } on StateError {
      versionStatus = null;
    } on Exception {
      versionStatus = null;
    }
    if (versionStatus != null && versionStatus.canUpdate) {
      _showUpdateDialog(
          context: context,
          versionStatus: versionStatus,
          allowDismissal: !_checkIsForced(versionStatus: versionStatus));
    }
  }

  bool _checkIsForced({required VersionStatus versionStatus}) {
    try {
      final Version local = Version.parse(versionStatus.localVersion);
      final Version store = Version.parse(versionStatus.storeVersion);
      if (store.major > local.major) {
        return true;
      }
      return false;
    } on StateError {
      return true;
    } on Exception {
      return true;
    }
  }

  void _showUpdateDialog({
    required BuildContext context,
    required VersionStatus versionStatus,
    String dialogTitle = 'Update Available',
    String? dialogText,
    String updateButtonText = 'Update',
    bool allowDismissal = true,
    String dismissButtonText = 'Maybe Later',
    VoidCallback? dismissAction,
  }) async {
    final dialogTitleWidget = Text(dialogTitle);
    final dialogTextWidget = Text(
      dialogText ??
          'Good News! You can now update ${packageInfo.appName} from ${versionStatus.localVersion} to ${versionStatus.storeVersion}',
    );

    final updateButtonTextWidget = Text(updateButtonText);
    updateAction() {
      launchAppStore(
        versionStatus.appStoreLink,
      );
      if (allowDismissal) {
        Navigator.of(context, rootNavigator: true).pop();
      }
    }

    List<Widget> actions = [
      Platform.isAndroid
          ? TextButton(
              onPressed: updateAction,
              child: updateButtonTextWidget,
            )
          : CupertinoDialogAction(
              onPressed: updateAction,
              child: updateButtonTextWidget,
            ),
    ];

    if (allowDismissal) {
      final dismissButtonTextWidget = Text(dismissButtonText);
      dismissAction = dismissAction ??
          () => Navigator.of(context, rootNavigator: true).pop();
      actions.add(
        Platform.isAndroid
            ? TextButton(
                onPressed: dismissAction,
                child: dismissButtonTextWidget,
              )
            : CupertinoDialogAction(
                onPressed: dismissAction,
                child: dismissButtonTextWidget,
              ),
      );
    }

    await showDialog(
      context: context,
      barrierDismissible: allowDismissal,
      builder: (BuildContext context) {
        return WillPopScope(
            child: Platform.isAndroid
                ? AlertDialog(
                    title: dialogTitleWidget,
                    content: dialogTextWidget,
                    actions: actions,
                  )
                : CupertinoAlertDialog(
                    title: dialogTitleWidget,
                    content: dialogTextWidget,
                    actions: actions,
                  ),
            onWillPop: () => Future.value(allowDismissal));
      },
    );
  }
}
