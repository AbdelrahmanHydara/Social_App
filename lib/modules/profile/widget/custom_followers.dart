import 'package:flutter/material.dart';

class CustomFollowers extends StatelessWidget
{
  const CustomFollowers({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 25,
        start: 10,
        bottom: 25,
      ),
      child: Row(
        children:
        [
          Row(
            children:
            [
              const Text(
                '121',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                'Following',
                style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10.0,
          ),
          Row(
            children:
            [
              const Text(
                '826K',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                'Followers',
                style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
