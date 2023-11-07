import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/constants/auto_direction.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';

class CustomTextFormFiledPost extends StatelessWidget
{
  CustomTextFormFiledPost({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
        listener: (context,state) {},
        builder: (context,state)
        {
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: AutoDirection(
              onDirectionChange: (isRTL)
              {
                SocialCubit.get(context).onDirectionChange(isRTL);
              },
              text: SocialCubit.get(context).text,
              child: TextFormField(
                controller: SocialCubit.get(context).textController,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
                cursorHeight: 20,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'What\'s on your mind ${SocialCubit.get(context).userModel!.username}?',
                  border: InputBorder.none,
                ),
                onChanged: (value)
                {
                  SocialCubit.get(context).onChanged(value);
                },
              ),
            ),
          );
        },
    );
  }
}
