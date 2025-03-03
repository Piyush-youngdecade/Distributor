import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_header.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';

class FAQ extends StatefulWidget {
  static String routeName = "./FAQ";
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  int faqIndex = 0;

  List<dynamic> faqList = [
    {
      "id": 0,
      "title": "How can I place or process an order?",
      "text":
          "To place an order, log in to the app, select products, specify quantities, and add delivery details like the address and schedule. Confirm the order by clicking 'Place Order.' For processing, review orders, update their status, and arrange delivery efficiently.",
      "isOpen": true
    },
    {
      "id": 1,
      "title": "What features does the app offer?",
      "text":
          "The app provides order management, real-time inventory tracking, delivery scheduling, payment processing, and sales analytics to streamline distribution operations.",
      "isOpen": false
    },
    {
      "id": 2,
      "title": "How do I track my inventory using the app?",
      "text":
          "Go to the 'Inventory' section to view stock levels, add new stock, and receive alerts when items are running low. The app helps in managing stock efficiently.",
      "isOpen": false
    },
    {
      "id": 3,
      "title": "Can I manage multiple warehouses with the app?",
      "text":
          "Yes, the app allows you to add and manage multiple warehouses. You can track stock movement between locations and optimize storage.",
      "isOpen": false
    },
    {
      "id": 4,
      "title": "How do I generate invoices for orders?",
      "text":
          "Once an order is confirmed, navigate to the 'Invoices' section, select the order, and generate an invoice. You can download or share it directly with customers.",
      "isOpen": false
    },
    {
      "id": 5,
      "title": "Does the app support online payments?",
      "text":
          "Yes, the app integrates with multiple payment gateways, allowing customers to pay via credit/debit cards, UPI, and other digital payment methods.",
      "isOpen": false
    },
    {
      "id": 6,
      "title": "How do I add new customers to my distribution network?",
      "text":
          "Go to the 'Customers' section and click 'Add Customer.' Enter their details, set payment terms, and start processing orders for them.",
      "isOpen": false
    }
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.secondaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColor.secondaryColor,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width * 100 / 100,
        height: MediaQuery.of(context).size.height * 100 / 100,
        color: AppColor.secondaryColor,
        child: Column(
          children: [
            AppHeader(
                text: AppLanguage.faqText[language],
                onPress: () {
                  Navigator.pop(context);
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 100,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 1 / 100),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 90 / 100,
                    child: Text(
                      AppLanguage.frequentlyAskedQuestionsText[language],
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontFamily: AppFont.fontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 1 / 100),
                  Wrap(
                    children: List.generate(faqList.length, (index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                faqList[index]["isOpen"] =
                                    !faqList[index]["isOpen"];
                              });
                            },
                            child: Container(
                              width:
                                  MediaQuery.of(context).size.width * 90 / 100,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: AppColor.secondaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColor.primaryColor
                                            .withOpacity(0.25),
                                        blurRadius: 4,
                                        offset: const Offset(0, 4))
                                  ]),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                75 /
                                                100,
                                        child: Text(
                                          faqList[index]["title"],
                                          style: const TextStyle(
                                              color: AppColor.primaryColor,
                                              fontFamily: AppFont.fontFamily,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                4 /
                                                100,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                4 /
                                                100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: faqList[index]["isOpen"]
                                                    ? const AssetImage(AppImage
                                                        .rightArrowGrayIcon)
                                                    : const AssetImage(AppImage
                                                        .rightArrowGrayIcon))),
                                      ),
                                    ],
                                  ),
                                  if (faqList[index]["isOpen"]) ...[
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1 /
                                              100,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          82 /
                                          100,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: AppColor.waterColor
                                              .withOpacity(0.42),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        faqList[index]["text"],
                                        style: const TextStyle(
                                            color: AppColor.primaryColor,
                                            fontFamily: AppFont.fontFamily,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ]
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 3 / 100,
                          ),
                        ],
                      );
                    }),
                  )
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
