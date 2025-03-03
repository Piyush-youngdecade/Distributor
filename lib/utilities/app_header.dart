import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'app_color.dart';
import 'app_font.dart';
import 'app_image.dart';

class AppHeader extends StatelessWidget {
  final String text;
  final Function onPress;
  const AppHeader({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 8 / 100,
      width: MediaQuery.of(context).size.width * 100 / 100,
      padding: const EdgeInsets.only(right: 18),
      color: AppColor.secondaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              onPress();
            },
            child: Container(
              color: AppColor.secondaryColor,
              padding: const EdgeInsets.only(left: 18),
              child: Image.asset(
                width: MediaQuery.of(context).size.width * 6 / 100,
                height: MediaQuery.of(context).size.width * 6 / 100,
                AppImage.backIcon,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(text,
            style: const TextStyle(
              color: AppColor.blueColor,
              fontFamily: AppFont.fontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            )
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 6 / 100,
            width: MediaQuery.of(context).size.width * 6 / 100,
          ),
        ],
      ),
    );
  }
}
