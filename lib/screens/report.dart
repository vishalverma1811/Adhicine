import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:medicine_ui/assets/image_assets.dart';
import 'package:medicine_ui/common/common_text.dart';
import 'package:medicine_ui/theme/app_color.dart';
import 'package:medicine_ui/utils/utils.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
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
          text: "Report",
          fontSize: 0.02.sh,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(0.02.sh),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(0.02.sh),
                decoration: BoxDecoration(
                    color: AppColors.containerColor,
                    borderRadius: BorderRadius.circular(0.02.sh),
                    border: Border.all(color: AppColors.subtextColor)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Today's report",
                      fontSize: 0.02.sh,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                    Utils().vSpacer(0.02.sh),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonText(
                              text: "5",
                              fontSize: 0.022.sh,
                              color: AppColors.buttonColor,
                              fontWeight: FontWeight.w600,
                            ),
                            Utils().vSpacer(0.01.sh),
                            CommonText(
                              text: "Total",
                              fontSize: 0.018.sh,
                              color: AppColors.subtextColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonText(
                              text: "3",
                              fontSize: 0.022.sh,
                              color: AppColors.buttonColor,
                              fontWeight: FontWeight.w600,
                            ),
                            Utils().vSpacer(0.01.sh),
                            CommonText(
                              text: "Taken",
                              fontSize: 0.018.sh,
                              color: AppColors.subtextColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonText(
                              text: "1",
                              fontSize: 0.022.sh,
                              color: AppColors.buttonColor,
                              fontWeight: FontWeight.w600,
                            ),
                            Utils().vSpacer(0.01.sh),
                            CommonText(
                              text: "Missed",
                              fontSize: 0.018.sh,
                              color: AppColors.subtextColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonText(
                              text: "1",
                              fontSize: 0.022.sh,
                              color: AppColors.buttonColor,
                              fontWeight: FontWeight.w600,
                            ),
                            Utils().vSpacer(0.01.sh),
                            CommonText(
                              text: "Snoozed",
                              fontSize: 0.018.sh,
                              color: AppColors.subtextColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Utils().vSpacer(0.02.sh),
              Container(
                padding: EdgeInsets.all(0.02.sh),
                decoration: BoxDecoration(
                    color: AppColors.containerColor,
                    borderRadius: BorderRadius.circular(0.02.sh),
                    border: Border.all(color: AppColors.subtextColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Check Dashboard",
                          fontSize: 0.02.sh,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                        Utils().vSpacer(0.02.sh),
                        CommonText(
                          text:
                              "Here you will find everything related\nto you active and past medicines.",
                          fontSize: 0.016.sh,
                          color: AppColors.subtextColor,
                          fontWeight: FontWeight.w400,
                          maxLine: 2,
                        )
                      ],
                    ),
                    Image.asset(ImageAssets.circle)
                  ],
                ),
              ),
              Utils().vSpacer(0.02.sh),
              Row(
                children: [
                  CommonText(
                    text: "Check History",
                    fontSize: 0.024.sh,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.buttonColor,
                  )
                ],
              ),
              Utils().vSpacer(0.02.sh),
              HorizontalWeekCalendar(
                minDate: _minDate,
                maxDate: _maxDate,
                initialDate: getInitialDate(),
                onDateChange: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
                showTopNavbar: false,
                monthFormat: "MMMM yyyy",
                showNavigationButtons: true,
                weekStartFrom: WeekStartFrom.Monday,
                borderRadius: BorderRadius.circular(7),
                activeBackgroundColor: AppColors.buttonColor,
                activeTextColor: Colors.white,
                inactiveBackgroundColor: AppColors.buttonColor.withOpacity(.3),
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
                fontSize: 0.024.sh,
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
                fontSize: 0.024.sh,
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
            ],
          ),
        ),
      ),
    );
  }
}
