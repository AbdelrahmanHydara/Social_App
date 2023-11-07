import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';

class CustomHeadPost extends StatelessWidget
{
  const CustomHeadPost({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
        listener: (context,state) {},
        builder: (context,state)
        {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children:
              [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(SocialCubit.get(context).userModel!.image)
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    SocialCubit.get(context).userModel!.username,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 24,
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
