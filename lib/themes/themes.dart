import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/themes/colors.dart';

import '../constants/constants.dart';

final lightTheme = ThemeData(
  primarySwatch: primarySwatchLight,
  scaffoldBackgroundColor: colorGrey100,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: colorWhite,
    titleTextStyle: fontStyleLight.copyWith(fontSize: 18),
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: fontStyleLight,
    unselectedLabelStyle: fontStyleLight,
    labelColor: colorBlack,
    indicatorSize: TabBarIndicatorSize.label,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: colorBlack,
    circularTrackColor: colorGrey,
    refreshBackgroundColor: colorBlack,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: colorWhite,
    selectedItemColor: colorBlack,
    unselectedItemColor: colorGrey,
    selectedIconTheme: const IconThemeData(color: colorBlack),
    unselectedIconTheme: const IconThemeData(color: colorGrey),
    selectedLabelStyle: fontStyleLight,
    unselectedLabelStyle: fontStyleLight,
  ),
  textTheme: TextTheme(
    headlineLarge: fontStyleLight.copyWith(fontSize: 18),
    headlineMedium: fontStyleLight.copyWith(fontSize: 16),
    headlineSmall: fontStyleLight.copyWith(fontSize: 14),
  ),
);

final darkTheme = ThemeData(
  primarySwatch: primarySwatchDark,
  scaffoldBackgroundColor: colorBlack87,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: colorArsenic92,
    titleTextStyle: fontStyleDark.copyWith(fontSize: 18),
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: fontStyleDark,
    unselectedLabelStyle: fontStyleDark,
    labelColor: colorWhite,
    indicatorSize: TabBarIndicatorSize.label,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: colorArsenic92,
    selectedItemColor: colorWhite,
    unselectedItemColor: colorGrey,
    selectedIconTheme: const IconThemeData(color: colorWhite),
    unselectedIconTheme: const IconThemeData(color: colorGrey),
    selectedLabelStyle: fontStyleDark,
    unselectedLabelStyle: fontStyleDark,
  ),
  textTheme: TextTheme(
    headlineLarge: fontStyleDark.copyWith(fontSize: 18),
    headlineMedium: fontStyleDark.copyWith(fontSize: 16),
    headlineSmall: fontStyleDark.copyWith(fontSize: 14),
  ),
);

final fontStyleLight =
    GoogleFonts.getFont(lato, fontWeight: FontWeight.bold, color: colorBlack);

final fontStyleDark = fontStyleLight.copyWith(color: colorWhite);
