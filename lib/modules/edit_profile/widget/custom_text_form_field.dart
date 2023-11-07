import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/components/default_text_form_field.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';
import 'package:social_app/shared/style/themes/app_colors/app_colors.dart';

class CustomTextFormField extends StatelessWidget
{
  CustomTextFormField({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    SocialCubit.get(context).nameController.text =
        SocialCubit.get(context).userModel!.username;
    SocialCubit.get(context).bioController.text =
        SocialCubit.get(context).userModel!.bio;
    SocialCubit.get(context).phoneController.text =
        SocialCubit.get(context).userModel!.phone;

    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state) {},
      builder: (context,state)
      {
        return Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 10,
            end: 10,
            top: 30,
          ),
          child: Form(
            child: Column(
              key: formKey,
              children:
              [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: defaultTextFormField(
                    controller: SocialCubit.get(context).nameController,
                    color: AppColors.primaryColor,
                    type: TextInputType.name,
                    suffix: IconBroken.Profile,
                    labelText: 'Name',
                    hintText: 'Enter Your Name',
                    validate: (value)
                    {
                      if (value == null || value.isEmpty)
                      {
                        return 'Please enter Username';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 20,
                ),
                  child: defaultTextFormField(
                    controller: SocialCubit.get(context).bioController,
                    color: AppColors.primaryColor,
                    type: TextInputType.text,
                    suffix: IconBroken.Info_Circle,
                    labelText: 'Bio',
                    hintText: 'Enter Your Bio',
                    validate: (value)
                    {
                      if (value == null || value.isEmpty)
                      {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 20,
                ),
                  child: defaultTextFormField(
                    controller: SocialCubit.get(context).phoneController,
                    color: AppColors.primaryColor,
                    type: TextInputType.phone,
                    suffix: IconBroken.Call,
                    labelText: 'Phone',
                    hintText: 'Enter Your Phone',
                    validate: (value)
                    {
                      if (value == null || value.isEmpty)
                      {
                        return 'Please enter your phone number';
                      }
                      if(value.length > 11)
                      {
                        return 'Please enter phone number 11';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
