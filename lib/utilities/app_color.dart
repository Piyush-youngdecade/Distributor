import 'package:flutter/material.dart';

class AppColor {
  static const Color themeColor = Color(0xff027EFA);
  static const Color primaryColor = Colors.black;
  static const Color secondaryColor = Colors.white;
  static const Color textfilledColor = Color(0xff7A7A7A);
  static const Color blueColor = Color(0xff228FD8);
  static const Color blueSapphireColor = Color(0xff186090);
  static const Color darkSilverColor = Color(0xff6D6E71);
  static const Color brightGrayColor = Color(0xffEFEFEF);
  static const Color grayColor= Color(0xffBBBDBD);
  static const Color redColor = Color(0xffE51818);
  static const Color waterColor = Color(0xffD3F4FA);
  static const Color lightCyanColor = Color(0xffDBFAFF);
  static const Color mistyRoseColor = Color(0xffFFE1DE);
  static const Color lightSilverColor = Color(0xffD9D9D9);
  static const Color greenColor = Color(0xff2CC11E);
  static const Color yellowColor = Color(0xffEBD722);

  static const Color redLightColor = Color(0xffFFD0CC);
  static const Color darkRedColor = Color(0xffC72F21);
  static const Color greenDarkColor = Color(0xff15711B);
  static const shadowColor = Color(0xffBCBEC0);
 

  static const Gradient welcomeGradient = LinearGradient(
    colors: [
      AppColor.secondaryColor,
      AppColor.blueColor
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
  );



}
