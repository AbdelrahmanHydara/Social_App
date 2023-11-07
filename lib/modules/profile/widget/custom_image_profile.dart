import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';

class CustomImageProfile extends StatelessWidget
{
  const CustomImageProfile({super.key});

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
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(SocialCubit.get(context).userModel!.cover),
                      fit: BoxFit.cover,
                    ),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 10,
                ),
                child: CircleAvatar(
                  radius: 85,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(SocialCubit.get(context).userModel!.image),
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
