import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utilities/app_button.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_header.dart';
import '../../../utilities/app_language.dart';
import '../../../utilities/custom_input.dart';

class AddSalesman extends StatefulWidget {
  static String routeName = "./AddSalesman";
  const AddSalesman({super.key});

  @override
  State<AddSalesman> createState() => _AddSalesmanState();
}

class _AddSalesmanState extends State<AddSalesman> {

  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController aadhaarTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();

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
            width: MediaQuery.of(context).size.width*100/100,
            height: MediaQuery.of(context).size.height*100/100,
            color: AppColor.secondaryColor,
            child: Column(
              children: [
                AppHeader(
                  text: AppLanguage.addSalesmanText[language],
                  onPress: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                        //--------------------Full Name-----------------
                        SizedBox(
                          width: MediaQuery.of(context).size.width*85/100,
                          child: Text(AppLanguage.fullNameText[language],
                            style: const TextStyle(
                              color: AppColor.darkSilverColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*1/100,),
                        CustomTextFormField(
                          controller: fullNameTextEditingController,
                          hintText: AppLanguage.enterFullNameText[language],
                          image: "",
                          keyboardtype: TextInputType.text,
                          maxLength: AppConstant.fullNameMaxLength,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                        //--------------------Email---------------
                        SizedBox(
                          width: MediaQuery.of(context).size.width*85/100,
                          child: Text(AppLanguage.emailText[language],
                            style: const TextStyle(
                              color: AppColor.darkSilverColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*1/100,),
                        CustomTextFormField(
                          controller: emailTextEditingController,
                          hintText: AppLanguage.enterEmailText[language],
                          image: "",
                          keyboardtype: TextInputType.emailAddress,
                          maxLength: AppConstant.emailMaxLength,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                        //----------------------Aadhar Card-----------------
                        SizedBox(
                          width: MediaQuery.of(context).size.width*85/100,
                          child: Text(AppLanguage.aadhaarCardText[language],
                            style: const TextStyle(
                              color: AppColor.darkSilverColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*1/100,),
                        CustomTextFormField(
                          controller: aadhaarTextEditingController,
                          hintText: AppLanguage.enterAadhaarCardText[language],
                          image: "",
                          keyboardtype: TextInputType.number,
                          maxLength: AppConstant.aadhaarMaxLength,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                        //----------------------Contact Number-----------------
                        SizedBox(
                          width: MediaQuery.of(context).size.width*85/100,
                          child: Text(AppLanguage.mobileNumberText[language],
                            style: const TextStyle(
                              color: AppColor.darkSilverColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*1/100,),
                        CustomTextFormField(
                          controller: phoneTextEditingController,
                          hintText: AppLanguage.enterMobileNumberText[language],
                          image: "",
                          keyboardtype: TextInputType.phone,
                          maxLength: AppConstant.mobileMaxLength,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*2/100,),
                        //------------------------Address-------------------
                        SizedBox(
                          width: MediaQuery.of(context).size.width*85/100,
                          child: Text(AppLanguage.addressText[language],
                            style: const TextStyle(
                              color: AppColor.darkSilverColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*1/100,),
                        CustomTextFormField(
                          controller: addressTextEditingController,
                          hintText: AppLanguage.enterFullAddressText[language],
                          image: "",
                          keyboardtype: TextInputType.text,
                          maxLength: AppConstant.addressMaxLength,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*8/100,),
                        AppButton(
                          text: AppLanguage.addSalesmanText[language],
                          onPress: () {
                            Navigator.pop(context);
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
    );
  }
}