import 'dart:ui';

import 'package:flutter/material.dart';

class DialogUtils {
  static Future<T?> showBlurredDialog<T>(
      {required BuildContext context, required Widget page}) async {
    return showGeneralDialog<T>(
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 1.5 * anim1.value, sigmaY: 1.5 * anim1.value),
        child: FadeTransition(
          child: child,
          opacity: anim1,
        ),
      ),
      pageBuilder: (_, __, ___) => page,
    );
  }
}
