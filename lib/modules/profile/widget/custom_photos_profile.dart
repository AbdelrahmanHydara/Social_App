import 'package:flutter/material.dart';

class CustomPhotosProfile extends StatelessWidget
{
  const CustomPhotosProfile({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 30),
      child: Column(
        children:
        [
          Container(
            width: double.infinity,
            height: 44,
            decoration: BoxDecoration(
              color : Colors.grey[50],
            ),
            child: Text(
              'Photos',
              style: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
