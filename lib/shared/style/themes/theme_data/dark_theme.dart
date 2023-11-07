import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/shared/style/themes/app_colors/app_colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xff2D4356),
  appBarTheme: const AppBarTheme(
    color: Color(0xff2D4356),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xff2D4356),
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xff2D4356),
    elevation: 0,
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: Colors.grey,
  ),
  primarySwatch: AppColors.primaryColor,
  textTheme: const TextTheme(
    headline1:TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 28,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 18,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 34,
      color: Colors.white,
    ),
    caption: TextStyle(
      color: Colors.white,
    ),
  ),
  cardColor: const Color(0xff2D4356),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  // fontFamily: 'PlayfairDisplay',
);