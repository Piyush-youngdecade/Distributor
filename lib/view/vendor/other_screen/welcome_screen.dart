import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../../utilities/app_color.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';
import '../authentication/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "./WelcomeScreen";
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int status = 0;
  CarouselController carouselController = CarouselController();

  List<dynamic> welcomeList = [
    {
      "id": 1,
      "image": AppImage.welcomeImage1,
      "title": "Fast & Reliable Delivery",
      "description":
          "Get your products delivered on schedule with our efficient logistics network."
    },
    {
      "id": 2,
      "image": AppImage.welcomeImage2,
      "title": "Effortless Ordering",
      "description":
          "Quickly browse products, place orders, and keep track of everything in real time."
    },
    {
      "id": 3,
      "image": AppImage.welcomeImage3,
      "title": " Real-Time Tracking",
      "description":
          "Monitor order status, track shipments, and access insightful analytics at your fingertips."
    },
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.secondaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColor.secondaryColor,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width * 100 / 100,
        height: MediaQuery.of(context).size.height * 100 / 100,
        decoration: const BoxDecoration(gradient: AppColor.welcomeGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              carouselController: carouselController,
              items: List.generate(welcomeList.length, (index) {
                return Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 100 / 100,
                        height: MediaQuery.of(context).size.width * 80 / 100,
                        child: Image.asset(
                          welcomeList[index]["image"],
                          fit: BoxFit.cover,
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 90 / 100,
                      child: Text(
                        welcomeList[index]["title"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontFamily: AppFont.fontFamily,
                            fontWeight: FontWeight.w600,
                            fontSize: 30),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 80 / 100,
                      child: Text(
                        welcomeList[index]["description"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColor.darkSilverColor,
                            fontFamily: AppFont.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                  ],
                );
              }),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 60 / 100,
                enableInfiniteScroll: false,
                initialPage: 0,
                autoPlay: false,
                viewportFraction: 1.0,
                onPageChanged: (imageIndex, reason) {
                  setState(() {
                    status = imageIndex;
                  });
                },
              ),
            ),
            // SizedBox(height: MediaQuery.of(context).size.height*3/100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(welcomeList.length, (indexes) {
                return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width * .5 / 100),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 2 / 100,
                      width: MediaQuery.of(context).size.width * 2 / 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: status == indexes
                            ? AppColor.blueColor
                            : AppColor.secondaryColor,
                      ),
                    ));
              }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 8 / 100,
            ),
            if (status != 2)
              GestureDetector(
                onTap: () {
                  setState(() {
                    status++;
                  });
                  carouselController.animateToPage(status);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 14 / 100,
                  height: MediaQuery.of(context).size.width * 14 / 100,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.secondaryColor),
                  child: Image.asset(AppImage.forwardIcon),
                ),
              ),
            if (status == 2)
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 70 / 100,
                    height: MediaQuery.of(context).size.height * 6.5 / 100,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppLanguage.getStartedText[language],
                      style: const TextStyle(
                          color: AppColor.blueColor,
                          fontFamily: AppFont.fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    )),
              ),
          ],
        ),
      )),
    );
  }
}
