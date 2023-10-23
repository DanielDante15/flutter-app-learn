import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkButtom extends StatelessWidget {
  const LinkButtom(
      {super.key,
      required this.text,
      required this.onTap,
      required this.fontSize,
      required this.color,
      this.fontWeight});
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              onTap();
            }),
    );
  }
}
