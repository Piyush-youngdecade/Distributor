import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utilities/app_color.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = "./NotificationScreen";
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<dynamic> notificationList = [
    {
      'id': 1,
      "date": "23-01-2025",
      "status": "Tatiana just messaged you",
    },
    {
      'id': 2,
      "date": "23-01-2025",
      "status": "Philip viewed your story",
    },
    {
      'id': 3,
      "date": "23-01-2025",
      "status": "Tatiana just messaged you",
    },
    {
      'id': 4,
      "date": "23-01-2025",
      "status": "Philip viewed your story",
    },
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColor.secondaryColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: AppColor.secondaryColor,
      statusBarIconBrightness: Brightness.dark)
    );
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width * 100 / 100,
          height: MediaQuery.of(context).size.height * 100 / 100,
          color: AppColor.secondaryColor,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 100 / 100,
                height: MediaQuery.of(context).size.height * 8 / 100,
                padding: const EdgeInsets.only(right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
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
                    Text(AppLanguage.notificationsText[language],
                      style: const TextStyle(
                        color: AppColor.blueColor,
                        fontFamily: AppFont.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                      ),
                    ),
                    Text(AppLanguage.clearAllText[language],
                      style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontFamily: AppFont.fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 12
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*90/100,
                        child: Wrap(
                          children: List.generate(notificationList.length, (index) {
                          return Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 90 / 100,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width*9/100,
                                      height: MediaQuery.of(context).size.width*9/100,
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.brightGrayColor
                                      ),
                                      child: Image.asset(AppImage.notificationIcon),
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width *3/100,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width *75 /100,
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "${AppLanguage.messageText[language]} ",
                                                  style: const TextStyle(
                                                    color: AppColor.primaryColor,
                                                    fontFamily: AppFont.fontFamily,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: notificationList[index]["status"],
                                                  style: const TextStyle(
                                                    color: AppColor.primaryColor,
                                                    fontFamily: AppFont.fontFamily,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14
                                                  ),
                                                )
                                              ]
                                            )
                                          ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height *0.5 /100,),
                                        Text(notificationList[index]["date"],
                                          style: const TextStyle(
                                            color: AppColor.darkSilverColor,
                                            fontFamily: AppFont.fontFamily,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: MediaQuery.of(context).size.height*2.5/100,
                                color: AppColor.grayColor
                              )
                            ],
                          );
                        })),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 100,
              )
            ],
          ),
        )
      ),
    );
  }
}
