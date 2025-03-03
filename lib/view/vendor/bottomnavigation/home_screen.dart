import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../../utilities/app_color.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';
import '../../../utilities/app_snackbar_toast_message.dart';
import '../authentication/notification_screen.dart';
import '../other_screen/add_salesman_screen.dart';
import '../other_screen/salesman_details_screen.dart';

class Home extends StatefulWidget {
  static String routeName = "./Home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  DateTime? lastPressed;

  List<dynamic> salesmanList = [
    {
      "id" : 1,
      "image" : "./assets/icons/salesman_image1.png",
      "name" : "Deepak Kumar",
      "personID" : "R452678"
    },
    {
      "id" : 2,
      "image" : "./assets/icons/salesman_image2.png",
      "name" : "Rohit Kumar",
      "personID" : "R452679"
    },
    {
      "id" : 3,
      "image" : "./assets/icons/salesman_image3.png",
      "name" : "Satyam",
      "personID" : "R452680"
    },
    {
      "id" : 4,
      "image" : "./assets/icons/salesman_image4.png",
      "name" : "Shubham",
      "personID" : "R452681"
    },
    {
      "id" : 5,
      "image" : "./assets/icons/salesman_image1.png",
      "name" : "Rohit",
      "personID" : "R452682"
    },
    {
      "id" : 6,
      "image" : "./assets/icons/salesman_image2.png",
      "name" : "Vivek",
      "personID" : "R452678"
    },
    {
      "id" : 7,
      "image" : "./assets/icons/salesman_image3.png",
      "name" : "Virat",
      "personID" : "R452678"
    },
    {
      "id" : 8,
      "image" : "./assets/icons/salesman_image4.png",
      "name" : "Mohit",
      "personID" : "R452678"
    },
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.secondaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColor.secondaryColor,
        statusBarIconBrightness: Brightness.dark
      )
    );
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        final now = DateTime.now();
        const maxDuration = Duration(seconds: 2);
        final isWarning = lastPressed == null || now.difference(lastPressed!) > maxDuration;
        if (isWarning) {
          lastPressed = now;
          SnackBarToastMessage.showSnackBar(context, AppLanguage.pressAgainExitText[language]);
        } else {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.secondaryColor,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*100/100,
                height: MediaQuery.of(context).size.height*100/100,
                color: AppColor.secondaryColor,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*100/100,
                      padding: const EdgeInsets.fromLTRB(18, 10, 18, 15),
                      decoration: const BoxDecoration(
                        color: AppColor.themeColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        )
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLanguage.distributorAppText[language],
                                style: const TextStyle(
                                  color: AppColor.secondaryColor,
                                  fontFamily: AppFont.fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width*9/100,
                                  height: MediaQuery.of(context).size.width*9/100,
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.brightGrayColor
                                  ),
                                  child: Image.asset(AppImage.notificationBlueIcon),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*1/100),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*90/100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(AppLanguage.salesmanText[language],
                                        style: const TextStyle(
                                          color: AppColor.primaryColor,
                                          fontFamily: AppFont.fontFamily,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20
                                        ),
                                      ),
                                      Text("(20)",
                                        style: TextStyle(
                                          color: AppColor.primaryColor.withOpacity(0.74),
                                          fontFamily: AppFont.fontFamily,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColor.grayColor.withOpacity(0.21)),
                                      borderRadius: BorderRadius.circular(4)
                                    ),
                                    child: Text(AppLanguage.seeAllText[language],
                                      style: const TextStyle(
                                        color: AppColor.blueColor,
                                        fontFamily: AppFont.fontFamily,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*90/100,
                              child: Wrap(
                                children: List.generate(salesmanList.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => SalesmanDetails(image: salesmanList[index]["image"], name: salesmanList[index]["name"], id: salesmanList[index]["personID"],)));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          color: AppColor.secondaryColor,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: MediaQuery.of(context).size.width*10/100,
                                                    height: MediaQuery.of(context).size.width*10/100,
                                                    padding: const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        image: AssetImage(salesmanList[index]["image"]),
                                                        fit: BoxFit.cover
                                                      )
                                                    ),
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width *3/100,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(salesmanList[index]["name"],
                                                        style: const TextStyle(
                                                          color: AppColor.primaryColor,
                                                          fontFamily: AppFont.fontFamily,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text("${AppLanguage.idText[language]} : ",
                                                            style: const TextStyle(
                                                              color: AppColor.darkSilverColor,
                                                              fontFamily: AppFont.fontFamily,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 10
                                                            ),
                                                          ),
                                                          Text(salesmanList[index]["personID"],
                                                            style: const TextStyle(
                                                              color: AppColor.darkSilverColor,
                                                              fontFamily: AppFont.fontFamily,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 10
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
                                                    decoration: BoxDecoration(
                                                      color: AppColor.waterColor,
                                                      borderRadius: BorderRadius.circular(4)
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(AppLanguage.editText[language],
                                                          style: const TextStyle(
                                                            color: AppColor.blueColor,
                                                            fontFamily: AppFont.fontFamily,
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 10
                                                          ),
                                                        ),
                                                        SizedBox(width: MediaQuery.of(context).size.width*1/100,),
                                                        Image.asset(
                                                          width: MediaQuery.of(context).size.width*3.5/100,
                                                          height: MediaQuery.of(context).size.width*3.5/100,
                                                          AppImage.editIcon
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width*3/100,),
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
                                                    decoration: BoxDecoration(
                                                      color: AppColor.mistyRoseColor,
                                                      borderRadius: BorderRadius.circular(4)
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(AppLanguage.removeText[language],
                                                          style: const TextStyle(
                                                            color: AppColor.darkRedColor,
                                                            fontFamily: AppFont.fontFamily,
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 10
                                                          ),
                                                        ),
                                                        SizedBox(width: MediaQuery.of(context).size.width*1/100,),
                                                        Image.asset(
                                                          width: MediaQuery.of(context).size.width*3.5/100,
                                                          height: MediaQuery.of(context).size.width*3.5/100,
                                                          AppImage.deleteIcon
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        if(salesmanList[index]["id"] != salesmanList.length)Divider(
                                          height: MediaQuery.of(context).size.height*2.5/100,
                                          color: AppColor.primaryColor.withOpacity(0.21)
                                        )
                                      ],
                                    ),
                                  );
                                })
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*12/100,),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.width*8/100,
                right: MediaQuery.of(context).size.width*6/100,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddSalesman()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*14/100,
                    height: MediaQuery.of(context).size.width*14/100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColor.blueColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.primaryColor.withOpacity(0.25),
                          blurRadius: 10,
                          offset: const Offset(0, 4)
                        )
                      ]
                    ),
                    child: Image.asset(AppImage.addIcon),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}