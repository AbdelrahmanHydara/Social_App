import 'package:flutter/material.dart';

class CustomTextAppBarAuth extends StatelessWidget
{
  const CustomTextAppBarAuth({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context)
  {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}