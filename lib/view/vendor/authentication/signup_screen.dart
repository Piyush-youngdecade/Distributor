import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utilities/app_button.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';
import '../../../utilities/custom_input.dart';
import '../content_screen/content_screen.dart';
import 'login_screen.dart';
import 'signup_otpverify_screen.dart';

class Signup extends StatefulWidget {
  static String routeName = "./Signup";
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController businessNameTextEditingController = TextEditingController();
  TextEditingController firstNameTextEditingController = TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController = TextEditingController();

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
                  image: AssetImage(AppImage.loginImage),
                  fit: BoxFit.fill,
                )
              ),
              child: Padding(
                padding: MediaQuery.of(context).viewInsets,
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
                              child: Text(AppLanguage.createAccountText[language],
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
                              child: Text(AppLanguage.createAccountDescriptionText[language],
                                style: const TextStyle(
                                  color: AppColor.darkSilverColor,
                                  fontFamily: AppFont.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*3/100,),
                            //------------------Business Name---------------
                            CustomTextFormField(
                              controller: businessNameTextEditingController,
                              hintText: AppLanguage.businessNameText[language],
                              image: AppImage.businessNameIcon,
                              keyboardtype: TextInputType.text,
                              maxLength: AppConstant.businessNameMaxLength,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                            //------------------First Name---------------
                            CustomTextFormField(
                              controller: firstNameTextEditingController,
                              hintText: AppLanguage.firstNameText[language],
                              image: AppImage.nameIcon,
                              keyboardtype: TextInputType.name,
                              maxLength: AppConstant.firstNameMaxLength,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                            //------------------Last Name---------------
                            CustomTextFormField(
                              controller: lastNameTextEditingController,
                              hintText: AppLanguage.lastNameText[language],
                              image: AppImage.nameIcon,
                              keyboardtype: TextInputType.name,
                              maxLength: AppConstant.lastNameMaxLength,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                            //------------------Mobile Number---------------
                            CustomTextFormField(
                              controller: phoneTextEditingController,
                              hintText: AppLanguage.mobileNumberInputText[language],
                              image: AppImage.phoneIcon,
                              keyboardtype: TextInputType.phone,
                              maxLength: AppConstant.mobileMaxLength,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                            //---------------------Email------------------
                            CustomTextFormField(
                              controller: emailTextEditingController,
                              hintText: AppLanguage.emailText[language],
                              image: AppImage.emailIcon,
                              keyboardtype: TextInputType.emailAddress,
                              maxLength: AppConstant.emailMaxLength,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                            //--------------------Password------------------
                            CustomPasswordFormField(
                              controller: passwordTextEditingController,
                              hintText: AppLanguage.passwordInputText[language],
                              maxLength: AppConstant.passwordMaxLength,
                              prefixImage: AppImage.passwordIcon,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                            //--------------------Confirm Password------------------
                            CustomPasswordFormField(
                              controller: confirmPasswordTextEditingController,
                              hintText: AppLanguage.confirmPasswordText[language],
                              maxLength: AppConstant.passwordMaxLength,
                              prefixImage: AppImage.passwordIcon,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*3/100,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*85/100,
                              child: Text.rich(
                                textAlign: TextAlign.center,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "  ${AppLanguage.bySigningUpYouText[language]} ",
                                      style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontFamily: AppFont.fontFamily,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                      ),
                                    ),
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushNamed(
                                            context, Content.routeName,
                                            arguments: ContentClass(
                                                header: AppLanguage.termsAndConditionText[language],
                                                contenttype: "")
                                            );
                                        },
                                      text: AppLanguage.termsAndConditionText[language],
                                      style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: AppColor.themeColor,
                                        fontFamily: AppFont.fontFamily,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14
                                      ),
                                    ),
                                    TextSpan(
                                      text: " ${AppLanguage.andText[language]} ",
                                      style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontFamily: AppFont.fontFamily,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                      ),
                                    ),
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushNamed(
                                            context, Content.routeName,
                                            arguments: ContentClass(
                                                header: AppLanguage.privacyPolicyText[language],
                                                contenttype: "")
                                            );
                                        },
                                      text: AppLanguage.privacyPolicyText[language],
                                      style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: AppColor.themeColor,
                                        fontFamily: AppFont.fontFamily,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14
                                      ),
                                    )
                                  ]
                                )
                              )
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*3/100,),
                            AppButton(
                              text: AppLanguage.createAccountText[language],
                              onPress: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpOtpVerify()));
                              },
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*3/100,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${AppLanguage.alreadyHaveAccountText[language]} ",
                                  style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontFamily: AppFont.fontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                                  },
                                  child: Text(AppLanguage.signInText[language],
                                    style: const TextStyle(
                                      color: AppColor.themeColor,
                                      fontFamily: AppFont.fontFamily,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*1/100,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            )
          ),
        ),
      ),
    );
  }
}
