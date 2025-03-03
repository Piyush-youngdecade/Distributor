import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/app_font.dart';
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_image.dart';
import '../../../utilities/app_language.dart';

class SalesmanAttendance extends StatefulWidget {
  static String routeName = "./SalesmanAttendance";
  const SalesmanAttendance({super.key, required this.image});

  final dynamic image;

  @override
  State<SalesmanAttendance> createState() => _SalesmanAttendanceState();
}

class _SalesmanAttendanceState extends State<SalesmanAttendance> {
  List<dynamic> attendanceList = [
    {
      "id": 1,
      "day": "Sun",
      "date": "01",
      "status": 2,
      "remark":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit ab est, atque saepe earum temporibus tempora. Perferendis expedita, id modi praesentium vel vitae rerum esse, blanditiis perspiciatis quos ipsam!"
    },
    {
      "id": 2,
      "day": "Mon",
      "date": "02",
      "status": 0,
      "remark":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit ab est, atque saepe earum temporibus tempora. Perferendis expedita, id modi praesentium vel vitae rerum esse, blanditiis perspiciatis quos ipsam!"
    },
    {
      "id": 3,
      "day": "Tue",
      "date": "03",
      "status": 0,
      "remark":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit ab est, atque saepe earum temporibus tempora. Perferendis expedita, id modi praesentium vel vitae rerum esse, blanditiis perspiciatis quos ipsam!"
    },
    {
      "id": 4,
      "day": "Wed",
      "date": "04",
      "status": 1,
      "remark":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit ab est, atque saepe earum temporibus tempora. Perferendis expedita, id modi praesentium vel vitae rerum esse, blanditiis perspiciatis quos ipsam!"
    },
    {
      "id": 5,
      "day": "Thu",
      "date": "05",
      "status": 2,
      "remark":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit ab est, atque saepe earum temporibus tempora. Perferendis expedita, id modi praesentium vel vitae rerum esse, blanditiis perspiciatis quos ipsam!"
    },
    {
      "id": 6,
      "day": "Fri",
      "date": "06",
      "status": 2,
      "remark":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit ab est, atque saepe earum temporibus tempora. Perferendis expedita, id modi praesentium vel vitae rerum esse, blanditiis perspiciatis quos ipsam!"
    },
    {
      "id": 7,
      "day": "Sat",
      "date": "07",
      "status": 2,
      "remark":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit ab est, atque saepe earum temporibus tempora. Perferendis expedita, id modi praesentium vel vitae rerum esse, blanditiis perspiciatis quos ipsam!"
    },
    {
      "id": 8,
      "day": "Sat",
      "date": "07",
      "status": 2,
      "remark":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit ab est, atque saepe earum temporibus tempora. Perferendis expedita, id modi praesentium vel vitae rerum esse, blanditiis perspiciatis quos ipsam!"
    },
    {
      "id": 9,
      "day": "Sat",
      "date": "07",
      "status": 2,
      "remark":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit ab est, atque saepe earum temporibus tempora. Perferendis expedita, id modi praesentium vel vitae rerum esse, blanditiis perspiciatis quos ipsam!"
    },
    {
      "id": 10,
      "day": "Sat",
      "date": "07",
      "status": 2,
      "remark":
          "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium reprehenderit ab est, atque saepe earum temporibus tempora. Perferendis expedita, id modi praesentium vel vitae rerum esse, blanditiis perspiciatis quos ipsam!"
    },
  ];

  String selectedRemark = "";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.secondaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColor.secondaryColor,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width * 100 / 100,
        height: MediaQuery.of(context).size.height * 100 / 100,
        color: AppColor.secondaryColor,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 8 / 100,
              width: MediaQuery.of(context).size.width * 100 / 100,
              padding: const EdgeInsets.only(right: 18),
              color: AppColor.secondaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      color: AppColor.secondaryColor,
                      padding: EdgeInsets.only(
                          left: 18,
                          right: MediaQuery.of(context).size.width * 5 / 100),
                      child: Image.asset(
                        width: MediaQuery.of(context).size.width * 6 / 100,
                        height: MediaQuery.of(context).size.width * 6 / 100,
                        AppImage.backIcon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calendarBottomSheet(context),
                    child: Row(
                      children: [
                        Text(AppLanguage.attendanceText[language],
                            style: const TextStyle(
                              color: AppColor.blueColor,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1 / 100,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 4 / 100,
                          width: MediaQuery.of(context).size.width * 4 / 100,
                          child: Image.asset(AppImage.calendarIcon),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 11 / 100,
                    height: MediaQuery.of(context).size.width * 11 / 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: AppColor.blueColor),
                        image: DecorationImage(
                            image: AssetImage(widget.image),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 2 / 100,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 90 / 100,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                            color: AppColor.primaryColor.withOpacity(0.25),
                            blurRadius: 8,
                            offset: const Offset(0, 4))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLanguage.attendanceText[language],
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontFamily: AppFont.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 1 / 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.width *
                                    15 /
                                    100,
                                width: MediaQuery.of(context).size.width *
                                    15 /
                                    100,
                                child: CustomPaint(
                                  size: const Size(100, 100),
                                  painter: ArcPainter(),
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 1 / 100,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "24",
                                style: const TextStyle(
                                    color: AppColor.greenColor,
                                    fontFamily: AppFont.fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              Text(
                                AppLanguage.presentText[language],
                                style: const TextStyle(
                                    color: AppColor.darkSilverColor,
                                    fontFamily: AppFont.fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "03",
                                style: const TextStyle(
                                    color: AppColor.yellowColor,
                                    fontFamily: AppFont.fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              Text(
                                AppLanguage.presentText[language],
                                style: const TextStyle(
                                    color: AppColor.darkSilverColor,
                                    fontFamily: AppFont.fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "04",
                                style: const TextStyle(
                                    color: AppColor.darkRedColor,
                                    fontFamily: AppFont.fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              Text(
                                AppLanguage.presentText[language],
                                style: const TextStyle(
                                    color: AppColor.darkSilverColor,
                                    fontFamily: AppFont.fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 2 / 100,
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width*90/100,
                //   height: MediaQuery.of(context).size.height*67/100,
                //   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                //   decoration: BoxDecoration(
                //     color: AppColor.secondaryColor,
                //     borderRadius: BorderRadius.circular(6),
                //     boxShadow: [
                //       BoxShadow(
                //         color: AppColor.primaryColor.withOpacity(0.25),
                //         blurRadius: 8,
                //         offset: const Offset(0, 4)
                //       )
                //     ]
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(AppLanguage.attendanceDetailsText[language],
                //         style: const TextStyle(
                //           color: AppColor.primaryColor,
                //           fontFamily: AppFont.fontFamily,
                //           fontWeight: FontWeight.w500,
                //           fontSize: 16
                //         ),
                //       ),
                //       SizedBox(height: MediaQuery.of(context).size.height*1/100,),
                //       Container(
                //         padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                //         decoration: BoxDecoration(
                //           border: Border(
                //             bottom: BorderSide(color: AppColor.primaryColor.withOpacity(0.19))
                //           )
                //         ),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(AppLanguage.dateText[language],
                //               style: const TextStyle(
                //                 color: AppColor.primaryColor,
                //                 fontFamily: AppFont.fontFamily,
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14
                //               ),
                //             ),
                //             Text(AppLanguage.attendanceText[language],
                //               style: const TextStyle(
                //                 color: AppColor.primaryColor,
                //                 fontFamily: AppFont.fontFamily,
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14
                //               ),
                //             ),
                //             Text(AppLanguage.remarkText[language],
                //               style: const TextStyle(
                //                 color: AppColor.primaryColor,
                //                 fontFamily: AppFont.fontFamily,
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       SizedBox(height: MediaQuery.of(context).size.height*0.5/100,),
                //       Expanded(
                //         child: SingleChildScrollView(
                //           child: Wrap(
                //             children: List.generate(attendanceList.length, (index) {
                //               return Container(
                //                 padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                //                 decoration: BoxDecoration(
                //                   border: Border(
                //                     bottom: BorderSide(color: AppColor.primaryColor.withOpacity(0.19))
                //                   )
                //                 ),
                //                 child: Row(
                //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     Container(
                //                       width: MediaQuery.of(context).size.width*10/100,
                //                       height: MediaQuery.of(context).size.width*11/100,
                //                       decoration: BoxDecoration(
                //                         color: AppColor.blueColor,
                //                         borderRadius: BorderRadius.circular(7)
                //                       ),
                //                       child: Column(
                //                         mainAxisAlignment: MainAxisAlignment.center,
                //                         children: [
                //                           Text(attendanceList[index]["day"],
                //                             style: const TextStyle(
                //                               color: AppColor.secondaryColor,
                //                               fontFamily: AppFont.fontFamily,
                //                               fontWeight: FontWeight.w500,
                //                               fontSize: 11
                //                             ),
                //                           ),
                //                           Text(attendanceList[index]["date"],
                //                             style: const TextStyle(
                //                               color: AppColor.secondaryColor,
                //                               fontFamily: AppFont.fontFamily,
                //                               fontWeight: FontWeight.w500,
                //                               fontSize: 11
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                     SizedBox(
                //                       width: MediaQuery.of(context).size.width*45/100,
                //                       child: Row(
                //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Text(AppLanguage.presentText[language],
                //                             style: TextStyle(
                //                               color: attendanceList[index]["status"] == 2
                //                               ? AppColor.greenColor
                //                               : AppColor.grayColor,
                //                               fontFamily: AppFont.fontFamily,
                //                               fontWeight: FontWeight.w500,
                //                               fontSize: 11
                //                             ),
                //                           ),
                //                           Text(AppLanguage.absentText[language],
                //                             style: TextStyle(
                //                               color: attendanceList[index]["status"] == 0
                //                               ? AppColor.darkRedColor
                //                               : AppColor.grayColor,
                //                               fontFamily: AppFont.fontFamily,
                //                               fontWeight: FontWeight.w500,
                //                               fontSize: 11
                //                             ),
                //                           ),
                //                           Text(AppLanguage.halfDayText[language],
                //                             style: TextStyle(
                //                               color: attendanceList[index]["status"] == 1
                //                               ? AppColor.yellowColor
                //                               : AppColor.grayColor,
                //                               fontFamily: AppFont.fontFamily,
                //                               fontWeight: FontWeight.w500,
                //                               fontSize: 11
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                     GestureDetector(
                //                       onTap: () {
                //                         setState(() {
                //                           selectedRemark = attendanceList[index]["remark"];
                //                         });
                //                         remarkBottomSheet(context);
                //                       },
                //                       child: Container(
                //                         padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                //                         decoration: BoxDecoration(
                //                           color: AppColor.blueColor,
                //                           borderRadius: BorderRadius.circular(3)
                //                         ),
                //                         child: Text(AppLanguage.remarkText[language],
                //                           style: const TextStyle(
                //                             color: AppColor.secondaryColor,
                //                             fontFamily: AppFont.fontFamily,
                //                             fontWeight: FontWeight.w500,
                //                             fontSize: 11
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               );
                //             }),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.67,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.primaryColor.withOpacity(0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLanguage.attendanceDetailsText[language],
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontFamily: AppFont.fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 6),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: AppColor.primaryColor.withOpacity(0.19)),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLanguage.dateText[language],
                              style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              AppLanguage.attendanceText[language],
                              style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              AppLanguage.remarkText[language],
                              style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 50 / 100,
                        child: SingleChildScrollView(
                          child: Column(
                            children:
                                List.generate(attendanceList.length, (index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 6),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: AppColor.primaryColor
                                            .withOpacity(0.19)),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.11,
                                      decoration: BoxDecoration(
                                        color: AppColor.blueColor,
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            attendanceList[index]["day"],
                                            style: const TextStyle(
                                              color: AppColor.secondaryColor,
                                              fontFamily: AppFont.fontFamily,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11,
                                            ),
                                          ),
                                          Text(
                                            attendanceList[index]["date"],
                                            style: const TextStyle(
                                              color: AppColor.secondaryColor,
                                              fontFamily: AppFont.fontFamily,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppLanguage.presentText[language],
                                            style: TextStyle(
                                              color: attendanceList[index]
                                                          ["status"] ==
                                                      2
                                                  ? AppColor.greenColor
                                                  : AppColor.grayColor,
                                              fontFamily: AppFont.fontFamily,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11,
                                            ),
                                          ),
                                          Text(
                                            AppLanguage.absentText[language],
                                            style: TextStyle(
                                              color: attendanceList[index]
                                                          ["status"] ==
                                                      0
                                                  ? AppColor.darkRedColor
                                                  : AppColor.grayColor,
                                              fontFamily: AppFont.fontFamily,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11,
                                            ),
                                          ),
                                          Text(
                                            AppLanguage.halfDayText[language],
                                            style: TextStyle(
                                              color: attendanceList[index]
                                                          ["status"] ==
                                                      1
                                                  ? AppColor.yellowColor
                                                  : AppColor.grayColor,
                                              fontFamily: AppFont.fontFamily,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedRemark =
                                              attendanceList[index]["remark"];
                                        });
                                        remarkBottomSheet(context);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 4),
                                        decoration: BoxDecoration(
                                          color: AppColor.blueColor,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Text(
                                          AppLanguage.remarkText[language],
                                          style: const TextStyle(
                                            color: AppColor.secondaryColor,
                                            fontFamily: AppFont.fontFamily,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  bool isDaySelected = false;

  void calendarBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        enableDrag: true,
        isDismissible: true,
        isScrollControlled: true,
        useSafeArea: true,
        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              width: MediaQuery.of(context).size.width * 100 / 100,
              height: MediaQuery.of(context).size.height * 100 / 100,
              color: AppColor.primaryColor.withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 90 / 100,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    decoration: BoxDecoration(
                        color: AppColor.secondaryColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: [
                        TableCalendar(
                          focusedDay: _focusedDay,
                          firstDay: DateTime.utc(2020, 1, 1),
                          lastDay: DateTime.utc(2030, 12, 31),
                          availableGestures: AvailableGestures.none,
                          selectedDayPredicate: (day) =>
                              isSameDay(_selectedDay, day),
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                              isDaySelected = true;
                            });
                          },
                          headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            leftChevronIcon: Container(
                              decoration: const BoxDecoration(),
                              padding: const EdgeInsets.all(
                                  0), // Padding to create space around the icon
                              child: const Icon(
                                Icons.arrow_back,
                                // Chevron color
                              ),
                            ),
                            rightChevronIcon: Container(
                              decoration: const BoxDecoration(),
                              padding: const EdgeInsets.all(
                                  0), // Padding to create space around the icon
                              child: const Icon(
                                Icons.arrow_forward, // Chevron color
                              ),
                            ),
                          ),
                          calendarStyle: CalendarStyle(
                            isTodayHighlighted: !isDaySelected,
                            selectedDecoration: const BoxDecoration(
                              color: AppColor.themeColor,
                              shape: BoxShape.circle,
                            ),
                            todayDecoration: const BoxDecoration(
                              color: AppColor.themeColor,
                              shape: BoxShape.circle,
                            ),
                            // Highlight entire week when Week filter is selected
                            // rangeHighlightColor: _selectedFilter == "Week" ? Color.green.withOpacity(0.3) : null,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 1 / 100,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              width:
                                  MediaQuery.of(context).size.width * 35 / 100,
                              height:
                                  MediaQuery.of(context).size.height * 6 / 100,
                              decoration: BoxDecoration(
                                color: AppColor.themeColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                AppLanguage.showText[language],
                                style: const TextStyle(
                                    color: AppColor.secondaryColor,
                                    fontFamily: AppFont.fontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  void remarkBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        enableDrag: false,
        isScrollControlled: true,
        useSafeArea: true,
        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 100 / 100,
                height: MediaQuery.of(context).size.height * 100 / 100,
                color: AppColor.primaryColor.withOpacity(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 80 / 100,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 12),
                      decoration: BoxDecoration(
                          color: AppColor.secondaryColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLanguage.remarkText[language],
                            style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 1 / 100,
                          ),
                          Text(
                            selectedRemark,
                            style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.square;

    double radius = size.width / 2;
    Rect rect = Rect.fromCircle(center: Offset(radius, radius), radius: radius);

    // Green Arc
    paint.color = Colors.green;
    canvas.drawArc(rect, -pi / 1, pi * 0.9, false, paint);

    // Red Arc
    paint.color = Colors.red;
    canvas.drawArc(rect, pi * 0.07, pi * 0.3, false, paint);

    // Yellow Arc
    paint.color = Colors.yellow;
    canvas.drawArc(rect, pi * 0.55, pi * 0.3, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
