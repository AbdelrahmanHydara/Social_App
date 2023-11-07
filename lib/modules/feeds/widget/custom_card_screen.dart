import 'package:flutter/material.dart';
import 'package:social_app/models/post_model.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';
import 'package:social_app/shared/style/themes/app_colors/app_colors.dart';

Widget buildPostItem(PostModel model,context,index)
{
  return Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    margin: EdgeInsets.zero,
    elevation: 8,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Row(
            children:
            [
              CircleAvatar(
                radius: 34.0,
                backgroundImage: NetworkImage(
                  model.image,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Row(
                      children:
                      [
                        Text(
                          model.username,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        const Icon(
                          Icons.check_circle,
                          color: AppColors.primaryColor,
                          size: 16.0,
                        ),
                      ],
                    ),
                    Text(
                      model.dateTime,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        height: 2.5,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconBroken.More_Circle,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: myDivider(),
          ),
          Text(
            model.text,
            style: Theme.of(context).textTheme.headline2!.copyWith(
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
          if(model.postImage != '')
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 15,
              ),
              child: Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(
                      model.postImage,
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              children:
              [
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Row(
                        children:
                        [
                          const Icon(
                            IconBroken.Heart,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${SocialCubit.get(context).likes[index]}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:
                        [
                          const Icon(
                            IconBroken.Chat,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '0 comment',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          myDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children:
              [
                Expanded(
                  child: InkWell(
                    child: Row(
                      children:
                      [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                            SocialCubit.get(context).userModel!.image,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'write a comment ...',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                InkWell(
                  child: Row(
                    children:
                    [
                      const Icon(
                        IconBroken.Heart,
                        color: AppColors.primaryColor,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Like',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  onTap: ()
                  {
                    SocialCubit.get(context).
                    likePost(SocialCubit.get(context).postId[index]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


