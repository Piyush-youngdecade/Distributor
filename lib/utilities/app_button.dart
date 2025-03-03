import 'package:flutter/material.dart';

import '../utilities/app_color.dart';
import 'app_font.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPress;

  const AppButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        onPress();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 85 / 100,
        height: MediaQuery.of(context).size.height * 6.5 / 100,
        decoration: BoxDecoration(
          color: AppColor.themeColor,
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: Text(text,
          style: const TextStyle(
            color: AppColor.secondaryColor,
            fontFamily: AppFont.fontFamily,
            fontWeight: FontWeight.w600, 
            fontSize: 16
          ),
        )
      ),
    );
  }
}
