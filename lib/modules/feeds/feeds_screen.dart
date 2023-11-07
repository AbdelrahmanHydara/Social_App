import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/feeds/widget/custom_card_screen.dart';
import 'package:social_app/modules/feeds/widget/custom_head_screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';

class FeedsScreen extends StatelessWidget
{
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state) {},
      builder: (context,state)
      {
        return ConditionalBuilder(
            condition: SocialCubit.get(context).posts.isNotEmpty &&
                       SocialCubit.get(context).userModel != null,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children:
                  [
                    const CustomHeadScreen(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: myDivider(),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index) => buildPostItem(SocialCubit.get(context).posts[index],context,index),
                      separatorBuilder: (context,index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: SocialCubit.get(context).posts.length,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ]
              ),
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}


