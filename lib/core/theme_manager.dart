import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    disabledColor: ColorManager.grey,
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey,
      splashColor: ColorManager.primary,
      buttonColor: ColorManager.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(ColorManager.primary),
        shape: WidgetStateProperty.all<StadiumBorder>(const StadiumBorder()),
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(
            color: ColorManager.white,
            fontSize: FontSizeManager.size16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      // for category of food
      labelSmall: getLightStyle(color: ColorManager.black),
      // for tab bar in details
      labelMedium: getMediumStyle(
          color: ColorManager.black, fontSize: FontSizeManager.size18),
      // for name the food in details
      titleMedium: getSemiboldStyle(
          color: ColorManager.black, fontSize: FontSizeManager.size20),
      // for title food in home page
      titleSmall: getSemiboldStyle(
          color: ColorManager.black, fontSize: FontSizeManager.size18),
      // for description
      bodyMedium: getMediumStyle(
          color: ColorManager.black, fontSize: FontSizeManager.size16),
      // for button
      displayMedium: getMediumStyle(
          color: ColorManager.black, fontSize: FontSizeManager.size24),
    ),
  );
}
