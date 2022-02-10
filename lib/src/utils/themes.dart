/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-10 12:48:21 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-10 15:28:53
 */

import 'package:flutter/material.dart';
import 'package:positioncollect/src/utils/colors.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: whiteColor,
      primaryColor: primaryColor,
      backgroundColor: whiteColor,
      canvasColor: transparent,
      primaryIconTheme: const IconThemeData(color: blackColor),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: blackColor,
        ),
        bodyText2: TextStyle(
          color: blackColor,
          fontSize: 18,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
          .copyWith(secondary: accentPrimaryColor),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: accentPrimaryColor),
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: blackColor,
      primaryColor: primaryColor,
      backgroundColor: blackColor,
      canvasColor: transparent,
      primaryIconTheme: const IconThemeData(color: whiteColor),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: whiteColor,
        ),
        bodyText2: TextStyle(
          color: whiteColor,
          fontSize: 18,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
          .copyWith(secondary: accentPrimaryColor),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: accentPrimaryColor),
    )
  };
}

enum AppTheme {
  lightTheme,
  darkTheme,
}
