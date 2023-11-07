import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';

class CustomTextButton extends StatelessWidget
{
  const CustomTextButton({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state) {},
      builder: (context,state)
      {
        return Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 16,
            bottom: 16,
            end: 20,
          ),
          child: Row(
            children:
            [
              Expanded(
                child: TextButton(
                  onPressed: ()
                  {
                    SocialCubit.get(context).getPostImage();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Icon(
                        IconBroken.Image,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Add Photo/Video',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: ()
                  {

                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Icon(
                        IconBroken.Add_User,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Tag People',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
