import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/post/widget/custom_app_bat_post.dart';
import 'package:social_app/modules/post/widget/custom_head_post.dart';
import 'package:social_app/modules/post/widget/custom_post_image.dart';
import 'package:social_app/modules/post/widget/custom_text_bottom.dart';
import 'package:social_app/modules/post/widget/custom_text_form_filed_post.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/cubit/social/states.dart';

class PostScreen extends StatelessWidget
{
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
        listener: (context,state) {},
        builder: (context,state)
        {
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers:
                [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children:
                      [
                        const CustomAppBarPost(),
                        if(state is SocialCreatePostLoadingState )
                          const Padding(
                            padding: EdgeInsetsDirectional.symmetric(
                              horizontal: 16,
                            ),
                            child: LinearProgressIndicator(),
                          ),
                        const CustomHeadPost(),
                        Expanded(
                            child: CustomTextFormFiledPost()),
                        if(SocialCubit.get(context).postImage != null)
                         const CustomPostImage(),
                        const CustomTextButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
