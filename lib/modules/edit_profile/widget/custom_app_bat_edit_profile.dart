import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/components/default_icon_button_back.dart';
import 'package:social_app/shared/components/default_text_button.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';

class CustomAppBarEditProfile extends StatelessWidget
{
  const CustomAppBarEditProfile({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state) {},
      builder: (context,state)
      {
        return Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Row(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(0),
                child: defaultIconButtonBack(
                  context: context,
                ),
              ),
              Text(
                'Edit Profile',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 10),
                child: DefaultTextButton(
                  text: 'Update',
                  onPressed: ()
                  {
                    SocialCubit.get(context).updateUser(
                      username: SocialCubit.get(context).nameController.text,
                      bio: SocialCubit.get(context).bioController.text,
                      phone: SocialCubit.get(context).phoneController.text,
                    );
                  },
                  toUpperCase: true,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
