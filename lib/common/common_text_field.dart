import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_color.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int? maxLine;
  final String hintText;
  final bool readOnly;
  final bool blurred;
  final Color textColor;
  final Color textFieldColor;
  final Color? iconColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? errorTextColor;
  final Color? cursorColor;
  final String font;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? contentPaddingVertical;
  final double? contentPaddinghorizontal;
  final FontWeight? fontweight;
  List<TextInputFormatter>? inputFormatters = [];
  TextInputType? inputType;

  CommonTextField({
    super.key,
    this.controller,
    this.inputType,
    this.validator,
    this.obscureText = false,
    this.maxLine = 1,
    required this.hintText,
    this.font = 'Poppins',
    this.suffixIcon,
    this.contentPaddingVertical,
    this.contentPaddinghorizontal,
    this.textColor = AppColors.textFieldColor,
    this.prefixIcon,
    this.iconColor = AppColors.textFieldColor,
    this.readOnly = false,
    this.textFieldColor = AppColors.textFieldColor,
    // this.textFieldColor = AppColors.greyColor,
    this.blurred = false,
    this.fontweight,
    this.inputFormatters,
    this.focusedBorderColor = AppColors.subtextColor,
    this.errorBorderColor = AppColors.requiredColor,
    this.errorTextColor = AppColors.requiredColor,
    this.cursorColor = AppColors.subtextColor,
  });

  @override
  Widget build(BuildContext context) {
    border({Color? color}) => OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? AppColors.subtextColor,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(0.016.sh),
    );
    return TextFormField(
      keyboardType: inputType,
      onChanged: (value) {
        controller?.text = value;
      },
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      cursorColor: cursorColor,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLine,
      obscuringCharacter: '*',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: GoogleFonts.getFont(
        font,
        textStyle: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 0.016.sh,
          height: 0.002.sh,
        ),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor:
        blurred ? AppColors.whiteColor.withOpacity(0.28) : textFieldColor,
        errorStyle: GoogleFonts.getFont(font,
            textStyle: TextStyle(
              color: errorTextColor,
            )),
        border: border(
          color: AppColors.textFieldColor
        ),
        enabledBorder: border(
          color: AppColors.textFieldColor
        ),
        focusedBorder: border(color: focusedBorderColor),
        errorBorder: border(color: errorBorderColor),
        focusedErrorBorder: border(color: errorBorderColor),
        suffixIcon: suffixIcon,
        suffixIconColor: iconColor,
        prefixIcon: prefixIcon,
        prefixIconColor: iconColor,
        hintText: hintText,
        hintStyle: GoogleFonts.getFont(
          font,
          textStyle: TextStyle(
              color: AppColors.subtextColor,
              fontSize: 0.016.sh,
              height: 0.0022.sh,
              fontWeight: fontweight ?? FontWeight.w400),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: contentPaddingVertical ?? 0.018.sh,
          horizontal: contentPaddinghorizontal ?? 0.04.sw,
        ),
      ),
    );
  }
}
