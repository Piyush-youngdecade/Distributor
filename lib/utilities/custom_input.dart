import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_constant.dart';
import 'app_image.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLength;
  final String image;
  // ignore: prefer_typing_uninitialized_variables
  var keyboardtype;

  CustomTextFormField(
    {super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardtype,
    required this.image,
    required this.maxLength,}
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 85 / 100,
        height: MediaQuery.of(context).size.height * 6.5 / 100,
        child: TextFormField(
          style: AppConstant.textFilledStyle,
          cursorColor: AppColor.themeColor,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: keyboardtype,
          controller: controller,
          maxLength: maxLength,
          decoration: InputDecoration(
            prefixIconConstraints: image.isNotEmpty 
            ? const BoxConstraints(minWidth: 48)
            : const BoxConstraints(minWidth: 15),
            prefixIcon: image.isNotEmpty ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(image,
                    height: MediaQuery.of(context).size.width * 5 / 100,
                    width: MediaQuery.of(context).size.width * 5 / 100,
                  ),
                ),
              ],
            )
            : const Column(),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.textfilledColor),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.textfilledColor),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.themeColor),
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            counterText: '',
            hintText: hintText,
            hintStyle: AppConstant.textFilledHeading,
          ),
        ),
      
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomPasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String prefixImage;
  final int maxLength;

  const CustomPasswordFormField(
    {super.key,
    required this.controller,
    required this.hintText,
    required this.prefixImage,
    required this.maxLength,}
  );

  @override
  State<CustomPasswordFormField> createState() => _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool isPasswordhidden = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 85 / 100,
        height: MediaQuery.of(context).size.height * 6.5 / 100,
        child: TextFormField(
          obscureText: isPasswordhidden,
          obscuringCharacter: "*",
          cursorColor: AppColor.themeColor,
          style: AppConstant.textFilledStyle,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.text,
          controller: widget.controller,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                    widget.prefixImage,
                    height: MediaQuery.of(context).size.width * 5 / 100,
                    width: MediaQuery.of(context).size.width * 5 / 100,
                  ),
                ),
              ],
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordhidden = !isPasswordhidden;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(isPasswordhidden 
                      ? AppImage.activeEyeIcon
                      : AppImage.activeEyeIcon,
                      height: MediaQuery.of(context).size.width * 5 / 100,
                      width: MediaQuery.of(context).size.width * 5 / 100,
                    ),
                  ),
                ],
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.textfilledColor),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.textfilledColor),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.themeColor),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            counterText: '',
            hintText: widget.hintText,
            hintStyle: AppConstant.textFilledHeading,
          ),
        ),
      ),
    );
  }
}