import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utilities/app_button.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_header.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';
import '../../../utilities/custom_input.dart';

class ContactUs extends StatefulWidget {
  static String routeName = "./ContactUs";
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController messageTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.secondaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColor.secondaryColor,
        statusBarIconBrightness: Brightness.dark));
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: SafeArea(
              child: Container(
                  width: MediaQuery.of(context).size.width * 100 / 100,
                  height: MediaQuery.of(context).size.height * 100 / 100,
                  color: AppColor.secondaryColor,
                  child: Column(children: [
                    AppHeader(
                        text: AppLanguage.contactUsText[language],
                        onPress: () {
                          Navigator.pop(context);
                        }),
                    Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      2 /
                                      100),
                              // -----------full name -------------
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    85 /
                                    100,
                                margin: EdgeInsets.symmetric(vertical: 7),
                                child: Text(
                                  AppLanguage.nameText[language],
                                  style: TextStyle(
                                      color: AppColor.textfilledColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppFont.fontFamily),
                                ),
                              ),
                              CustomTextFormField(
                                controller: fullNameTextEditingController,
                                hintText:
                                    AppLanguage.enterFullNameText[language],
                                image: AppImage.nameIcon,
                                keyboardtype: TextInputType.text,
                                maxLength: AppConstant.fullNameMaxLength,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    1 /
                                    100,
                              ),

                              // ----------- email Input -------------
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    85 /
                                    100,
                                margin: EdgeInsets.symmetric(vertical: 7),
                                child: Text(
                                  AppLanguage.emailText[language],
                                  style: TextStyle(
                                      color: AppColor.textfilledColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppFont.fontFamily),
                                ),
                              ),
                              CustomTextFormField(
                                controller: emailTextEditingController,
                                hintText: AppLanguage.enterEmailText[language],
                                image: AppImage.emailIcon,
                                keyboardtype: TextInputType.emailAddress,
                                maxLength: AppConstant.emailMaxLength,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    1 /
                                    100,
                              ),

                              // ----------- Message Input -------------
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    85 /
                                    100,
                                margin: EdgeInsets.symmetric(vertical: 7),
                                child: Text(
                                  AppLanguage.descriptionText[language],
                                  style: TextStyle(
                                      color: AppColor.textfilledColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppFont.fontFamily),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    85 /
                                    100,
                                child: TextFormField(
                                  style: AppConstant.textFilledStyle,
                                  cursorColor: AppColor.themeColor,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.text,
                                  controller: messageTextEditingController,
                                  maxLength: AppConstant.messageMaxLength,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColor.textfilledColor),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColor.textfilledColor),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColor.themeColor),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 9, horizontal: 15),
                                    counterText: '',
                                    hintText:
                                        AppLanguage.typemessageText[language],
                                    hintStyle: AppConstant.textFilledHeading,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      7 /
                                      100),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    70 /
                                    100,
                                child: AppButton(
                                    text: AppLanguage.sendButtonText[language],
                                    onPress: () {
                                      Navigator.pop(context);
                                    }),
                              ),
                            ],
                          ),
                        ))
                  ])))),
    );
  }
}
