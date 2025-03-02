import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicine_ui/assets/icon_assets.dart';
import 'package:medicine_ui/assets/image_assets.dart';
import 'package:medicine_ui/common/common_button.dart';
import 'package:medicine_ui/common/common_text.dart';
import 'package:medicine_ui/common/common_text_field.dart';
import 'package:medicine_ui/screens/dashboard.dart';
import 'package:medicine_ui/theme/app_color.dart';
import 'package:medicine_ui/utils/utils.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  int selectedCompartment = 1;
  String selectedType = "Tablet";
  double quantity = 0.5;
  double totalCount = 50;
  DateTime? startDate;
  DateTime? endDate;
  String selectedFrequency = "Everyday";
  String timesday = "Three times";
  String selectedOption = "Before Food";

  Color selectedColor = Colors.pinkAccent;
  List<Color> colors = [
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.redAccent,
    Colors.green,
    Colors.orangeAccent,
    Colors.yellowAccent,
  ];

  List<Map<String, String>> medicineTypes = [
    {"name": "Tablet", "image": ImageAssets.tablet},
    {"name": "Capsule", "image": ImageAssets.capsuleBlue},
    {"name": "Cream", "image": ImageAssets.cream},
    {"name": "Lotion", "image": ImageAssets.lotion},
  ];

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
          if (endDate != null && endDate!.isBefore(picked)) {
            endDate = null;
          }
        } else {
          if (startDate == null ||
              picked.isAfter(startDate!) ||
              picked.isAtSameMomentAs(startDate!)) {
            endDate = picked;
          } else {
            Utils.errorSnackbar(
                "Error", "End date cannot be before start date");
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        title: CommonText(
          text: "Add Medicines",
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
              CommonTextField(
                hintText: "Search Medicine Name",
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.subtextColor,
                ),
                suffixIcon: Icon(
                  Icons.mic,
                  color: AppColors.subtextColor,
                ),
                focusedBorderColor: AppColors.buttonColor,
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "Compartment",
                fontSize: 0.02.sh,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),
              Utils().vSpacer(0.02.sh),
              GridView.builder(
                shrinkWrap: true, // So it doesn't take full screen
                physics:
                    NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, // Number of compartments per row
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.2, // Adjust for better UI
                ),
                itemCount: 10, // Total compartments
                itemBuilder: (context, index) {
                  int compartmentNumber = index + 1;
                  bool isSelected = selectedCompartment == compartmentNumber;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCompartment = compartmentNumber;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(0.02.sh),
                        border: Border.all(color: AppColors.subtextColor),
                      ),
                      alignment: Alignment.center,
                      child: CommonText(
                        text: compartmentNumber.toString(),
                        color: isSelected
                            ? AppColors.whiteColor
                            : AppColors.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "Colour",
                fontSize: 0.02.sh,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),
              Wrap(
                spacing: 0.06.sw,
                children: colors.map((color) {
                  bool isSelected = selectedColor == color;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 0.1.sw,
                      height: 0.066.sh,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                        border: isSelected
                            ? Border.all(
                                color: AppColors.textColor,
                                width: 2) // Highlight selected
                            : null,
                      ),
                    ),
                  );
                }).toList(),
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "Type",
                fontSize: 0.02.sh,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),
              Utils().vSpacer(0.02.sh),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: medicineTypes.map((type) {
                  bool isSelected = selectedType == type["name"];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedType = type["name"]!;
                      });
                    },
                    child: Column(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            isSelected
                                ? selectedColor.withOpacity(
                                    1) // Darker shade when selected
                                : selectedColor
                                    .withOpacity(0.5), // Lighter otherwise
                            BlendMode.srcIn,
                          ),
                          child: Image.asset(
                            type["image"]!,
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Utils().vSpacer(0.005.sh),
                        CommonText(
                          text: type["name"]!,
                          fontSize: 0.016.sh,
                          color: isSelected
                              ? selectedColor
                                  .withOpacity(1) // Darker shade when selected
                              : selectedColor.withOpacity(0.5),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "Quantity",
                fontSize: 0.02.sh,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),
              Utils().vSpacer(0.02.sh),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          if (quantity > 0.5) {
                            quantity -= 0.5;
                          }
                        });
                      },
                      child: Image.asset(IconAssets.minus)),
                  Utils().hSpacer(0.02.sw),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.016.sw, vertical: 0.01.sh),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.subtextColor),
                        borderRadius: BorderRadius.circular(.01.sh),
                      ),
                      child: Center(
                        child: CommonText(
                          text:
                              "Take ${quantity == 0.5 ? '1/2' : quantity.toString()} Pill",
                          fontSize: 0.02.sh,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),
                  Utils().hSpacer(0.02.sw),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          if (quantity < 2) {
                            quantity += 0.5;
                          }
                        });
                      },
                      child: Image.asset(IconAssets.addRounded))
                ],
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "Total Count",
                fontSize: 0.02.sh,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),
              Utils().vSpacer(0.02.sh),
              SfSlider(
                min: 0,
                max: 100,
                value: totalCount,
                interval: 10,
                stepSize: 1,
                showTicks: true,
                showLabels: true,
                enableTooltip: true,
                activeColor: AppColors.buttonColor,
                onChanged: (dynamic newValue) {
                  setState(() {
                    totalCount = newValue;
                  });
                },
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "Set Date",
                fontSize: 0.02.sh,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),
              Utils().vSpacer(0.02.sh),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(AppColors.buttonColor)),
                      onPressed: () => _selectDate(context, true),
                      child: CommonText(
                        text: startDate == null
                            ? "Select Start Date"
                            : "Start:\n${startDate!.toLocal()}".split(' ')[0],
                        fontSize: 0.018.sh,
                        color: AppColors.whiteColor,
                        maxLine: 2,
                      ),
                    ),
                  ),
                  Utils().hSpacer(0.02.sw),
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(AppColors.buttonColor)),
                      onPressed: () {
                        if (startDate == null) {
                          Utils.errorSnackbar(
                              "Error", "Select start date first");
                        } else {
                          _selectDate(context, false);
                        }
                      },
                      child: CommonText(
                        text: endDate == null
                            ? "Select End Date"
                            : "End:\n${endDate!.toLocal()}".split(' ')[0],
                        fontSize: 0.018.sh,
                        color: AppColors.whiteColor,
                        maxLine: 2,
                      ),
                    ),
                  ),
                ],
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "Frequency of Days",
                fontSize: 0.02.sh,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),
              Utils().vSpacer(0.02.sh),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0.02.sw),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.subtextColor),
                  borderRadius: BorderRadius.circular(0.01.sh),
                ),
                child: DropdownButton<String>(
                  value: selectedFrequency,
                  isExpanded: true,
                  underline: Container(),
                  items: ["Everyday", "Alternate Day", "In a Week"]
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: CommonText(
                        text: value,
                        fontSize: 0.018.sh,
                        color: AppColors.textColor,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFrequency = newValue!;
                    });
                  },
                ),
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "How Many times a Day",
                fontSize: 0.02.sh,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),
              Utils().vSpacer(0.02.sh),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0.02.sw),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.subtextColor),
                  borderRadius: BorderRadius.circular(0.01.sh),
                ),
                child: DropdownButton<String>(
                  value: timesday,
                  isExpanded: true,
                  underline: Container(),
                  items: ["Three times", "Four times", "Five times"]
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: CommonText(
                        text: value,
                        fontSize: 0.018.sh,
                        color: AppColors.textColor,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      timesday = newValue!;
                    });
                  },
                ),
              ),
              Utils().vSpacer(0.02.sh),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ["Before Food", "After Food", "Before Sleep"]
                    .map((String option) {
                  bool isSelected = selectedOption == option;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = option;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.02.sw, vertical: 0.01.sh),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.buttonColor
                            : AppColors.buttonColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(0.01.sh),
                      ),
                      child: CommonText(
                        text: option,
                        fontSize: 0.016.sh,
                        color: isSelected
                            ? AppColors.whiteColor
                            : AppColors.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
              Utils().vSpacer(0.02.sh),
              CommonButton(
                  onPressed: () {
                    Get.offAll(() => Dashboard());
                  },
                  buttonText: "Add")
            ],
          ),
        ),
      ),
    );
  }
}
