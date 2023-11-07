import 'package:flutter/material.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';

Widget defaultIconButtonBack({
  required BuildContext context,
}) => IconButton(
  onPressed: ()
  {
    Navigator.pop(context);
  },
  icon: const Icon(
    IconBroken.Arrow___Left_2 ,
    color: Colors.black,
    size: 30,
  ),
);