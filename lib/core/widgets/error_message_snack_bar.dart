import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_orders/core/resources/color_constants.dart';

class ErrorMsgSnackBar {
  static Future build({required String message}) {
    return Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.SNACKBAR,
      textColor: ColorConstants.kWhite,
      backgroundColor: ColorConstants.kErrorRed,
    );
  }
}
