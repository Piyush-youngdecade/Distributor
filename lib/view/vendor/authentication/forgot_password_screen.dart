// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../../utilities/app_button.dart';
// import '../../utilities/app_color.dart';
// import '../../utilities/app_constant.dart';
// import '../../utilities/app_font.dart';
// import '../../utilities/app_image.dart';
// import '../../utilities/app_language.dart';
// import '../../utilities/textinput.dart';
// import 'otp_verify_screen.dart';

// class ForgotPassword extends StatefulWidget {
//   static String routeName = './ForgotPassword';

//   const ForgotPassword({super.key});

//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }

// class _ForgotPasswordState extends State<ForgotPassword> {

//   TextEditingController mobileTextEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: AppColor.culturedColor,
//       statusBarIconBrightness: Brightness.dark)
//     );
//     return GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: Scaffold(
//         backgroundColor: AppColor.culturedColor,
//         body: SafeArea(
//           child: Container(
//             width: MediaQuery.of(context).size.width*100/100,
//             height: MediaQuery.of(context).size.height*100/100,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(AppImage.loginBGImage),
//                 fit: BoxFit.fill
//               )
//             ),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: SingleChildScrollView(
//                     physics:  const NeverScrollableScrollPhysics(),
//                     child: Column(
//                       children: [
//                         SizedBox(height: MediaQuery.of(context).size.height*8/100,),
//                         Container(
//                           width: MediaQuery.of(context).size.width*100/100,
//                           height: MediaQuery.of(context).size.height*90/100,
//                           decoration: const BoxDecoration(
//                             color: AppColor.secondaryColor,
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(20),
//                               topRight: Radius.circular(20),
//                             )
//                           ),
//                           child: Column(
//                             children: [
//                               SizedBox(height: MediaQuery.of(context).size.height*4/100,),
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width*85/100,
//                                 child: Text(AppLanguage.forgotPasswordText[language],
//                                   style: const TextStyle(
//                                     color: AppColor.primaryColor,
//                                     fontFamily: AppFont.fontFamily,
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: 36
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: MediaQuery.of(context).size.height*4/100,),
//                               CustomTextFormField(
//                                 controller: mobileTextEditingController,
//                                 hintText: AppLanguage.mobileNumberText[language],
//                                 image: AppImage.phoneIcon,
//                                 keyboardtype: TextInputType.phone,
//                                 maxLength: AppConstant.mobileMaxLength,
//                                 readOnly: false,
//                               ),
//                               SizedBox(height: MediaQuery.of(context).size.height*8/100,),
//                               AppButton(
//                                 text: AppLanguage.sendText[language],
//                                 onPress: (){
//                                   Navigator.push(context, MaterialPageRoute(builder: (context) => const OTP()));
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
