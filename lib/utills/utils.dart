import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_login_getx/res/colors/colors.dart';

class Utils {
  static void textFieldFocusChange(BuildContext ctx, FocusNode cur,
      FocusNode next) {
    cur.unfocus();
    FocusScope.of(ctx).requestFocus(next);
  }

  static toastMsg(String msg) {
    Fluttertoast.showToast(msg: msg,
        backgroundColor: AppColors.black,
        textColor: AppColors.white,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG);
  }

  static toastMsgCenter(String msg) {
    Fluttertoast.showToast(msg: msg,
        backgroundColor: AppColors.black,
        textColor: AppColors.white,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_SHORT);
  }

  static snackBarMsg(String title, String msg) {
    Get.snackbar(title, msg);
  }
}
