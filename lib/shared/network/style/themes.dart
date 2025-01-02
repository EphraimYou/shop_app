import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

/* -------------------------------------------------------------------------- */
/*                                 light thems                                */
/* -------------------------------------------------------------------------- */
ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    bodyLarge: TextStyle(
        fontSize: 48, fontWeight: FontWeight.w700, color: primaryColor),
  ),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
  progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryColor, circularTrackColor: subtextColor),
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 50,
      selectedItemColor: primaryColor,
      unselectedItemColor: secondaryColor,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        color: primaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      )),
);
/* -------------------------------------------------------------------------- */
/*                                 dark theme                                 */
/* -------------------------------------------------------------------------- */
ThemeData darkTheme = ThemeData();
