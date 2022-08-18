import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  late String text;
  late double? fontSize;
  late FontWeight? fontWeight;
  late Color? color;
  late Alignment alignment;
  late BuildContext context;
  late TextAlign? textAlign;

  CustomText({
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.alignment = Alignment.topLeft,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
