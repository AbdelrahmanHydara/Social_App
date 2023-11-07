import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';
import 'package:social_app/shared/style/themes/app_colors/app_colors.dart';

class CustomUserNameAndBio extends StatelessWidget
{
  const CustomUserNameAndBio({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state) {},
      builder: (context,state)
      {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 16,
                start: 10,
              ),
              child: Row(
                children:
                [
                  Text(
                    SocialCubit.get(context).userModel!.username,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.primaryColor,
                    size: 20.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 10,
                start: 10,
              ),
              child: Text(
                SocialCubit.get(context).userModel!.bio,
                style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
