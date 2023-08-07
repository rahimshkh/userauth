import 'package:flutter/material.dart';
import '../constants/custom_keys.dart';
import '../../views/screens/home_screen.dart';
import '../../views/screens/login_screen.dart';
import '../../views/screens/signup_screen.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  AppKeys.kLoginScreenRoute: (context) => const LoginScreen(),
  AppKeys.kHomeScreenRoute: (context) => const HomeScreen(),
  AppKeys.kSignupScreenRoute: (context) => const SignupScreen(),
};
