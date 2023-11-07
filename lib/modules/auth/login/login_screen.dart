import 'package:flutter/material.dart';
import 'package:social_app/modules/auth/login/widget/custom_text_form_field.dart';
import 'package:social_app/modules/auth/register/register_screen.dart';
import 'package:social_app/modules/auth/widget/custom_app_bar.dart';
import 'package:social_app/modules/auth/widget/custom_text_body_1.dart';
import 'package:social_app/modules/auth/widget/custom_text_body_2.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/components/default_text_button.dart';
import 'package:social_app/shared/constants/constant.dart';
import 'package:social_app/shared/style/themes/app_colors/app_colors.dart';

class LoginScreen extends StatelessWidget
{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextAppBarAuth(
          text: 'Sign In',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children:
         [
           Image.asset(
               AppImageAssets.loginImage,
               height: 250,
           ),
           CustomTextBody1(
               text:'Welcome Back'),
           CustomTextBody2(
               text: 'Sign In Now With Your Email And Password'),
           CustomTextFormFieldLogin(),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children:
             [
               Text(
                 'Don\'t have an account?',
                 style: TextStyle(
                   fontSize: 22,
                   color: AppColors.primaryColorG5,
                 ),
               ),
               DefaultTextButton(
                 text: 'Sign Up',
                 toUpperCase: false,
                 fontSize: 22,
                 onPressed: ()
                 {
                   navigateAndFinish(
                       context,const RegisterScreen(),
                   );
                 },
               ),
             ],
           ),
         ],
        ),
      ),
    );
  }
}
