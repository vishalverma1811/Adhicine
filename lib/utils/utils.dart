import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_ui/theme/app_color.dart';

class Utils{
  // for vertical spacing |
  SizedBox vSpacer(height) {
    return SizedBox(height: height);
  }

  // for horizontal spacing <->
  SizedBox hSpacer(width) {
    return SizedBox(width: width);
  }

  static successSnackbar(String title, String message, {Color? color, Color? textColor}) {
    Get.snackbar(
      title,
      message,

      colorText: textColor ??AppColors.whiteColor,
      animationDuration: const Duration(seconds: 2),
      backgroundColor: color??AppColors.buttonColor,
      duration: const Duration(seconds: 3),
      barBlur: 0,
    );
  }

  static errorSnackbar(String title, String message, {int sec = 3}) {
    Get.snackbar(
      title,
      message,
      colorText: AppColors.requiredColor,
      animationDuration: const Duration(seconds: 2),
      backgroundColor: AppColors.whiteColor,
      duration: Duration(seconds: sec),
      barBlur: 0,
    );
  }
}