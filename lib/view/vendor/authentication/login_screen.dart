import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utilities/app_button.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_footer.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';
import '../../../utilities/custom_input.dart';
import 'signup_screen.dart';

class Login extends StatefulWidget {
  static String routeName = "./Login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColor.secondaryColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: AppColor.secondaryColor,
      statusBarIconBrightness: Brightness.dark)
    );
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColor.secondaryColor,
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width * 100 / 100,
              height: MediaQuery.of(context).size.height * 100 / 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImage.loginImage1),
                  fit: BoxFit.fill,
                )
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*5/100,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*85/100,
                            child: Text(AppLanguage.signInText[language],
                              style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w800,
                                fontSize: 36,
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.5/100,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*85/100,
                            child: Text(AppLanguage.signInDescriptionText[language],
                              style: const TextStyle(
                                color: AppColor.darkSilverColor,
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*3/100,),
                          CustomTextFormField(
                            controller: phoneTextEditingController,
                            hintText: AppLanguage.mobileNumberInputText[language],
                            image: AppImage.phoneIcon,
                            keyboardtype: TextInputType.phone,
                            maxLength: AppConstant.mobileMaxLength,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                          CustomPasswordFormField(
                            controller: passwordTextEditingController,
                            hintText: AppLanguage.passwordInputText[language],
                            maxLength: AppConstant.passwordMaxLength,
                            prefixImage: AppImage.passwordIcon,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                          GestureDetector(
                            onTap: () {
                              
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width*85/100,
                              alignment: Alignment.centerRight,
                              child: Text(AppLanguage.forgotPasswordText[language],
                                style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontFamily: AppFont.fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*3/100,),
                          AppButton(
                            text: AppLanguage.signInText[language],
                            onPress: () {
                              AppConstant.selectFooterIndex = 0;
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyFooterPage()));
                            },
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*3/100,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${AppLanguage.doNotHaveAccountText[language]} ",
                                style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontFamily: AppFont.fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup()));
                                },
                                child: Text(AppLanguage.createAccountText[language],
                                  style: const TextStyle(
                                    color: AppColor.themeColor,
                                    fontFamily: AppFont.fontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            )
          ),
        ),
      ),
    );
  }
}
