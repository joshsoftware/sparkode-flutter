import 'package:flutter/material.dart';
import 'package:sparkode/utility/constants/colors.dart';

import 'constant.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      fontFamily: Constants.kAppFonts.kFontFamily,
      textTheme: const TextTheme(
        headline5: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: AppColors.textColorPrimary,
        ),
        headline4: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: AppColors.textColorPrimary,
        ),
        headline3: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.textColorPrimary,
        ),
        headline2: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textColorPrimary,
        ),
        headline1: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w200,
          color: AppColors.textColorPrimary,
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
