import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';

class CustomEditImageAndCover extends StatelessWidget
{
  const CustomEditImageAndCover({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state) {},
      builder: (context,state)
      {
        return SizedBox(
          height: 260,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children:
            [
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children:
                  [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        image: DecorationImage(
                          image: SocialCubit.get(context).coverImage == null ?
                          NetworkImage(SocialCubit.get(context).userModel!.cover) :
                          FileImage(SocialCubit.get(context).coverImage!) as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        radius: 20,
                        child: IconButton(
                            icon: const Icon(
                              IconBroken.Camera,
                              size: 18,
                            ),
                          onPressed: ()
                          {
                            SocialCubit.get(context).getCoverImage();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children:
                [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 10,
                    ),
                    child: CircleAvatar(
                      radius: 85,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage:
                        SocialCubit.get(context).profileImage == null ?
                        NetworkImage(SocialCubit.get(context).userModel!.image) :
                        FileImage(SocialCubit.get(context).profileImage!) as ImageProvider,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: CircleAvatar(
                      radius: 20,
                      child: IconButton(
                        icon: const Icon(
                          IconBroken.Camera,
                          size: 18,
                        ),
                        onPressed: ()
                        {
                          SocialCubit.get(context).getProfileImage();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
