import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';
import '../authentication/change_password_screen.dart';
import '../authentication/contact_us_screen.dart';
import '../authentication/delete_account_screen.dart';
import '../authentication/edit_profile_screen.dart';
import '../authentication/login_screen.dart';
import '../content_screen/content_screen.dart';
import '../other_screen/faq_screen.dart';

class Profile extends StatefulWidget {
  static String routeName = "./Profile";
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.secondaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColor.secondaryColor,
        statusBarIconBrightness: Brightness.dark));
    return PopScope(
      canPop: false,
      child: Scaffold(
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
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 3 / 100,
                    horizontal: MediaQuery.of(context).size.width * 2 / 100),
                decoration: BoxDecoration(
                    color: AppColor.themeColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLanguage.profileText[language],
                      style: TextStyle(
                          color: AppColor.secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFont.fontFamily),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 1 / 100),
                    Container(
                      width: MediaQuery.of(context).size.width * 24 / 100,
                      height: MediaQuery.of(context).size.width * 24 / 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColor.secondaryColor,
                              width: MediaQuery.of(context).size.width *
                                  0.7 /
                                  100),
                          image: DecorationImage(
                              image: AssetImage(
                                  "./assets/icons/salesman_image1.png"),
                              fit: BoxFit.cover)),
                    ),
                    Text(
                      "Alex Braown",
                      style: TextStyle(
                          color: AppColor.secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFont.fontFamily),
                    ),
                    Text(
                      AppLanguage.IDText[language] + "R4584623",
                      style: TextStyle(
                          color: AppColor.secondaryColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFont.fontFamily),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 3 / 100),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 90 / 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLanguage.accountText[language],
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFont.fontFamily),
                          ),
                          Divider(
                            color: AppColor.grayColor,
                          ),
                          SettingRow(
                              title: AppLanguage.editProfileText[language],
                              leadingIcon: AppImage.nameIcon,
                              onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EditProfile()));
                              }),
                          SettingRow(
                              title: AppLanguage.changePasswordText[language],
                              leadingIcon: AppImage.passwordIcon,
                              onPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ChangePassword()));
                              }),
                          SettingRow(
                              title: AppLanguage.contactUsText[language],
                              leadingIcon: AppImage.contactUsIcon,
                              onPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ContactUs()));
                              }),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 2 / 100),
                          Text(
                            AppLanguage.othersText[language],
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFont.fontFamily),
                          ),
                          Divider(
                            color: AppColor.grayColor,
                          ),
                          SettingRow(
                              title: AppLanguage.privacyPolicyText[language],
                              leadingIcon: AppImage.privacyPolicyIcon,
                              onPress: () {
                                Navigator.pushNamed(context, Content.routeName,
                                    arguments: ContentClass(
                                        header: AppLanguage
                                            .privacyPolicyText[language],
                                        contenttype: ""));
                              }),
                          SettingRow(
                              title:
                                  AppLanguage.termsAndConditionText[language],
                              leadingIcon: AppImage.termsAndConditionsIcon,
                              onPress: () {
                                Navigator.pushNamed(context, Content.routeName,
                                    arguments: ContentClass(
                                        header: AppLanguage
                                            .termsAndConditionText[language],
                                        contenttype: ""));
                              }),
                          SettingRow(
                              title: AppLanguage.faqText[language],
                              leadingIcon: AppImage.faqsIcon,
                              onPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const FAQ()));
                              }),
                          SettingRow(
                              title: AppLanguage.aboutUsText[language],
                              leadingIcon: AppImage.aboutusIcon,
                              onPress: () {
                                Navigator.pushNamed(context, Content.routeName,
                                    arguments: ContentClass(
                                        header:
                                            AppLanguage.aboutUsText[language],
                                        contenttype: ""));
                              }),
                          SettingRow(
                              title: AppLanguage.deleteAccountText[language],
                              leadingIcon: AppImage.deleteAccountIcon,
                              onPress: () {
                                deleteAccountPopUp(context);
                              }),
                          SettingRow(
                              title: AppLanguage.logOutText[language],
                              leadingIcon: AppImage.logoutIcon,
                              onPress: () {
                                logOutPopUp(context);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        )),
      ),
    );
  }

  void deleteAccountPopUp(BuildContext context) {
    showModalBottomSheet(
        context: context,
        enableDrag: false,
        isScrollControlled: true,
        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              width: MediaQuery.of(context).size.width * 100 / 100,
              height: MediaQuery.of(context).size.height * 100 / 100,
              color: AppColor.primaryColor.withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 80 / 100,
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 15),
                    decoration: BoxDecoration(
                        color: AppColor.secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 12 / 100,
                          width: MediaQuery.of(context).size.width * 12 / 100,
                          child: Image.asset(AppImage.confirmDeleteIcon),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 2 / 100,
                        ),
                        Text(
                          AppLanguage.confirmDeleteText[language],
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 1 / 100,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 70 / 100,
                          child: Text(
                            AppLanguage
                                .areYouSureDeleteYourAccountText[language],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.primaryColor.withOpacity(0.6),
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 3 / 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    32 /
                                    100,
                                height: MediaQuery.of(context).size.height *
                                    5 /
                                    100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColor.grayColor),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Text(
                                  AppLanguage.cancelText[language],
                                  style: const TextStyle(
                                      color: AppColor.primaryColor,
                                      fontFamily: AppFont.fontFamily,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 4 / 100,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DeleteAccount()));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    32 /
                                    100,
                                height: MediaQuery.of(context).size.height *
                                    5 /
                                    100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColor.themeColor,
                                    borderRadius: BorderRadius.circular(7)),
                                child: Text(
                                  AppLanguage.deleteText[language],
                                  style: const TextStyle(
                                      color: AppColor.secondaryColor,
                                      fontFamily: AppFont.fontFamily,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  void logOutPopUp(BuildContext context) {
    showModalBottomSheet(
        context: context,
        enableDrag: false,
        isScrollControlled: true,
        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 100 / 100,
                height: MediaQuery.of(context).size.height * 100 / 100,
                color: AppColor.primaryColor.withOpacity(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 70 / 100,
                      decoration: BoxDecoration(
                          color: AppColor.secondaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 2 / 100,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 60 / 100,
                            child: Text(
                              AppLanguage.sureLogoutText[language],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.primaryColor.withOpacity(0.6),
                                  fontFamily: AppFont.fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 3 / 100,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      35 /
                                      100,
                                  height: MediaQuery.of(context).size.height *
                                      7 /
                                      100,
                                  padding: const EdgeInsets.only(bottom: 10),
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: AppColor.grayColor),
                                          right: BorderSide(
                                              color: AppColor.grayColor))),
                                  child: Text(
                                    AppLanguage.cancelText[language],
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontFamily: AppFont.fontFamily,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      35 /
                                      100,
                                  height: MediaQuery.of(context).size.height *
                                      7 /
                                      100,
                                  padding: const EdgeInsets.only(bottom: 10),
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                    top: BorderSide(color: AppColor.grayColor),
                                  )),
                                  child: Text(
                                    AppLanguage.logOutText[language],
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontFamily: AppFont.fontFamily,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
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
          });
        });
  }


}

class SettingRow extends StatelessWidget {
  final String title;
  final String leadingIcon;
  final Function onPress;

  const SettingRow({
    Key? key,
    required this.title,
    required this.leadingIcon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        width: MediaQuery.of(context).size.width * 90 / 100,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 5 / 100,
              height: MediaQuery.of(context).size.width * 5 / 100,
              alignment: Alignment.center,
              child: Image.asset(
                leadingIcon,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 72 / 100,
              child: Text(
                title,
                style: TextStyle(
                  color: AppColor.textfilledColor,
                  fontFamily: AppFont.fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 5 / 100,
              height: MediaQuery.of(context).size.width * 5 / 100,
              alignment: Alignment.center,
              child: Image.asset(
                AppImage.rightArrowGrayIcon,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
