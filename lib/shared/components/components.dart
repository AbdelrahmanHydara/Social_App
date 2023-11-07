import 'package:flutter/material.dart';

navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,)
      ,(route)
      {
        return false;
      },
    );

navigate(
    context,
    widget,) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

Widget myDivider() => Container(
  width: double.infinity,
  height: 1,
  color: Colors.grey[400],
);