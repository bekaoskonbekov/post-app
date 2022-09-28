import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFF);
final Color secondaryColor = Color(0xFF);
final appTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: primaryColor, centerTitle: true),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(primary: primaryColor),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor, foregroundColor: secondaryColor),
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primaryColor),
        iconColor: secondaryColor));
