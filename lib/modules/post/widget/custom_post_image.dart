import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';

class CustomPostImage extends StatelessWidget
{
  const CustomPostImage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state) {},
      builder: (context,state)
      {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.topRight,
            children:
            [
              Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: FileImage(SocialCubit.get(context).postImage!),
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
                      Icons.close_sharp,
                      size: 16,
                    ),
                    onPressed: ()
                    {
                      SocialCubit.get(context).removePostImage();
                    },
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
