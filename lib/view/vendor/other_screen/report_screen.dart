import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utilities/app_color.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';
import 'shop_details_screen.dart';

class Report extends StatefulWidget {
  static String routeName = "./Report";
  const Report({super.key, required this.image});

  final dynamic image;

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {

  List<dynamic> durationList = [
    {
      "id" : 1,
      "duration" : AppLanguage.dailyText[language],
    },
    {
      "id" : 2,
      "duration" : AppLanguage.weeklyText[language],
    },
    {
      "id" : 3,
      "duration" : AppLanguage.monthlyText[language],
    },
    {
      "id" : 4,
      "duration" : AppLanguage.yearlyText[language],
    },
  ];

  int selected = 1;

  List<dynamic> shopList = [
    {
      "id" : 1,
      "name" : "Sweet",
      "visitStatus" : "Visited",
    },
    {
      "id" : 2,
      "name" : "Sweet",
      "visitStatus" : "Closed",
    },
    {
      "id" : 3,
      "name" : "Sweet",
      "visitStatus" : "Visited",
    },
    {
      "id" : 4,
      "name" : "Sweet",
      "visitStatus" : "Closed",
    },
    {
      "id" : 5,
      "name" : "Sweet",
      "visitStatus" : "Closed",
    },
    {
      "id" : 6,
      "name" : "Sweet",
      "visitStatus" : "Visited",
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
          width: MediaQuery.of(context).size.width*100/100,
          height: MediaQuery.of(context).size.height*100/100,
          color: AppColor.secondaryColor,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.longestSide * 8 / 100,
                width: MediaQuery.of(context).size.width * 100 / 100,
                padding: const EdgeInsets.only(right: 18),
                color: AppColor.secondaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: AppColor.secondaryColor,
                        padding: EdgeInsets.only(left: 18, right: MediaQuery.of(context).size.shortestSide*5/100),
                        child: Image.asset(
                          width: MediaQuery.of(context).size.shortestSide * 6 / 100,
                          height: MediaQuery.of(context).size.shortestSide * 6 / 100,
                          AppImage.backIcon,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(AppLanguage.reportText[language],
                      style: const TextStyle(
                        color: AppColor.blueColor,
                        fontFamily: AppFont.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      )
                    ),
                    Container(
                      width: MediaQuery.of(context).size.shortestSide*11/100,
                      height: MediaQuery.of(context).size.shortestSide*11/100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: AppColor.blueColor),
                        image: DecorationImage(
                          image: AssetImage(widget.image),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.longestSide*3/100,),
              SizedBox(
                width: MediaQuery.of(context).size.width*90/100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(durationList.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = durationList[index]["id"];
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.shortestSide*20/100,
                        height: MediaQuery.of(context).size.shortestSide*9/100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: durationList[index]["id"] == selected 
                          ? AppColor.themeColor
                          : AppColor.secondaryColor,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.primaryColor.withOpacity(0.25),
                              blurRadius: 15,
                              offset: const Offset(0, 4)
                            )
                          ]
                        ),
                        child: Text(durationList[index]["duration"],
                          style: TextStyle(
                            color: durationList[index]["id"] == selected 
                            ? AppColor.secondaryColor
                            : AppColor.primaryColor,
                            fontFamily: AppFont.fontFamily,
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*3/100,),
              SizedBox(
                width: MediaQuery.of(context).size.width*90/100,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColor.primaryColor.withOpacity(0.19))
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLanguage.nameText[language],
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontFamily: AppFont.fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                        ),
                      ),
                      Text(AppLanguage.shopText[language],
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontFamily: AppFont.fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                        ),
                      ),
                      Text(AppLanguage.pdfText[language],
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontFamily: AppFont.fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*1/100,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*85/100,
                        child: Wrap(
                          children: List.generate(shopList.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ShopDetails(shopName: shopList[index]["name"],)));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: AppColor.primaryColor.withOpacity(0.19))
                                  )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(shopList[index]["name"],
                                      style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontFamily: AppFont.fontFamily,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16
                                      ),
                                    ),
                                    Text(shopList[index]["visitStatus"],
                                      style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontFamily: AppFont.fontFamily,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                                        decoration: BoxDecoration(
                                          color: AppColor.blueColor,
                                          borderRadius: BorderRadius.circular(3)
                                        ),
                                        child: Text(AppLanguage.viewText[language],
                                          style: const TextStyle(
                                            color: AppColor.secondaryColor,
                                            fontFamily: AppFont.fontFamily,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}