import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utilities/app_color.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';
import 'welcome_screen.dart';

class Splash extends StatefulWidget {
  static String routeName = '/Splash';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  bool status = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColor.secondaryColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: AppColor.secondaryColor,
      statusBarIconBrightness: Brightness.dark)
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width * 100 / 100,
          height: MediaQuery.of(context).size.height * 100 / 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImage.splashImage),
              fit: BoxFit.cover
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*18/100,),
              Text(AppLanguage.distributorAppText[language],
                style: const TextStyle(
                  color: AppColor.secondaryColor,
                  fontFamily: AppFont.fontFamily,
                  fontWeight: FontWeight.w600,
                  fontSize: 36
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
