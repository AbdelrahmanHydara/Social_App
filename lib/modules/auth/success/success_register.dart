import 'package:flutter/material.dart';
import 'package:social_app/modules/auth/login/login_screen.dart';
import 'package:social_app/modules/auth/widget/custom_app_bar.dart';
import 'package:social_app/modules/auth/widget/custom_material_button.dart';
import 'package:social_app/modules/auth/widget/custom_text_body_1.dart';
import 'package:social_app/modules/auth/widget/custom_text_body_2.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';
import 'package:social_app/shared/style/themes/app_colors/app_colors.dart';

class SuccessRegisterScreen extends StatelessWidget
{
  const SuccessRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextAppBarAuth(
            text: 'Success Sign In'
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            children:
            [
              Expanded(
                child: ListView(
                  children:
                  [
                    const Icon(
                      IconBroken.Shield_Done,
                      size: 350,
                      color: AppColors.primaryColor,
                    ),
                    CustomTextBody1(
                      text: 'Congratulations',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextBody2(
                      text: 'Successfully Registered',
                    ),
                  ],
                ),
              ),
              CustomMaterialButtonAuth(
                onTap: ()
                {
                  navigateAndFinish(context, const LoginScreen());
                },
                text: 'Go To Sign Up',
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}