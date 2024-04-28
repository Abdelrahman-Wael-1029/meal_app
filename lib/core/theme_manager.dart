import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.background,
    appBarTheme:  const AppBarTheme(
      backgroundColor: ColorManager.background,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorManager.black),
      titleTextStyle: TextStyle(
        color: ColorManager.black,
        fontSize: FontSizeManager.size24,
        fontWeight: FontWeight.bold,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primary,
    ),
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
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
        backgroundColor: WidgetStateProperty.all<Color>(ColorManager.primary),
        foregroundColor: WidgetStateProperty.all<Color>(ColorManager.white),
        shape: WidgetStateProperty.all<StadiumBorder>(const StadiumBorder()),
        textStyle: WidgetStateProperty.all<TextStyle>(
          getMediumStyle(
              color: ColorManager.black, fontSize: FontSizeManager.size14),
        ),
      ),
    ),
    textTheme: TextTheme(
      // for category of food
      labelSmall: getMediumStyle(
          color: ColorManager.black, fontSize: FontSizeManager.size14),
      // for tab bar in details
      labelMedium: getMediumStyle(
          color: ColorManager.black, fontSize: FontSizeManager.size12),
      // for name the food in details
      titleMedium: getSemiboldStyle(
          color: ColorManager.black, fontSize: FontSizeManager.size24),
      // for title food in home page
      headlineMedium: getSemiboldStyle(
          color: ColorManager.black, fontSize: FontSizeManager.size16),
      // for description
      bodyMedium: getMediumStyle(
          color: ColorManager.black, fontSize: FontSizeManager.size14),
      // for button
      displayMedium: getMediumStyle(
          color: ColorManager.black, fontSize: FontSizeManager.size24),
    ),
    bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.background,
      elevation: 10,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.lightblack,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: ColorManager.white,
      // remove dividers and indicator
      indicator: BoxDecoration(
        color: ColorManager.lightblack,
        // circular border radius
        borderRadius: BorderRadius.circular(50),
      ),
      dividerHeight: 0,
    ),
  );
}
