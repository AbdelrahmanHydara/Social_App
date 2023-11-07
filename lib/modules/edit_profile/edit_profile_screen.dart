import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/edit_profile/widget/custom_app_bat_edit_profile.dart';
import 'package:social_app/modules/edit_profile/widget/custom_edit_image_and_cover.dart';
import 'package:social_app/modules/edit_profile/widget/custom_text_form_field.dart';
import 'package:social_app/modules/edit_profile/widget/custom_upload_image.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';

class EditProfileScreen extends StatelessWidget
{
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state) {},
      builder: (context,state)
      {
        return Scaffold(
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children:
            [
              const CustomAppBarEditProfile(),
               if(state is SocialUpdateUserLoadingState)
                 const Padding(
                   padding: EdgeInsetsDirectional.symmetric(
                     vertical: 10 ,
                   ),
                   child: LinearProgressIndicator(),
                 ),
              const CustomEditImageAndCover(),
               if(SocialCubit.get(context).coverImage != null || SocialCubit.get(context).profileImage != null)
                 const CustomUploadImage(),
              CustomTextFormField(),
            ],
          ),
        );
      },
    );
  }
}
