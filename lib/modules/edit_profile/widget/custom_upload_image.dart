import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/components/default_material_button.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';

class CustomUploadImage extends StatelessWidget
{
  const CustomUploadImage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state) {},
      builder: (context,state)
      {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children:
            [
              if(SocialCubit.get(context).coverImage != null)
                Expanded(
                  child: Column(
                    children:
                    [
                      defaultMaterialButton(
                        onTap: ()
                        {
                          SocialCubit.get(context).uploadCoverImage(
                            username: SocialCubit.get(context).nameController.text,
                            phone: SocialCubit.get(context).phoneController.text,
                            bio: SocialCubit.get(context).bioController.text,
                          );
                        },
                        text: 'Upload Cover',
                        height: 40,
                        radius: 30,
                      ),
                      if(state is SocialUpdateUserLoadingState)
                        const SizedBox(
                            height: 8,
                        ),
                      if(state is SocialUpdateUserLoadingState)
                        const LinearProgressIndicator(),
                    ],
                  ),
                ),
              const SizedBox(
                width: 5.0,
              ),
              if(SocialCubit.get(context).profileImage != null)
                Expanded(
                  child: Column(
                    children:
                    [
                      defaultMaterialButton(
                        onTap: ()
                        {
                          SocialCubit.get(context).uploadProfileImage(
                            username: SocialCubit.get(context).nameController.text,
                            phone: SocialCubit.get(context).phoneController.text,
                            bio: SocialCubit.get(context).bioController.text,
                          );
                        },
                        text: 'Upload Profile',
                        height: 40,
                        radius: 30,
                      ),
                      if(state is SocialUpdateUserLoadingState)
                        const SizedBox(
                          height: 8,
                        ),
                      if(state is SocialUpdateUserLoadingState)
                        const LinearProgressIndicator(),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
