import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicine_ui/assets/image_assets.dart';
import 'package:medicine_ui/common/common_button.dart';
import 'package:medicine_ui/common/common_text.dart';
import 'package:medicine_ui/common/common_text_field.dart';
import 'package:medicine_ui/screens/dashboard.dart';
import 'package:medicine_ui/screens/register.dart';
import 'package:medicine_ui/theme/app_color.dart';
import 'package:medicine_ui/utils/utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final RxBool obsecurePassword = true.obs;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0.02.sh),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                ImageAssets.capsule,
                height: 0.1.sh,
                width: 0.1.sw,
              )),
              Utils().vSpacer(0.02.sh),
              Center(
                child: CommonText(
                  text: "Adhicine",
                  fontSize: 0.02.sh,
                  fontWeight: FontWeight.w600,
                  color: AppColors.buttonColor,
                ),
              ),
              Utils().vSpacer(0.06.sh),
              CommonText(
                text: "Sign In",
                color: AppColors.textColor,
                fontSize: 0.056.sh,
                fontWeight: FontWeight.w500,
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
              CommonTextField(
                hintText: "Enter Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: AppColors.greenColor,
                ),
                obscureText: obsecurePassword.value,
                suffixIcon: IconButton(
                    onPressed: () {
                      obsecurePassword.value = !obsecurePassword.value;
                    },
                    icon: obsecurePassword.value
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.greenColor,
                          )
                        : const Icon(
                            Icons.remove_red_eye_outlined,
                            color: AppColors.greenColor,
                          )),
              ),
              Utils().vSpacer(0.02.sh),
              CommonButton(onPressed: () {
                Get.offAll(()=> Dashboard(), transition: Transition.leftToRight);
              }, buttonText: "Sign In"),
              Utils().vSpacer(0.02.sh),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.subtextColor,
                      thickness: 0.002.sh,
                    ),
                  ),
                  Utils().hSpacer(0.01.sh),
                  CommonText(
                    text: "Or",
                    color: AppColors.subtextColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 0.016.sh,
                  ),
                  Utils().hSpacer(0.01.sh),
                  Expanded(
                    child: Divider(
                      color: AppColors.subtextColor,
                      thickness: 0.002.sh,
                    ),
                  ),
                ],
              ),
              Utils().vSpacer(0.02.sh),
              CommonButton(
                onPressed: () {
                  Get.offAll(()=> Dashboard(), transition: Transition.leftToRight);
                },
                buttonText: "Continue With Google",
                prefixIcon: Image.asset(
                  ImageAssets.google,
                  width: 0.04.sw,
                  height: 0.022.sh,
                ),
                backgroundColor: AppColors.backgroundColor,
                textColor: AppColors.textColor,
              ),
              Utils().vSpacer(0.04.sh),
              GestureDetector(
                onTap: (){
                  Get.to(()=> Register(), transition: Transition.leftToRight);
                },
                child: Center(
                  child: CommonText(
                    text: "New to Adhicine? ",
                    fontSize: 0.02.sh,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: AppColors.buttonColor,
                          fontSize: 0.02.sh,
                          fontWeight: FontWeight.w500
                        )
                      )
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
