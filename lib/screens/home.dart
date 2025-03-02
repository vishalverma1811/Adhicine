import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:medicine_ui/assets/image_assets.dart';
import 'package:medicine_ui/common/common_text.dart';
import 'package:medicine_ui/theme/app_color.dart';
import 'package:medicine_ui/utils/utils.dart';

import 'profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime selectedDate = DateTime.now();
  final HorizontalWeekCalenderController calendarController =
      HorizontalWeekCalenderController();

  // Adjusted minDate and maxDate to ensure initialDate is strictly within the range
  final DateTime _minDate =
      DateTime(2023, 1, 1).subtract(const Duration(days: 1));
  final DateTime _maxDate = DateTime(2027, 1, 1).add(const Duration(days: 1));

  DateTime getInitialDate() {
    final DateTime now = DateTime.now();

    // Clamp the initial date to be strictly within _minDate and _maxDate
    if (now.isBefore(_minDate)) {
      return _minDate.add(const Duration(days: 1));
    } else if (now.isAfter(_maxDate)) {
      return _maxDate.subtract(const Duration(days: 1));
    } else {
      return now;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        title: CommonText(
          text: "Hi Harry!\n",
          fontSize: 0.02.sh,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor,
          children: [
            TextSpan(
              text: "5 Medicines Left",
              style: TextStyle(
                fontSize: 0.018.sh,
                fontWeight: FontWeight.w400,
                color: AppColors.subtextColor,
              ),
            )
          ],
        ),
        actions: [
          GestureDetector(
            onTap:() {
              Get.to(()=> Profile(), transition: Transition.leftToRight);
            },
            child: ClipOval(
              child: Image.asset(
                ImageAssets.person,
                height: 0.1.sh,
                width: 0.1.sw,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(0.02.sh),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HorizontalWeekCalendar(
                minDate: _minDate,
                maxDate: _maxDate,
                initialDate: getInitialDate(),
                onDateChange: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
                showTopNavbar: true,
                monthFormat: "MMMM yyyy",
                showNavigationButtons: true,
                weekStartFrom: WeekStartFrom.Monday,
                borderRadius: BorderRadius.circular(7),
                activeBackgroundColor: AppColors.calendarColor,
                activeTextColor: Colors.white,
                inactiveBackgroundColor:
                    AppColors.calendarColor.withOpacity(.3),
                inactiveTextColor: Colors.white,
                disabledTextColor: Colors.grey,
                disabledBackgroundColor: Colors.grey.withOpacity(.3),
                activeNavigatorColor: Colors.deepPurple,
                inactiveNavigatorColor: Colors.grey,
                monthColor: AppColors.textColor,
                onWeekChange: (List<DateTime> dates) {},
                scrollPhysics: const BouncingScrollPhysics(),
                controller: calendarController,
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "Morning 08:00 am",
                fontSize: 0.026.sh,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),
              Utils().vSpacer(0.02.sh),
              Container(
                padding: EdgeInsets.all(0.02.sh),
                decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.circular(0.02.sh),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(ImageAssets.drop),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Calpol 500mg tablet",
                          fontSize: 0.018.sh,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                        Utils().vSpacer(0.01.sh),
                        Row(
                          children: [
                            CommonText(
                              text: "Before Breakfast",
                              fontSize: 0.016.sh,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                            ),
                            Utils().hSpacer(0.02.sh),
                            CommonText(
                              text: "Day 01",
                              fontSize: 0.016.sh,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.greenAccent,
                        ),
                        Utils().vSpacer(0.01.sh),
                        CommonText(
                          text: "Taken",
                          fontSize: 0.014.sh,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Utils().vSpacer(0.01.sh),
              Container(
                padding: EdgeInsets.all(0.02.sh),
                decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.circular(0.02.sh),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(ImageAssets.capsuleBlue),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Calpol 500mg tablet",
                          fontSize: 0.018.sh,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                        Utils().vSpacer(0.01.sh),
                        Row(
                          children: [
                            CommonText(
                              text: "Before Breakfast",
                              fontSize: 0.016.sh,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                            ),
                            Utils().hSpacer(0.02.sh),
                            CommonText(
                              text: "Day 27",
                              fontSize: 0.016.sh,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.red,
                        ),
                        Utils().vSpacer(0.01.sh),
                        CommonText(
                          text: "Missed",
                          fontSize: 0.014.sh,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "Afternoon 02:00 pm",
                fontSize: 0.026.sh,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),
              Utils().vSpacer(0.01.sh),
              Container(
                padding: EdgeInsets.all(0.02.sh),
                decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.circular(0.02.sh),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(ImageAssets.dropPurple),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Calpol 500mg tablet",
                          fontSize: 0.018.sh,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                        Utils().vSpacer(0.01.sh),
                        Row(
                          children: [
                            CommonText(
                              text: "After Food",
                              fontSize: 0.016.sh,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                            ),
                            Utils().hSpacer(0.02.sh),
                            CommonText(
                              text: "Day 01",
                              fontSize: 0.016.sh,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.orange,
                        ),
                        Utils().vSpacer(0.01.sh),
                        CommonText(
                          text: "Snoozed",
                          fontSize: 0.014.sh,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "Night 09:00 pm",
                fontSize: 0.026.sh,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),
              Utils().vSpacer(0.01.sh),
              Container(
                padding: EdgeInsets.all(0.02.sh),
                decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.circular(0.02.sh),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(ImageAssets.syringe),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Calpol 500mg tablet",
                          fontSize: 0.018.sh,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                        Utils().vSpacer(0.01.sh),
                        Row(
                          children: [
                            CommonText(
                              text: "Before Sleep",
                              fontSize: 0.016.sh,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                            ),
                            Utils().hSpacer(0.02.sh),
                            CommonText(
                              text: "Day 03",
                              fontSize: 0.016.sh,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.grey,
                        ),
                        Utils().vSpacer(0.01.sh),
                        CommonText(
                          text: "Left",
                          fontSize: 0.014.sh,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
