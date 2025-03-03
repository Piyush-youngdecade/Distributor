import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utilities/app_button.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_header.dart';
import '../../../utilities/app_language.dart';
import 'login_screen.dart';

class DeleteAccount extends StatefulWidget {
  static String routeName = "./DeleteAccount";
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {

  TextEditingController deleteTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColor.secondaryColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: AppColor.secondaryColor,
      statusBarIconBrightness: Brightness.dark)
    );
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.secondaryColor,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 100 / 100,
            width: MediaQuery.of(context).size.width * 100 / 100,
            color: AppColor.secondaryColor,
            child: Column(
              children: [
                AppHeader(
                  text: AppLanguage.deleteAccountText[language],
                  onPress: () {
                    Navigator.pop(context);
                  }
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 2 / 100),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 90 / 100,
                          child: Text(AppLanguage.deleteReasonText[language],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: AppFont.fontFamily,
                              color: AppColor.primaryColor,
                              fontSize: 12,
                            )
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 3 / 100),
                        //----------- Message Input -------------
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 90 / 100,
                          child: TextFormField(
                            style: AppConstant.textFilledStyle,
                            keyboardType: TextInputType.multiline,
                            controller: deleteTextEditingController,
                            maxLines: 6,
                            maxLength: AppConstant.messageMaxLength,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.textfilledColor),
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.textfilledColor),
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.themeColor),
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                              counterText: '',
                              hintText: AppLanguage.reasonText[language],
                              hintStyle: AppConstant.textFilledHeading
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 4 / 100,
                        ),
                        AppButton(
                          text: AppLanguage.submitButtonText[language],
                          onPress: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            )
          )
        )
      )
    );
  }
}
