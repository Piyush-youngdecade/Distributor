import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

import 'app_font.dart';
import 'app_image.dart';

class SettingRow extends StatelessWidget {
  final String title;
  final String leadingIcon;
  final Function onPress;

  const SettingRow({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        onPress();
      },
      child: Container(
        padding: const EdgeInsets.only(right: 10, top: 5),
        color: AppColor.secondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 5 / 100,
                  height: MediaQuery.of(context).size.width * 5 / 100,
                  child: Image.asset(leadingIcon),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 3 / 100,),
                Text(title,
                  style: TextStyle(
                    color: AppColor.primaryColor.withOpacity(0.4),
                    fontFamily: AppFont.fontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 4.5 / 100,
              height: MediaQuery.of(context).size.width * 4.5 / 100,
              child: Image.asset(AppImage.rightArrowIcon),
            ),
          ],
        ),
      ),
    );
  }
}
