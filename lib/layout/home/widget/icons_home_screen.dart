import 'package:flutter/material.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';

class IconsHomeScreen extends StatelessWidget
{
  const IconsHomeScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Row(
      children:
      [
        IconButton(
          icon: const Icon(
            IconBroken.Notification,
            color: Colors.black,
            size: 30.0,
          ),
          onPressed: ()
          {

          },
        ),
        IconButton(
          icon: const Icon(
            IconBroken.Search,
            color: Colors.black,
            size: 30.0,
          ),
          onPressed: ()
          {

          },
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
