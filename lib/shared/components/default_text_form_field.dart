import 'package:flutter/material.dart';
import 'package:social_app/shared/style/themes/app_colors/app_colors.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required String labelText,
  required String hintText,
  IconData? prefix,
  required Color color,
  Function(String)? onChange,
  Function(String)? onSubmit,
  Function()? onTap,
  required String? Function(String?) validate,
  required TextInputType type,
  bool isPassword = false,
  Function()? suffixPressed,
  IconData? suffix,
})
=> TextFormField(
  controller: controller,
  decoration: InputDecoration(
      label: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
            labelText,
        ),
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 14,
        color: AppColors.primaryColorG5,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14,),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefixIcon: Icon(
        prefix,
        color: color,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          suffix,
        ),
        onPressed: suffixPressed ,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      )
  ),
  obscureText: isPassword,
  onTap: onTap,
  keyboardType: type,
  onChanged: onChange,
  onFieldSubmitted: onSubmit,
  validator: (String? value)
  {
    return validate(value);
  },
);