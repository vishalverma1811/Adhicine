import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicine_ui/common/common_button.dart';
import 'package:medicine_ui/common/common_text.dart';
import 'package:medicine_ui/common/common_text_field.dart';
import 'package:medicine_ui/screens/dashboard.dart';
import 'package:medicine_ui/screens/login.dart';
import 'package:medicine_ui/theme/app_color.dart';
import 'package:medicine_ui/utils/utils.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  File? selectedImage;

  Future<File?> takePhoto() async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.textColor),
      ),
      body: Padding(
        padding: EdgeInsets.all(0.02.sh),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: "Register to Adhicine",
                fontSize: 0.036.sh,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),
              Utils().vSpacer(0.02.sh),
              Center(
                child: Stack(
                  children: [
                    selectedImage != null
                        ? ClipOval(
                            child: Image.file(
                              selectedImage!,
                              height: 0.2.sh,
                              width: 0.4.sw,
                              fit: BoxFit.cover,
                              frameBuilder: (BuildContext context, Widget child,
                                  int? frame, bool wasSynchronouslyLoaded) {
                                if (frame == null) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return child;
                                }
                              },
                            ),
                          )
                        : ClipOval(
                            child: Icon(
                            Icons.person,
                            color: AppColors.buttonColor,
                            size: 0.12.sh,
                          )),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () async {
                          File? file = await takePhoto();
                          if (file != null) {
                            setState(() {
                              selectedImage = file;
                            });
                          }
                        },
                        child: const CircleAvatar(
                          child: Icon(
                            Icons.edit,
                            color: AppColors.buttonColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Utils().vSpacer(0.04.sh),
              CommonTextField(
                hintText: "Enter Name",
                prefixIcon: Icon(
                  Icons.person,
                  color: AppColors.greenColor,
                ),
              ),
              Utils().vSpacer(0.02.sh),
              CommonTextField(
                hintText: "Enter Email",
                prefixIcon: Icon(
                  Icons.alternate_email,
                  color: AppColors.greenColor,
                ),
              ),
              Utils().vSpacer(0.02.sh),
              CommonButton(onPressed: () {
                Get.offAll(()=> Dashboard(), transition: Transition.leftToRight);
              }, buttonText: "Sign Up"),
              Utils().vSpacer(0.04.sh),
              GestureDetector(
                onTap: () {
                  Get.offAll(() => Login(), transition: Transition.rightToLeft);
                },
                child: Center(
                  child: CommonText(
                    text: "Already At Adhicine? ",
                    fontSize: 0.02.sh,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                    children: [
                      TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                              color: AppColors.buttonColor,
                              fontSize: 0.02.sh,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
