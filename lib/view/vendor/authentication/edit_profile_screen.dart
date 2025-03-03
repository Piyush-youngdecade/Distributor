import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../../utilities/app_button.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_header.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';
import '../../../utilities/custom_input.dart';

class EditProfile extends StatefulWidget {
  static String routeName = "./EditProfile";
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController firstNameTextEditingController =
      TextEditingController(text: "Ruben");
  TextEditingController lastNameTextEditingController =
      TextEditingController(text: "Bator");
  TextEditingController mobileTextEditingController =
      TextEditingController(text: "8945671247");
  TextEditingController emailTextEditingController =
      TextEditingController(text: "rubenbator@gmail.com");
  String? selectedGender = 'Male';
  DateTime? selectedDate;
  final List<String> genders = ['Male', 'Female', 'Other'];
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColor.secondaryColor,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SafeArea(
          child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: MediaQuery.of(context).size.width * 100 / 100,
          height: MediaQuery.of(context).size.height * 100 / 100,
          color: AppColor.secondaryColor,
          child: Column(
            children: [
              AppHeader(
                text: AppLanguage.editProfileText[language],
                onPress: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 90 / 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColor.secondaryColor,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 25 / 100,
                            height:
                                MediaQuery.of(context).size.width * 25 / 100,
                            padding: const EdgeInsets.all(2),
                            alignment: Alignment.bottomRight,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2, color: AppColor.blueColor),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "./assets/icons/salesman_image3.png"),
                                    fit: BoxFit.cover)),
                            child: SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 6 / 100,
                              height:
                                  MediaQuery.of(context).size.width * 6 / 100,
                              // child: Image.asset(AppImage.aboutusIcon),
                            ),
                          ),
                          Text(
                            "Alex Braown",
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFont.fontFamily),
                          ),
                          Text(
                            AppLanguage.IDText[language] + "R4584623",
                            style: TextStyle(
                                color: AppColor.textfilledColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                fontFamily: AppFont.fontFamily),
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 2 / 100,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 85 / 100,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              AppLanguage.firstNameText[language],
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppFont.fontFamily),
                            ),
                          ),
                          CustomTextFormField(
                            controller: firstNameTextEditingController,
                            hintText: AppLanguage.firstNameText[language],
                            image: '',
                            keyboardtype: TextInputType.name,
                            maxLength: AppConstant.firstNameMaxLength,
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 1 / 100,
                          ),
                          //--------------------------Last Name---------------------
                          Container(
                            width: MediaQuery.of(context).size.width * 85 / 100,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              AppLanguage.lastNameText[language],
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppFont.fontFamily),
                            ),
                          ),
                          CustomTextFormField(
                            controller: lastNameTextEditingController,
                            hintText: AppLanguage.lastNameText[language],
                            image: '',
                            keyboardtype: TextInputType.text,
                            maxLength: AppConstant.lastNameMaxLength,
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 1 / 100,
                          ),

                          //------------------------Mobile Number---------------------
                          Container(
                            width: MediaQuery.of(context).size.width * 85 / 100,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              AppLanguage.phoneNumberText[language],
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppFont.fontFamily),
                            ),
                          ),
                          CustomTextFormField(
                            controller: mobileTextEditingController,
                            hintText: AppLanguage.mobileNumberText[language],
                            image: '',
                            keyboardtype: TextInputType.phone,
                            maxLength: AppConstant.mobileMaxLength,
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 1 / 100,
                          ),

                          //------------------- Date Picker -----------------
                          Container(
                            width: MediaQuery.of(context).size.width * 85 / 100,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              AppLanguage.dateOfBirthText[language],
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppFont.fontFamily),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 85 / 100,
                            height:
                                MediaQuery.of(context).size.height * 6 / 100,
                            child: TextFormField(
                              style: AppConstant.textFilledStyle,
                              textAlignVertical: TextAlignVertical.center,
                              readOnly: true,
                              onTap: () => _selectDate(context),
                              decoration: InputDecoration(
                                suffixIcon: Image.asset(
                                  AppImage.calendarIcon,
                                  scale: 3.5,
                                ),
                                hintText: selectedDate != null
                                    ? DateFormat('dd-MM-yyyy')
                                        .format(selectedDate!)
                                    : 'Select Date',
                                hintStyle: AppConstant.textFilledStyle,
                                border: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.primaryColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.primaryColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.primaryColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 1 / 100),

                          //--------------------gender------------
                          Container(
                            width: MediaQuery.of(context).size.width * 85 / 100,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              AppLanguage.genderText[language],
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppFont.fontFamily),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 85 / 100,
                            height:
                                MediaQuery.of(context).size.height * 6 / 100,
                            child: _buildDropdown(
                              'Gender',
                              selectedGender,
                              genders,
                              AppImage.privacyPolicyIcon,
                              (value) => setState(() => selectedGender = value),
                            ),
                          ),

                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 4 / 100,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 70 / 100,
                            child: AppButton(
                              text: AppLanguage.updateText[language],
                              onPress: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 3 / 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items,
      String imagePath, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true, // Reduces internal padding
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        hintText: value,
        hintStyle: AppConstant.textFilledHeading,
      ),
      style: AppConstant.textFilledStyle,
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
    );
  }
}
