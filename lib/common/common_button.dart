import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_ui/common/common_text.dart';
import 'package:medicine_ui/theme/app_color.dart';
import 'package:medicine_ui/utils/utils.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final bool isLoading;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CommonButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    this.padding,
    this.borderRadius,
    this.isLoading = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed:
            isLoading ? null : onPressed, // Disable the button when loading
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.buttonColor,
          padding: padding ?? EdgeInsets.symmetric(vertical: 0.014.sh),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0.01.sh),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: isLoading
            ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                backgroundColor: backgroundColor ?? AppColors.buttonColor,
                valueColor:
                    AlwaysStoppedAnimation<Color>(textColor ?? Colors.white),
              ),
            )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (prefixIcon != null) ...[
                    prefixIcon!,
                    Utils().hSpacer(0.01.sw)
                  ],
                  CommonText(
                    text: buttonText,
                    fontSize: fontSize ?? 0.02.sh,
                    fontWeight: fontWeight ?? FontWeight.w500,
                    color: textColor ?? Colors.white,
                  ),
                  if (suffixIcon != null) ...[
                    Utils().hSpacer(0.01.sw),
                    suffixIcon!,
                  ],
                ],
              ),
      ),
    );
  }
}
