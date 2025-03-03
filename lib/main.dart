import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utilities/app_color.dart';
import 'utilities/app_font.dart';
import 'utilities/routes.dart';
import 'view/vendor/other_screen/blurredImage.dart';
import 'view/vendor/other_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.secondaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColor.secondaryColor,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: 'Distributor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.themeColor,
        ),
        fontFamily: AppFont.fontFamily,
      ),
      // initialRoute: Splash.routeName,
      routes: routes,
      home: BlurredImage(),
    );
  }
}
