import 'package:flutter/material.dart';
import 'package:social_app/shared/style/themes/app_colors/app_colors.dart';

class CustomTextBody2 extends StatelessWidget
{
  CustomTextBody2({super.key, required this.text});

  final String text;
  double fontSize = 20;

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 18),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primaryColorG5,
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
