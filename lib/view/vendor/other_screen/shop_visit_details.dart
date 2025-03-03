import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';

class ShopVisitDetails extends StatefulWidget {
  static String routeName = "./ShopVisitDetails";
  const ShopVisitDetails({super.key, required this.shopName});

  final String shopName;

  @override
  State<ShopVisitDetails> createState() => _ShopVisitDetailsState();
}

class _ShopVisitDetailsState extends State<ShopVisitDetails> {
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
                      padding: const EdgeInsets.only(left: 18),
                      child: Image.asset(
                        width:
                            MediaQuery.of(context).size.shortestSide * 6 / 100,
                        height:
                            MediaQuery.of(context).size.shortestSide * 6 / 100,
                        AppImage.backIcon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(AppLanguage.shopVisitText[language],
                      style: const TextStyle(
                        color: AppColor.blueColor,
                        fontFamily: AppFont.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width * 6 / 100,
                    height: MediaQuery.of(context).size.width * 6 / 100,
                  ),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 3 / 100,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 90 / 100,
                    height: MediaQuery.of(context).size.width * 55 / 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("./assets/icons/shop_image1.png"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 1 / 100),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 90 / 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.shopName}",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 0.5 / 100,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 85 / 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rohit Gupta",
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontFamily: AppFont.fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 85 / 100,
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "123 Maplewood Lane Springfield, IL 62704 ",
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontFamily: AppFont.fontFamily,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            TextSpan(
                              text: "United States",
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontFamily: AppFont.fontFamily,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            )
                          ])),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 0.5 / 100,
                        ),
                        Text(
                          "+91-9584623623",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 2 / 100,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 90 / 100,
                          padding:
                              EdgeInsets.symmetric(vertical: 9, horizontal: 9),
                          decoration: BoxDecoration(
                              color: AppColor.grayColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "14/01/2025, 10:02 AM",
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontFamily: AppFont.fontFamily,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                              Text(
                                AppLanguage.remarkByText[language] +
                                    " Salesman",
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontFamily: AppFont.fontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              Text(
                                "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit ab est, atque saepe earum temporibus tempora. Perferendis expedita, id.",
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontFamily: AppFont.fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      1 /
                                      100),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    28 /
                                    100,
                                height: MediaQuery.of(context).size.width *
                                    28 /
                                    100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "./assets/icons/image_closed.png"),
                                      fit: BoxFit.cover),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
