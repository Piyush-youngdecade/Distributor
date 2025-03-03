import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_header.dart';
import '../../../utilities/app_language.dart';
import '../../../utilities/custom_search.dart';
import 'shop_visit_details.dart';

class ShopVisit extends StatefulWidget {
  static String routeName = './ShopVisit';
  const ShopVisit({super.key, required this.shopName});

  final String shopName;

  @override
  State<ShopVisit> createState() => _ShopVisitState();
}

class _ShopVisitState extends State<ShopVisit> {
  int selectedIndex = 1;
  List sortByList = [
    {"id": 1, "selection": AppLanguage.nameText[language]},
    {"id": 2, "selection": AppLanguage.locationText[language]},
    {
      "id": 3,
      "selection": AppLanguage.landmarkText[language],
    }
  ];

  List shopVisitList = [
    {
      "id": 1,
      "shopName": "Baker's Delight",
      "descriptions":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit",
      "status": "Visited",
      "date": "Fri, 31-Jan-2025"
    },
    {
      "id": 2,
      "shopName": "City Mart",
      "descriptions":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit",
      "status": "Visited",
      "date": "Fri, 31-Jan-2025"
    },
    {
      "id": 3,
      "shopName": "Fresh Farm Market",
      "descriptions":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit",
      "status": "Visited",
      "date": "Fri, 31-Jan-2025"
    },
    {
      "id": 4,
      "shopName": "Gourmet Hub",
      "descriptions":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit",
      "status": "Closed",
      "date": "Fri, 31-Jan-2025"
    },
    {
      "id": 5,
      "shopName": "Daily Needs Store",
      "descriptions":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit",
      "status": "Visited",
      "date": "Fri, 31-Jan-2025"
    },
    {
      "id": 6,
      "shopName": "Spice Bazaar",
      "descriptions":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit",
      "status": "Closed",
      "date": "Fri, 31-Jan-2025"
    },
    {
      "id": 7,
      "shopName": "Organic Treats",
      "descriptions":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit",
      "status": "Visited",
      "date": "Fri, 31-Jan-2025"
    }
  ];

  TextEditingController searchTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColor.secondaryColor,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: AppColor.secondaryColor,
          width: MediaQuery.of(context).size.width * 100 / 100,
          height: MediaQuery.of(context).size.height * 100 / 100,
          child: Column(
            children: [
              AppHeader(
                text: AppLanguage.shopVisitText[language],
                onPress: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 1 / 100),
              SizedBox(
                width: MediaQuery.of(context).size.width * 90 / 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLanguage.searchByText[language],
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppFont.fontFamily),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          children: List.generate(sortByList.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = sortByList[index]['id'];
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        3.5 /
                                        100,
                                    height: MediaQuery.of(context).size.width *
                                        3.5 /
                                        100,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: AppColor.grayColor)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              2 /
                                              100,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              2 /
                                              100,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: selectedIndex ==
                                                      sortByList[index]['id']
                                                  ? AppColor.themeColor
                                                  : AppColor.secondaryColor),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          1 /
                                          100),
                                  Text(
                                    sortByList[index]['selection'],
                                    style: TextStyle(
                                        color: selectedIndex ==
                                                sortByList[index]['id']
                                            ? AppColor.primaryColor
                                            : AppColor.textfilledColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: AppFont.fontFamily),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          2 /
                                          100),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
           
              SizedBox(height: MediaQuery.of(context).size.height * 2 / 100),
        
              CustomSearchField(
                controller: searchTextEditingController,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 3 / 100),
              Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Wrap(
                          runSpacing: 15.0,
                          children:
                              List.generate(shopVisitList.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShopVisitDetails(
                                              shopName: shopVisitList[index]
                                                  ['shopName'],
                                            )));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    100 /
                                    100,
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          90 /
                                          100,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 9),
                                      decoration: BoxDecoration(
                                          color: AppColor.secondaryColor,
                                          border: Border.all(
                                              color: AppColor.grayColor,
                                              width: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColor.shadowColor,
                                                spreadRadius: 0,
                                                blurRadius: 12,
                                                offset: Offset(3, 3))
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                57 /
                                                100,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  shopVisitList[index]
                                                      ['shopName'],
                                                  style: TextStyle(
                                                      color:
                                                          AppColor.primaryColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          AppFont.fontFamily),
                                                ),
                                                Text(
                                                  shopVisitList[index]
                                                      ['descriptions'],
                                                  style: TextStyle(
                                                      color: AppColor
                                                          .darkSilverColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          AppFont.fontFamily),
                                                ),
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1 /
                                                            100),
                                                GestureDetector(
                                                  onTap: () {
                                                    shopVisitList[index]
                                                                ['status'] ==
                                                            "Visited"
                                                        ? visitedPopUp(context)
                                                        : closedPopUp(context);
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            30 /
                                                            100,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5),
                                                    decoration: BoxDecoration(
                                                        color: shopVisitList[
                                                                        index][
                                                                    'status'] ==
                                                                "Visited"
                                                            ? AppColor
                                                                .greenColor
                                                                .withOpacity(
                                                                    0.20)
                                                            : AppColor
                                                                .redLightColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Text(
                                                      shopVisitList[index]
                                                          ['status'],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: shopVisitList[
                                                                          index]
                                                                      [
                                                                      'status'] ==
                                                                  "Visited"
                                                              ? AppColor
                                                                  .greenColor
                                                              : AppColor
                                                                  .darkRedColor,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: AppFont
                                                              .fontFamily),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    20 /
                                                    100,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    20 /
                                                    100,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "./assets/icons/indore.png"),
                                                        fit: BoxFit.cover)),
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      2 /
                                                      100),
                                              Text(
                                                shopVisitList[index]['date'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: AppColor
                                                        .darkSilverColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily:
                                                        AppFont.fontFamily),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 1 / 100)
                      ],
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }

  // visited
  void visitedPopUp(BuildContext context) {
    showModalBottomSheet(
        context: context,
        enableDrag: false,
        isScrollControlled: true,
        backgroundColor: AppColor.secondaryColor.withOpacity(0.1),
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 100 / 100,
                height: MediaQuery.of(context).size.height * 100 / 100,
                color: AppColor.secondaryColor.withOpacity(0.25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 80 / 100,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 9),
                      decoration: BoxDecoration(
                          color: AppColor.secondaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Text(
                            AppLanguage.visitedText[language],
                            style: TextStyle(
                                color: AppColor.greenColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFont.fontFamily),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 1 / 100),
                          Text(
                            "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit ab est, atque saepe earum temporibus tempora. Perferendis expedita, id modi praesentium vel vitae rerum esse, blanditiis perspiciatis quos ipsam!",
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.fontFamily),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  // closed
  void closedPopUp(BuildContext context) {
    showModalBottomSheet(
        context: context,
        enableDrag: false,
        isScrollControlled: true,
        backgroundColor: AppColor.secondaryColor.withOpacity(0.1),
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 100 / 100,
                height: MediaQuery.of(context).size.height * 100 / 100,
                color: AppColor.secondaryColor.withOpacity(0.25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 80 / 100,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 9),
                      decoration: BoxDecoration(
                          color: AppColor.secondaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Text(
                            AppLanguage.closedText[language],
                            style: TextStyle(
                                color: AppColor.darkRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFont.fontFamily),
                          ),
                          Text(
                            "Lorem, ipsum dolor sit amet consect adipisicing elit. Accusantium reprehenderit ab est, atque saepe temporibus tempora. Perferendis expedita, id modi praesentium",
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFont.fontFamily),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 1 / 100),
                          Container(
                            width: MediaQuery.of(context).size.width * 75 / 100,
                            height:
                                MediaQuery.of(context).size.height * 20 / 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "./assets/icons/image_closed.png"),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }
}
