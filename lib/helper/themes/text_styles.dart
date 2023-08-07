import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

TextTheme textTheme = const TextTheme(
  headlineLarge: TextStyle(
    fontWeight: FontWeight.bold,
    color: CustomColors.kOnPrimaryColor,
  ),
  headlineMedium:
      TextStyle(fontWeight: FontWeight.bold, color: CustomColors.kTextColor, shadows: [
  ]),
  titleMedium:
      TextStyle(fontWeight: FontWeight.bold, color: CustomColors.kTextColor, shadows: [
  ]),
  titleSmall: TextStyle(
    fontWeight: FontWeight.bold,
    color: CustomColors.kOnPrimaryColor,
  ),
  displayMedium:
      TextStyle(fontWeight: FontWeight.bold, color: CustomColors.kTextColor, shadows: [
  ]),
  displaySmall: TextStyle(
    fontWeight: FontWeight.bold,
    color: CustomColors.kSurfaceColor,
  ),
);
