import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/ui/theme/colors/dark_color.dart';

import 'colors/light_color.dart';

enum ThemeType { LIGHT, DARK }

class AppTheme {
  const AppTheme._();
  static ThemeData lightTheme = ThemeData(
    backgroundColor: LightColor.background,
    primaryColor: LightColor.primaryColor,
    cardTheme: CardTheme(color: LightColor.background),
    iconTheme: IconThemeData(color: LightColor.iconColor),
    bottomAppBarColor: LightColor.bottomAppBarColor,
    dividerColor: LightColor.grey,
    cardColor: LightColor.primaryExtraLightColor,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: LightColor.primaryColor,
    ),
    disabledColor: LightColor.grey,
    primaryTextTheme: TextTheme(
        bodyText1: TextStyle(
      color: LightColor.titleTextColor,
    )),
    brightness: Brightness.light,
    tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.symmetric(vertical: 16),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: LightColor.buttonColor,
      disabledColor: LightColor.disableButtonColor,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: IconThemeData(
      color: LightColor.secondaryColor
    ),
    colorScheme: ColorScheme(
        primary: LightColor.primaryColor,
        primaryVariant: LightColor.primaryLightColor,
        secondary: LightColor.secondaryColor,
        secondaryVariant: LightColor.secondaryLightColor,
        surface: LightColor.background,
        background: LightColor.background,
        error: Colors.red,
        onPrimary: LightColor.titleTextColor,
        onSecondary: LightColor.black,
        onSurface: LightColor.titleTextColor,
        onBackground: LightColor.titleTextColor,
        onError: LightColor.titleTextColor,
        brightness: Brightness.dark),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: LightColor.titleTextColor),
      subtitle1: TextStyle(
        color: LightColor.subTitleTextColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    backgroundColor: DarkColor.background,
    primaryColor: DarkColor.primaryColor,
    primaryColorDark: DarkColor.Darker,
    primaryColorLight: DarkColor.Brighter,
    appBarTheme:
        AppBarTheme(brightness: Brightness.dark, color: DarkColor.Brighter),
    tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.symmetric(vertical: 16),
    ),
    // cardTheme: CardTheme(color: DarkColor.background),
    buttonTheme: ButtonThemeData(
        buttonColor: DarkColor.buttonColor,
        disabledColor: DarkColor.disableButtonColor,
        textTheme: ButtonTextTheme.normal),
    bottomAppBarColor: DarkColor.bottomAppBarColor,
     primaryIconTheme: IconThemeData(
      color: DarkColor.secondaryColor
    ),
    colorScheme: ColorScheme(
        primary: DarkColor.primaryColor,
        primaryVariant: DarkColor.primaryLightColor,
        secondary: DarkColor.secondaryColor,
        secondaryVariant: DarkColor.secondaryLightColor,
        surface: DarkColor.background,
        background: DarkColor.background,
        error: Colors.red,
        onPrimary: DarkColor.titleTextColor,
        onSecondary: DarkColor.white,
        onSurface: DarkColor.titleTextColor,
        onBackground: DarkColor.titleTextColor,
        onError: DarkColor.titleTextColor,
        brightness: Brightness.dark),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Color(0xffd1d1d0)),
      subtitle1: TextStyle(
        color: DarkColor.subTitleTextColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(color: DarkColor.lightGrey),
    brightness: Brightness.dark,
  );

  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 16,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static ThemeData getThemeFromKey(ThemeType themeKey) {
    switch (themeKey) {
      case ThemeType.LIGHT:
        return lightTheme;
      case ThemeType.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
