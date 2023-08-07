import 'package:flutter/material.dart';
import 'package:userauth/helper/constants/app_dimensions.dart';
import 'package:userauth/helper/constants/app_dimensions.dart';
import 'package:userauth/helper/constants/app_dimensions.dart';

import '../constants/app_colors.dart';

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.kWidgetsRadius)),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.kWidgetsRadius)),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.kWidgetsRadius)),
  focusColor: CustomColors.kPrimaryColor,
  filled: true,
  fillColor: CustomColors.kTextFieldBackgroundColor,
  isDense: true,
  suffixIconColor: CustomColors.kSecondaryColor,
);
