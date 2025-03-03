import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utilities/app_color.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';
import 'report_screen.dart';
import 'salesman_attendance_screen.dart';

class SalesmanDetails extends StatefulWidget {
  static String routeName = "./SalesmanDetails";
  const SalesmanDetails({super.key, required this.image, required this.name, required this.id});

  final dynamic image;
  final String name;
  final String id;

  @override
  State<SalesmanDetails> createState() => _SalesmanDetailsState();
}

class _SalesmanDetailsState extends State<SalesmanDetails> {

  List<dynamic> actionList = [
    {
      "id" : 1,
      "icon" : AppImage.attendanceIcon,
      "action" : AppLanguage.attendanceText[language]
    },
    {
      "id" : 2,
      "icon" : AppImage.reportIcon,
      "action" : AppLanguage.reportText[language]
    },
    {
      "id" : 3,
      "icon" : AppImage.todoIcon,
      "action" : AppLanguage.todoListText[language]
    },
    {
      "id" : 4,
      "icon" : AppImage.trackingIcon,
      "action" : AppLanguage.trackingText[language]
    },
    {
      "id" : 5,
      "icon" : AppImage.shopVisitIcon,
      "action" : AppLanguage.shopVisitText[language]
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
                height: MediaQuery.of(context).size.height * 8 / 100,
                width: MediaQuery.of(context).size.width * 100 / 100,
                color: AppColor.secondaryColor,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*30/100,
                        height: MediaQuery.of(context).size.width*30/100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 3, color: AppColor.blueColor),
                          image: DecorationImage(
                            image: AssetImage(widget.image),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*1/100,),
                      Text(widget.name,
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontFamily: AppFont.fontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${AppLanguage.idText[language]} : ",
                            style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                            ),
                          ),
                          Text(widget.id,
                            style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*4/100,),
                      Wrap(
                        spacing: MediaQuery.of(context).size.width*6/100,
                        runSpacing: MediaQuery.of(context).size.width*6/100,
                        children: List.generate(actionList.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              if(actionList[index]["id"] == 1){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SalesmanAttendance(image: widget.image,)));
                              }
                              if(actionList[index]["id"] == 2){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Report(image: widget.image,)));
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width*38/100,
                              height: MediaQuery.of(context).size.width*30/100,
                              decoration: BoxDecoration(
                                color: AppColor.secondaryColor,
                                border: Border.all(color: AppColor.blueColor),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.primaryColor.withOpacity(0.25),
                                    blurRadius: 13,
                                    offset: const Offset(0, 4)
                                  )
                                ]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width*10/100,
                                    width: MediaQuery.of(context).size.width*10/100,
                                    child: Image.asset(actionList[index]["icon"]),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height*1/100,),
                                  Text(actionList[index]["action"],
                                    style: const TextStyle(
                                      color: AppColor.blueColor,
                                      fontFamily: AppFont.fontFamily,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        )
      ),
    );
  }
}