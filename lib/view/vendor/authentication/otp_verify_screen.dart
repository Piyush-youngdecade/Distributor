import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../../utilities/app_button.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_language.dart';
import '../bottomnavigation/home_screen.dart';

class OTP extends StatefulWidget {
  static String routeName = "./OTP";
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
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
      width: MediaQuery.of(context).size.width * 20 / 100,
      height: MediaQuery.of(context).size.width * 12 / 100,
      margin: const EdgeInsets.only(right: 5),
      textStyle: const TextStyle(
        fontSize: 23,
        fontFamily: AppFont.fontFamily,
        fontWeight: FontWeight.w600,
        color: AppColor.primaryColor,
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
    return WillPopScope(
      onWillPop: () async{
        _timer.cancel();
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: AppColor.secondaryColor,
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width * 100 / 100,
              height: MediaQuery.of(context).size.height * 100 / 100,
              color: AppColor.secondaryColor,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*6/100,),
                          Text(AppLanguage.otpVerificationText[language],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w700,
                              fontSize: 32
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.5/100,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*85/100,
                            child: Text(AppLanguage.otpVerificationDescriptionText[language],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.primaryColor.withOpacity(0.4),
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*8/100,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 85 / 100,
                            child: Column(
                              children: [
                                Pinput(
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
                                        color: AppColor.primaryColor,
                                      ),
                                    ],
                                  ),
                                  submittedPinTheme: defaultPinTheme.copyWith(
                                    decoration: defaultPinTheme.decoration!
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*1.5/100,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 85 / 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                resendText == false
                                ? GestureDetector(
                                    onTap: () {
                                    },
                                    child: Text(AppLanguage.resendCodeText[language],
                                      style: const TextStyle(
                                        color: AppColor.redColor,
                                        fontFamily: AppFont.fontFamily,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                : Text(
                                    '$minutes:${seconds.toString().padLeft(2, '0')}',
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
                          SizedBox(height: MediaQuery.of(context).size.height*10/100,),
                          AppButton(
                            text: AppLanguage.verifyButtonText[language],
                            onPress: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                            },
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
                        ]
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
