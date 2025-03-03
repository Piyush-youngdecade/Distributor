import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_font.dart';

class SnackBarToastMessage {
  SnackBarToastMessage._();
  static showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColor.themeColor,
        duration: const Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(25),
        //   ),
        // ),
        content: Text(message,
          style: const TextStyle(
            color: AppColor.secondaryColor,
            fontFamily: AppFont.fontFamily,
          ),
        ),
      ),
    );
  }
}
