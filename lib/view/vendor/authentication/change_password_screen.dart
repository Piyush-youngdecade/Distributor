import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utilities/app_color.dart';
import '../../../utilities/app_button.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_header.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';
import '../../../utilities/custom_input.dart';

class ChangePassword extends StatefulWidget {
  static String routeName = "./ChangePassowrd";
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController currentPasswordTextEditingController =
      TextEditingController();
  TextEditingController newPasswordTextEditingController =
      TextEditingController();
  TextEditingController confirmNewPasswordTextEditingController =
      TextEditingController();

  bool hideCurrentPassword = true;
  bool hideNewPassword = true;
  bool hideConfirmNewPassword = true;

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
          child: GestureDetector(
            onTap: ()=> FocusScope.of(context).unfocus(),
            child: Container(
                    width: MediaQuery.of(context).size.width * 100 / 100,
                    height: MediaQuery.of(context).size.height * 100 / 100,
                    color: AppColor.secondaryColor,
                    child: Column(
            children: [
              AppHeader(
                text: AppLanguage.changePasswordText[language],
                onPress: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 2 / 100,
                    ),
                    //-----------------------Current Password------------------------
                    Container(
                      width: MediaQuery.of(context).size.width * 85 / 100,
                      margin: EdgeInsets.symmetric(vertical: 9),
                      child: Text(
                        AppLanguage.currentPasswordText[language],
                        style: TextStyle(
                            color: AppColor.textfilledColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.fontFamily),
                      ),
                    ),
                    CustomPasswordFormField(
                      controller: currentPasswordTextEditingController,
                      hintText: AppLanguage.enterCurrentPasswordText[language],
                      prefixImage: AppImage.passwordIcon,
                      maxLength: AppConstant.passwordMaxLength,
                    ),
            
                    //-----------------------New Password------------------------
                    Container(
                      width: MediaQuery.of(context).size.width * 85 / 100,
                      margin: EdgeInsets.symmetric(vertical: 9),
                      child: Text(
                        AppLanguage.newPasswordText[language],
                        style: TextStyle(
                            color: AppColor.textfilledColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.fontFamily),
                      ),
                    ),
                    CustomPasswordFormField(
                      controller: newPasswordTextEditingController,
                      hintText: AppLanguage.enterNewPasswordText[language],
                      prefixImage: AppImage.passwordIcon,
                      maxLength: AppConstant.passwordMaxLength,
                    ),
            
                    //-----------------------Confirm New Password------------------------
                    Container(
                      width: MediaQuery.of(context).size.width * 85 / 100,
                      margin: EdgeInsets.symmetric(vertical: 9),
                      child: Text(
                        AppLanguage.confirmPasswordText[language],
                        style: TextStyle(
                            color: AppColor.textfilledColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.fontFamily),
                      ),
                    ),
                    CustomPasswordFormField(
                      controller: confirmNewPasswordTextEditingController,
                      hintText: AppLanguage.enterConfirmPasswordText[language],
                      prefixImage: AppImage.passwordIcon,
                      maxLength: AppConstant.passwordMaxLength,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 6 / 100,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 70 / 100,
                      child: AppButton(
                        text: AppLanguage.updateButtonText[language],
                        onPress: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ))
            ],
                    ),
                  ),
          )),
    );
  }
}
