import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/themes/colors.dart';
import 'package:news_app/themes/themes.dart';

import 'constants/constants.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500)).then((value) =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const HomePage())));

    return Container(
      color: Theme.of(context).brightness == Brightness.dark
          ? colorArsenic92
          : colorWhite,
      padding: const EdgeInsets.all(48),
      alignment: Alignment.center,
      child: Lottie.asset('assets/news.json'),
    );
  }
}
