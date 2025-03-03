import 'package:flutter/material.dart';

import '../view/vendor/bottomnavigation/add_shop_screen.dart';
import '../view/vendor/bottomnavigation/attendance_screen.dart';
import '../view/vendor/bottomnavigation/home_screen.dart';
import '../view/vendor/bottomnavigation/profile_screen.dart';
import 'app_color.dart';
import 'app_constant.dart';
import 'app_font.dart';
import 'app_image.dart';
import 'app_language.dart';

class MyFooterPage extends StatefulWidget {
  const MyFooterPage({super.key});

  @override
  State<MyFooterPage> createState() => _MyFooterPageState();
}

class _MyFooterPageState extends State<MyFooterPage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: AppConstant.selectFooterIndex);
    
    setState(() {
      _selectedIndex = AppConstant.selectFooterIndex;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const <Widget>[Home(), Attendance(), AddShop(), Profile()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.secondaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 100,
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 5 / 100,
                  width: MediaQuery.of(context).size.width * 5 / 100,
                  //  color: Colors.amber,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        _selectedIndex == 0
                        ? AppImage.activeHomeIcon
                        : AppImage.deactiveHomeIcon
                      )
                    )
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5 / 100,
                ),
                Text(AppLanguage.homeText[language],
                  style: TextStyle(
                    fontFamily: AppFont.fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: _selectedIndex == 0
                    ? AppColor.blueColor
                    : AppColor.darkSilverColor,
                  ),
                ),
              ],
            ),
            label: "",
            backgroundColor: AppColor.secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 100,
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 5 / 100,
                  width: MediaQuery.of(context).size.width * 5 / 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(_selectedIndex == 1
                              ? AppImage.activeAttendanceIcon
                              : AppImage.deactiveAttendanceIcon))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5 / 100,
                ),
                Text(
                  AppLanguage.attendanceText[language],
                  style: TextStyle(
                    fontFamily: AppFont.fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: _selectedIndex == 1
                        ? AppColor.blueColor
                        : AppColor.darkSilverColor,
                  ),
                ),
              ],
            ),
            label: "",
            backgroundColor: AppColor.secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 100,
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 5 / 100,
                  width: MediaQuery.of(context).size.width * 5 / 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(_selectedIndex == 2
                              ? AppImage.activeAddShopIcon
                              : AppImage.deactiveAddShopIcon))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5 / 100,
                ),
                Text(
                  AppLanguage.addShopText[language],
                  style: TextStyle(
                    fontFamily: AppFont.fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: _selectedIndex == 2
                        ? AppColor.blueColor
                        : AppColor.darkSilverColor,
                  ),
                ),
              ],
            ),
            label: "",
            backgroundColor: AppColor.secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 100,
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 5 / 100,
                  width: MediaQuery.of(context).size.width * 5 / 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(_selectedIndex == 3
                              ? AppImage.activeProfileIcon
                              : AppImage.deactiveProfileIcon))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5 / 100,
                ),
                Text(
                  AppLanguage.profileText[language],
                  style: TextStyle(
                    fontFamily: AppFont.fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: _selectedIndex == 3
                        ? AppColor.blueColor
                        : AppColor.darkSilverColor,
                  ),
                ),
              ],
            ),
            label: "",
            backgroundColor: AppColor.secondaryColor,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        iconSize: 25,
        onTap: _onItemTapped,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        elevation: 5,
      ),
    );
  }
}
