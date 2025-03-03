import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';

class ShopDetails extends StatefulWidget {
  static String routeName = "./ShopDetails";
  const ShopDetails({super.key, required this.shopName});

  final String shopName;

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
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
                  Text(AppLanguage.shopDetailsText[language],
                      style: const TextStyle(
                        color: AppColor.blueColor,
                        fontFamily: AppFont.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      )),
                  Text(AppLanguage.editText[language],
                      style: const TextStyle(
                        color: AppColor.blueColor,
                        fontFamily: AppFont.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
