import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_constant.dart';
import 'app_image.dart';
import 'app_language.dart';

// ignore: must_be_immutable
class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  // ignore: prefer_typing_uninitialized_variables

  const CustomSearchField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 90 / 100,
        height: MediaQuery.of(context).size.height * 6.5 / 100,
        decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: AppColor.primaryColor.withOpacity(0.25),
              blurRadius: 6,
              offset: const Offset(0, 4)
            )
          ]
        ),
        child: TextFormField(
          style: AppConstant.textFilledStyle,
          cursorColor: AppColor.themeColor,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.emailAddress,
          controller: controller,
          maxLength: AppConstant.emailMaxLength,
          decoration: InputDecoration(
            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(AppImage.searchGreyIcon,
                    height: MediaQuery.of(context).size.width * 5 / 100,
                    width: MediaQuery.of(context).size.width * 5 / 100,
                  ),
                ),
              ],
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.textfilledColor),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.textfilledColor),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.textfilledColor),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            counterText: '',
            hintText: AppLanguage.searchText[language],
            hintStyle: AppConstant.textFilledHeading,
          ),
        ),
      ),
    );
  }
}
