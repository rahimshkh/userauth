import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'text_field_decoration.dart';
import 'text_styles.dart';

ThemeData themeData = ThemeData(
  primaryColor: CustomColors.kPrimaryColor,
  brightness: Brightness.light,
  cardTheme: const CardTheme(color: CustomColors.kCardBGColor, elevation: 5),
  textTheme: textTheme,
  inputDecorationTheme: inputDecorationTheme,
  colorScheme: const ColorScheme(
    background: CustomColors.kScaffoldBGColor,
    brightness: Brightness.light,
    primary: CustomColors.kPrimaryColor,
    onPrimary: CustomColors.kOnPrimaryColor,
    secondary: CustomColors.kSecondaryColor,
    onSecondary: CustomColors.kOnSecondaryColor,
    error: CustomColors.kErrorColor,
    onError: CustomColors.kOnErrorColor,
    onBackground: CustomColors.kOnBackgroundColor,
    surface: CustomColors.kSurfaceColor,
    onSurface: CustomColors.kOnSurfaceColor,
  ),
  scaffoldBackgroundColor: CustomColors.kScaffoldBGColor,
  appBarTheme: const AppBarTheme(
      backgroundColor: CustomColors.kPrimaryColor,
      shadowColor: CustomColors.kErrorColor,
      foregroundColor: CustomColors.kOnPrimaryColor),
);
