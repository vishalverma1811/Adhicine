import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_ui/theme/app_color.dart';

class CommonText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Color decorationColor;
  final TextDecoration textDecoration;
  final int maxLine;
  final String fonts;
  List<TextSpan>? children;
  CommonText(
      {super.key,
      required this.text,
      this.color = AppColors.whiteColor,
      this.fontSize = 14,
      this.maxLine = 10,
      this.decorationColor = AppColors.whiteColor,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.w400,
      this.fonts = "Poppins",
      this.children,
      this.textDecoration = TextDecoration.none});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: text,
          style: GoogleFonts.getFont(
            fonts,
            textStyle: TextStyle(
                // fontFamily: fonts,
                decoration: textDecoration,
                // fontSize: fontSize + 0.002.sh,
                fontSize: fontSize,
                color: color,
                fontWeight: fontWeight,
                decorationColor: decorationColor),
          ),
          children: children),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
    );
  }
}
