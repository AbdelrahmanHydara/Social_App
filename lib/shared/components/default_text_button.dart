import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget
{
  const DefaultTextButton({super.key,required this.onPressed,required this.text, required this.fontSize, required this.toUpperCase});

  final Function() onPressed;
  final String text;
  final double fontSize;
  final bool toUpperCase;

  @override
  Widget build(BuildContext context)
  {
    return TextButton(
      onPressed: onPressed ,
      child: Text(
        toUpperCase? text.toUpperCase() : text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
