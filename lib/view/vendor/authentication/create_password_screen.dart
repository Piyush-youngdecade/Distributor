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
import 'login_screen.dart';

class CreatePassword extends StatefulWidget {
  static String routeName = "./CreatePassword";
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {

  TextEditingController newPasswordTextEditingController = TextEditingController();
  TextEditingController confirmNewPasswordTextEditingController = TextEditingController();

  bool hideNewPassword = true;
  bool hideConfirmNewPassword = true;
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.secondaryColor,
      statusBarIconBrightness: Brightness.dark)
    );
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        goBackBottomSheet(context);
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: AppColor.secondaryColor,
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width*100/100,
              height: MediaQuery.of(context).size.height*100/100,
              color: AppColor.secondaryColor,
              child: Column(
                children: [
                  AppHeader(
                    text: AppLanguage.createPasswordText[language],
                    onPress: () {
                      goBackBottomSheet(context);
                    },
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*3/100,),
                          //-----------------------New Password------------------------
                          CustomPasswordFormField(
                            controller: newPasswordTextEditingController,
                            hintText: AppLanguage.newPasswordText[language],
                            prefixImage: AppImage.passwordIcon,
                            maxLength: AppConstant.passwordMaxLength,
                          ), 
                          SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                          //-----------------------Confirm New Password------------------------
                          CustomPasswordFormField(
                            controller: confirmNewPasswordTextEditingController,
                            hintText: AppLanguage.confirmNewPasswordText[language],
                            prefixImage: AppImage.passwordIcon,
                            maxLength: AppConstant.passwordMaxLength,
                          ), 
                          SizedBox(height: MediaQuery.of(context).size.height*8/100,),
                          AppButton(
                            text: AppLanguage.updateText[language],
                            onPress: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                            },
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),
            )
          ),
        ),
      ),
    );
  }

  void goBackBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      enableDrag: false,
      isDismissible: false,
      backgroundColor: AppColor.secondaryColor.withOpacity(0.1),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: ((context, setState) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 100 / 100,
                width: MediaQuery.of(context).size.width * 100 / 100,
                color: AppColor.primaryColor.withOpacity(0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height * 31 / 100,
                      width: MediaQuery.of(context).size.width * 85 / 100,
                      padding: const EdgeInsets.all(30),
                      // color: Colors.red,
                      decoration: const BoxDecoration(
                          color: AppColor.secondaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(AppLanguage.goBackText[language],
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                          Text(AppLanguage.areYouSureYouWantText[language],
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*3/100,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width *
                                      26 /
                                      100,
                                  height:
                                      MediaQuery.of(context).size.height *
                                          5 /
                                          100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: AppColor.themeColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(AppLanguage.noText[language],
                                    style: const TextStyle(
                                      color: AppColor.primaryColor,
                                      fontFamily: AppFont.fontFamily,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*2/100,),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width*26/100,
                                  height: MediaQuery.of(context).size.height*5/100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColor.themeColor
                                  ),
                                  child: Text(AppLanguage.yesText[language],
                                    style: const TextStyle(
                                      color: AppColor.secondaryColor,
                                      fontFamily: AppFont.fontFamily,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        );
      }
    );
  }
}