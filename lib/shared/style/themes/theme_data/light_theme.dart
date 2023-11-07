import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/shared/style/themes/app_colors/app_colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.defaultBackground,
  appBarTheme: const AppBarTheme(
    color: AppColors.defaultBackground,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.deepPurple,
    elevation: 0,
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: Colors.grey,
  ),
  primarySwatch: AppColors.primaryColor,
  primaryColor: AppColors.primaryColor,
  textTheme: TextTheme(
    headline1: TextStyle(
      color: AppColors.primaryColorG5,
      fontWeight: FontWeight.w700,
      fontSize: 28,
    ),
    headline2: const TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontSize: 18,
    ),
    bodyText1: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 30,
    ),
  ),
);