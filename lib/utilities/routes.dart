import 'package:flutter/material.dart';

import '../view/vendor/authentication/contact_us_screen.dart';
import '../view/vendor/authentication/delete_account_screen.dart';
import '../view/vendor/authentication/login_screen.dart';
import '../view/vendor/authentication/notification_screen.dart';
import '../view/vendor/authentication/otp_verify_screen.dart';
import '../view/vendor/bottomnavigation/profile_screen.dart';
import '../view/vendor/other_screen/splash_screen.dart';
import '../view/vendor/bottomnavigation/home_screen.dart';
import '../view/vendor/content_screen/content_screen.dart';
import '../view/vendor/other_screen/faq_screen.dart';
import '../view/vendor/other_screen/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (context) => const Splash(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  
  //1.1 authentication route
  Login.routeName: (context) => const Login(),
  ContactUs.routeName: (context) => const ContactUs(),
  DeleteAccount.routeName: (context) => const DeleteAccount(),
  NotificationScreen.routeName: (context) => const NotificationScreen(),
  OTP.routeName: (context) => const OTP(),
  Content.routeName: (context) => const Content(),
  Home.routeName: (context) => const Home(),
  Profile.routeName: (context) => const Profile(),

  //1.2 other
  FAQ.routeName: (context) => const FAQ(),
};
