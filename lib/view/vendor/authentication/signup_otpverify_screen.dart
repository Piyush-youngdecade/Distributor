import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../../utilities/app_button.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_footer.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';

class SignUpOtpVerify extends StatefulWidget {
  static String routeName = "./SignUpOtpVerify";
  const SignUpOtpVerify({super.key});

  @override
  State<SignUpOtpVerify> createState() => _SignUpOtpVerifyState();
}

class _SignUpOtpVerifyState extends State<SignUpOtpVerify> {
  TextEditingController mobileTextEditingController = TextEditingController();

  late Timer _timer;
  late int _secondsRemaining;
  bool resendText = true;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = 120;
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          resendText = false;
        }
      });
    });
  }

  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;
    final defaultPinTheme = PinTheme(
      width: MediaQuery.of(context).size.width * 12 / 100,
      height: MediaQuery.of(context).size.width * 12 / 100,
      // margin: const EdgeInsets.only(right: 5),
      textStyle: const TextStyle(
        fontSize: 23,
        fontFamily: AppFont.fontFamily,
        fontWeight: FontWeight.w600,
        color: AppColor.blueColor,
      ),
      decoration: BoxDecoration(
        color: AppColor.brightGrayColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColor.secondaryColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: AppColor.secondaryColor,
      statusBarIconBrightness: Brightness.dark)
    );
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        _timer.cancel();
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColor.secondaryColor,
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width*100/100,
              height: MediaQuery.of(context).size.height*100/100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImage.loginImage1),
                  fit: BoxFit.fill,
                )
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*10/100,),
                          Container(
                            width: MediaQuery.of(context).size.width*90/100,
                            alignment: Alignment.center,
                            child: Text(AppLanguage.otpVerificationText[language],
                              style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w800,
                                fontSize: 36,
                              ),
                            )
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 1 / 100,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width *90 /100,
                            child: Text(AppLanguage.otpVerificationDescriptionText[language],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: AppFont.fontFamily,
                                color: AppColor.textfilledColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height *5 /100),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 85 / 100,
                            child: Pinput(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              controller: pinController,
                              defaultPinTheme: defaultPinTheme,
                              autofocus: true,
                              length: 6,
                              hapticFeedbackType: HapticFeedbackType.lightImpact,
                              onCompleted: (pin) {},
                              onChanged: (value) {},
                              cursor: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 13),
                                    width: 15,
                                    height: 2,
                                    color: AppColor.themeColor,
                                  ),
                                ],
                              ),
                              submittedPinTheme: defaultPinTheme.copyWith(
                                decoration: defaultPinTheme.decoration!.copyWith(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: AppColor.themeColor,)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height *6 /100,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 86 / 100,
                            child: AppButton(
                              text: AppLanguage.verifyText[language],
                              onPress: () {
                                AppConstant.selectFooterIndex == 0;
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyFooterPage()));
                              }
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height *3.5 /100,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 90 / 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${AppLanguage.didNotRecieveText[language]} ",
                                  style: const TextStyle(
                                    fontFamily: AppFont.fontFamily,
                                    color: AppColor.textfilledColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                resendText == false
                              ? GestureDetector(
                                  onTap: () {
                                  },
                                  child: Text(AppLanguage.resendText[language],
                                    style: const TextStyle(
                                      color: AppColor.redColor,
                                      fontFamily: AppFont.fontFamily,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              : Text('$minutes:${seconds.toString().padLeft(2, '0')}',
                                  style: const TextStyle(
                                    color: AppColor.redColor,
                                    fontFamily: AppFont.fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 2 / 100,),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              _timer.cancel();
                            },
                            child: Text(AppLanguage.changeMobileNumberText[language],
                              style: const TextStyle(
                                fontFamily: AppFont.fontFamily,
                                decoration: TextDecoration.underline,
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*3/100,),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              _timer.cancel();
                            },
                            child: Text(AppLanguage.backText[language],
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColor.primaryColor,
                                color: AppColor.primaryColor,
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
