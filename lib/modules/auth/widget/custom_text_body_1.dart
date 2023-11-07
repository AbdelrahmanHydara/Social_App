import 'package:flutter/material.dart';

class CustomTextBody1 extends StatelessWidget
{
  CustomTextBody1({super.key, required this.text});

  final String text;
  double fontSize = 48;

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 18),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
