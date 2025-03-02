import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicine_ui/assets/icon_assets.dart';
import 'package:medicine_ui/assets/image_assets.dart';
import 'package:medicine_ui/common/common_button.dart';
import 'package:medicine_ui/common/common_text.dart';
import 'package:medicine_ui/screens/login.dart';
import 'package:medicine_ui/theme/app_color.dart';
import 'package:medicine_ui/utils/utils.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 2,
      ),
      body: Padding(
        padding: EdgeInsets.all(0.02.sh),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(child: Image.asset(ImageAssets.person)),
                  Utils().hSpacer(0.016.sh),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Take Care!",
                        fontSize: 0.018.sh,
                        fontWeight: FontWeight.w300,
                        color: AppColors.textColor,
                      ),
                      CommonText(
                        text: "Richard",
                        fontSize: 0.022.sh,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    ],
                  )
                ],
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "Settings",
                fontSize: 0.022.sh,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),
              Utils().vSpacer(0.02.sh),
              Row(
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    color: AppColors.subtextColor,
                  ),
                  Utils().hSpacer(0.02.sw),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Notification",
                        fontSize: 0.022.sh,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                      CommonText(
                        text: "Check your medicine notification",
                        fontSize: 0.018.sh,
                        fontWeight: FontWeight.w300,
                        color: AppColors.subtextColor,
                      ),
                    ],
                  ),
                ],
              ),
              Utils().vSpacer(0.02.sh),
              Row(
                children: [
                  Icon(
                    Icons.volume_down_outlined,
                    color: AppColors.subtextColor,
                  ),
                  Utils().hSpacer(0.02.sw),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Sound",
                        fontSize: 0.022.sh,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                      CommonText(
                        text: "Ring, Silent, Vibrate",
                        fontSize: 0.018.sh,
                        fontWeight: FontWeight.w300,
                        color: AppColors.subtextColor,
                      ),
                    ],
                  ),
                ],
              ),
              Utils().vSpacer(0.02.sh),
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    color: AppColors.subtextColor,
                  ),
                  Utils().hSpacer(0.02.sw),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Manage Your Account",
                        fontSize: 0.022.sh,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                      CommonText(
                        text: "Password, Email ID, Phone Number",
                        fontSize: 0.018.sh,
                        fontWeight: FontWeight.w300,
                        color: AppColors.subtextColor,
                      ),
                    ],
                  ),
                ],
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "Device",
                fontSize: 0.022.sh,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),
              Utils().vSpacer(0.02.sh),
              Container(
                padding: EdgeInsets.all(0.02.sh),
                decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.circular(0.02.sh),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.volume_down_outlined,
                          color: AppColors.subtextColor,
                        ),
                        Utils().hSpacer(0.02.sw),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "Connect",
                              fontSize: 0.022.sh,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                            ),
                            CommonText(
                              text: "Bluetooth, Wifi",
                              fontSize: 0.018.sh,
                              fontWeight: FontWeight.w300,
                              color: AppColors.subtextColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "Caretakers 03",
                fontSize: 0.022.sh,
                fontWeight: FontWeight.w400,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ClipOval(child: Image.asset(ImageAssets.person2)),
                        Utils().hSpacer(0.02.sw),
                        CommonText(
                          text: "Dipa Luna",
                          fontSize: 0.016.sh,
                          fontWeight: FontWeight.w300,
                          color: AppColors.textColor,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ClipOval(child: Image.asset(ImageAssets.person3)),
                        Utils().hSpacer(0.02.sw),
                        CommonText(
                          text: "Sunny",
                          fontSize: 0.016.sh,
                          fontWeight: FontWeight.w300,
                          color: AppColors.textColor,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ClipOval(
                            child: Icon(Icons.person_rounded, size: 0.066.sh)),
                        Utils().hSpacer(0.02.sw),
                        CommonText(
                          text: "Rose",
                          fontSize: 0.016.sh,
                          fontWeight: FontWeight.w300,
                          color: AppColors.textColor,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ClipOval(
                            child: Icon(
                          Icons.add_rounded,
                          size: 0.066.sh,
                        )),
                        Utils().hSpacer(0.02.sw),
                        CommonText(
                          text: "Add",
                          fontSize: 0.016.sh,
                          fontWeight: FontWeight.w300,
                          color: AppColors.textColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Utils().vSpacer(0.02.sh),
              CommonText(
                text: "Doctor",
                fontSize: 0.022.sh,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),
              Utils().vSpacer(0.02.sh),
              Container(
                padding: EdgeInsets.all(0.02.sh),
                decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.circular(0.02.sh),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        IconAssets.addBlue,
                      ),
                      Utils().vSpacer(0.02.sh),
                      CommonText(
                        text: "Add Your Doctor",
                        fontSize: 0.02.sh,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                      Utils().vSpacer(0.01.sh),
                      CommonText(
                        text: "or use ",
                        fontSize: 0.016.sh,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                        children: [
                          TextSpan(
                              text: "invite link",
                              style: TextStyle(
                                fontSize: 0.016.sh,
                                fontWeight: FontWeight.w400,
                                color: Colors.amber,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Utils().vSpacer(0.02.sh),
              ListTile(
                title: CommonText(
                  text: "Privacy Policy",
                  fontSize: 0.022.sh,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                ),
              ),
              Utils().vSpacer(0.02.sh),
              ListTile(
                title: CommonText(
                  text: "Terms of Use",
                  fontSize: 0.022.sh,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                ),
              ),
              Utils().vSpacer(0.02.sh),
              ListTile(
                title: CommonText(
                  text: "Rate Us",
                  fontSize: 0.022.sh,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                ),
              ),
              Utils().vSpacer(0.02.sh),
              ListTile(
                title: CommonText(
                  text: "Share",
                  fontSize: 0.022.sh,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                ),
              ),
              Utils().vSpacer(0.02.sh),
              CommonButton(
                onPressed: () {
                  Get.offAll(()=> Login(), transition: Transition.leftToRight);
                },
                buttonText: "Log Out",
                backgroundColor: AppColors.whiteColor,
                textColor: AppColors.buttonColor,
                borderColor: AppColors.buttonColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
