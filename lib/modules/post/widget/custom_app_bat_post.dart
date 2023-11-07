import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/components/default_icon_button_back.dart';
import 'package:social_app/shared/components/default_text_button.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';

class CustomAppBarPost extends StatelessWidget
{
  const CustomAppBarPost({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state) {},
      builder: (context,state)
      {
        return Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            vertical: 10,
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
                'Create Post',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 10),
                child: DefaultTextButton(
                  text: 'Post',
                  toUpperCase: true,
                  fontSize: 20,
                  onPressed: ()
                  {
                    if( SocialCubit.get(context).postImage == null)
                    {
                      SocialCubit.get(context).createPost(
                        text: SocialCubit.get(context).textController.text,
                        dateTime: SocialCubit.get(context).dateTime.toString(),
                      );
                    } else
                    {
                      SocialCubit.get(context).uploadPostImage(
                        text: SocialCubit.get(context).textController.text,
                        dateTime: SocialCubit.get(context).dateTime.toString(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
