import 'package:flutter/material.dart';
import 'package:social_app/modules/auth/login/login_screen.dart';
import 'package:social_app/modules/auth/register/widget/custom_text_form_field.dart';
import 'package:social_app/modules/auth/widget/custom_app_bar.dart';
import 'package:social_app/modules/auth/widget/custom_text_body_1.dart';
import 'package:social_app/modules/auth/widget/custom_text_body_2.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/components/default_text_button.dart';
import 'package:social_app/shared/style/themes/app_colors/app_colors.dart';

class RegisterScreen extends StatelessWidget
{
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
        title: const CustomTextAppBarAuth(
          text: 'Sign Up',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children:
          [
            CustomTextBody1(
                text:'Create Account'),
            CustomTextBody2(
                text: 'Sign up now to communicate with friends'),
            CustomTextFormFieldRegister(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Text(
                  'Do have an account?',
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColors.primaryColorG5,
                  ),
                ),
                DefaultTextButton(
                  text: 'Sign In',
                  toUpperCase: false,
                  fontSize: 22,
                  onPressed: ()
                  {
                    navigateAndFinish(
                      context,const LoginScreen()
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
