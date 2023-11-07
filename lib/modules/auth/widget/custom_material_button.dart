import 'package:flutter/material.dart';
import 'package:social_app/shared/components/default_material_button.dart';

class CustomMaterialButtonAuth extends StatelessWidget
{
  const CustomMaterialButtonAuth({Key? key, required this.text, required this.onTap}) : super(key: key);

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 24,
        bottom: 16,
      ),
      child: defaultMaterialButton(
        onTap: onTap,
        text: text,
        width: double.infinity,
        height: 50,
        radius: 30,
      ),
    );
  }
}
