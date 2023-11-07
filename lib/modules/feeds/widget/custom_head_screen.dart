import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/post/posts_screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';
import 'package:social_app/shared/style/themes/app_colors/app_colors.dart';

class CustomHeadScreen extends StatelessWidget
{
  const CustomHeadScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state) {},
      builder: (context,state)
      {
        return Row(
          children:
          [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  SocialCubit.get(context).userModel!.image,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: InkWell(
                onTap: ()
                {
                  navigate(context, const PostScreen());
                },
                child: Container(
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 20,
                    ),
                    child: Text(
                      'What\'s on your mind ?',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            const Icon(
              IconBroken.Image,
              size: 30,
              color: AppColors.primaryColor,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        );
      },
    );
  }
}


