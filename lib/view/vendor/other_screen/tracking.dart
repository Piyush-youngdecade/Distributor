import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_header.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';

class Tracking extends StatefulWidget {
  static String routeName = './Tracking';
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  int removeLocation = 1;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColor.secondaryColor,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width * 100 / 100,
        height: MediaQuery.of(context).size.height * 100 / 100,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("./assets/icons/map.png"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppHeader(
              text: AppLanguage.trackingText[language],
              onPress: () {
                Navigator.pop(context);
              },
            ),
            if (removeLocation == 1)
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 90 / 100,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                        color: AppColor.secondaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 27 / 100,
                          height: MediaQuery.of(context).size.width * 25 / 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image:
                                      AssetImage("./assets/icons/indore.png"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 8 / 100,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 43 / 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      1 /
                                      100),
                              Text(
                                "Indore",
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: AppFont.fontFamily),
                              ),
                              Text(
                                "Vijay Nagar Square Madhya Pradesh",
                                style: TextStyle(
                                    color: AppColor.textfilledColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFont.fontFamily),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              removeLocation = 0;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 5 / 100,
                            height: MediaQuery.of(context).size.width * 5 / 100,
                            child: Image.asset(AppImage.crossIcon),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 5 / 100),
                ],
              )
          ],
        ),
      )),
    );
  }
}
