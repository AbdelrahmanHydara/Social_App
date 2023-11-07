import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/profile/widget/custom_edit_profile.dart';
import 'package:social_app/modules/profile/widget/custom_followers.dart';
import 'package:social_app/modules/profile/widget/custom_image_profile.dart';
import 'package:social_app/modules/profile/widget/custom_photos_profile.dart';
import 'package:social_app/modules/profile/widget/custom_username_bio.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';

class ProfileScreen extends StatelessWidget
{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state) {},
      builder: (context,state)
      {
        return ConditionalBuilder(
          condition: state is! SocialGetUserDataLoadingState,
          builder: (context) => ListView(
            physics: const BouncingScrollPhysics(),
            children:
            const
            [
              CustomImageProfile(),
              CustomUserNameAndBio(),
              CustomFollowers(),
              CustomEditProfile(),
              // CustomPhotosProfile(),
            ],
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
