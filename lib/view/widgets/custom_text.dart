import 'package:flutter/material.dart';
import 'package:food_app/core/constant/colors.dart';
import 'package:food_app/core/constant/font_families.dart';

class CustomText extends StatelessWidget {
  final String text, fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  
  const CustomText(this.text,
      {Key? key,
      this.fontFamily = pr,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w400,
      this.color = black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color,
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight));
  }
}
