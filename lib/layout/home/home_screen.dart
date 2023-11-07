import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/home/widget/icons_home_screen.dart';
import 'package:social_app/modules/post/posts_screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state)
      {
        if(state is SocialNavigatePostScreenState)
        {
          navigate(context, const PostScreen());
        }
        // if(state is SocialNavigateProfileScreenState)
        // {
        //   navigate(context, const ProfileScreen());
        // }
      },
      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              SocialCubit.get(context).titles[ SocialCubit.get(context).currentIndex],
              style: Theme.of(context).textTheme.bodyText1,
            ),
            actions:
            const
            [
              IconsHomeScreen(),
            ],
          ),
          body: SocialCubit.get(context).screens[ SocialCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index)
            {
              SocialCubit.get(context).changeBottomNavBar(index);
            },
            currentIndex: SocialCubit.get(context).currentIndex,
            items:
            const
            [
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Home,
                  size: 30,
                  ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Chat,
                  size: 30,
                  ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Paper_Upload,
                  size: 30,
                  ),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Location,
                  size: 30,
                ),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Profile,
                  size: 30,
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
