import 'package:flutter/material.dart';
import 'package:social_app/modules/edit_profile/edit_profile_screen.dart';
import 'package:social_app/modules/settings/settings_screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';
import 'package:social_app/shared/style/themes/app_colors/app_colors.dart';

class CustomEditProfile extends StatelessWidget
{
  const CustomEditProfile({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 10,
      ),
      child: Row(
        children:
        [
          Expanded(
            child: OutlinedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
              ),
              onPressed: ()
              {
                navigate(context, const EditProfileScreen(),);
              },
              child: const Row(
                children:
                [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 2.5,
                  ),
                  Text(
                    'Add to story',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: OutlinedButton(
              onPressed: ()
              {
                navigate(context, const EditProfileScreen(),);
              },
              child: const Row(
                children:
                [
                  Icon(
                    Icons.edit,
                  ),
                  SizedBox(
                    width: 2.5,
                  ),
                  Text(
                    'Edit profile',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          OutlinedButton(
            onPressed: ()
            {
              navigate(context, const SettingsScreen());
            },
            child: const Icon(
              IconBroken.Setting,
              size: 22.0,
            ),
          ),
        ],
      ),
    );
  }
}
