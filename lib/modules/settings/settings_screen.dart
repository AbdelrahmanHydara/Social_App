import 'package:flutter/material.dart';
import 'package:social_app/modules/auth/login/login_screen.dart';
import 'package:social_app/modules/auth/widget/custom_material_button.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';

class SettingsScreen extends StatelessWidget
{
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children:
          [
            IconButton(
              icon: const Icon(
                  Icons.brightness_4
              ),
              onPressed: ()
              {

              },
            ),
            CustomMaterialButtonAuth(
              text: 'Sign Out',
              onTap: ()
              {
                CacheHelper.removeData(key: 'uId').
                then((value)
                {
                  navigateAndFinish(context, const LoginScreen());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
