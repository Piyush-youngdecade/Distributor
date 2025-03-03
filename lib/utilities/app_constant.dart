import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_color.dart';
import 'app_font.dart';

int language = 0;

class AppConstant {
  static const int appStatus = 0;
  static const TextStyle appBarTitleStyle = TextStyle(
    fontSize: 22,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
  static final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  
  // Definition of max length
  static const int businessNameMaxLength = 50;
  static const int firstNameMaxLength = 25;
  static const int lastNameMaxLength = 25;
  static const int emailMaxLength = 50;
  static const int passwordMaxLength = 16;
  static const int fullNameMaxLength = 50;
  static const int mobileMaxLength = 10;
  static const int searchMaxLength = 100;
  static const int messageMaxLength = 250;
  static const int reviewMaxLength = 250;
  static const int addressMaxLength = 250;
  static const int aadhaarMaxLength = 12;
  static int selectFooterIndex = 0;

  static TextStyle textFilledHeading = TextStyle(
    color: AppColor.textfilledColor,
    fontFamily: AppFont.fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14, 
  );

  static const TextStyle textFilledStyle = TextStyle(
    color: AppColor.primaryColor,
    fontFamily: AppFont.fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
}

class SuccessClass {
  final String title;
  final String message;

  SuccessClass({required this.title, required this.message});
}

class ContentClass {
  final String header;
  final String contenttype;

  ContentClass({required this.header, required this.contenttype});
}

enum BottomMenus { notification, home, profile }
