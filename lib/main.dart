import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_app/modules/auth/login/login_screen.dart';
import 'package:social_app/shared/constants/constant.dart';
import 'package:social_app/shared/cubit/social/cubit.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';
import 'package:social_app/shared/style/themes/theme_data/light_theme.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await CacheHelper.init();

  Widget widget;

  uId = CacheHelper.getData(key: 'uId');

  if(uId != null)
  {
    widget = const HomeScreen();
  } else
  {
    widget = const LoginScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
   const MyApp({super.key, required this.startWidget});

   final Widget startWidget;

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) =>
      SocialCubit()..getUserData()..getPostData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        // theme: darkTheme,
        // themeMode: ThemeMode.dark,
        home: startWidget,
      ),
    );
  }
}

