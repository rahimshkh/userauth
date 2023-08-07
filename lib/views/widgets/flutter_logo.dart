import 'package:flutter/material.dart';
import '../../helper/constants/app_sizes.dart';

class FlutterScreenLogo extends StatelessWidget {
  const FlutterScreenLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FlutterLogo(
        curve: Curves.bounceIn,
        style: FlutterLogoStyle.horizontal,
        size: AppSizes.kLogoSize,
      ),
    );
  }
}
