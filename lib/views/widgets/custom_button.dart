import 'package:flutter/material.dart';
import '../../helper/constants/app_sizes.dart';

import '../../helper/constants/app_dimensions.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String buttonName;
  final Function function;

  const CustomButton({
    super.key,
    required this.function,
    required this.height,
    required this.width,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .background
                .withBlue(10)
                .withGreen(10)
                .withRed(10)
                .withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppDimensions.kWidgetsRadius),
            border: Border.all(color: Theme.of(context).colorScheme.primary)),
        height: height * AppSizes.kButtonHeight,
        child: Text(
          buttonName,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: AppSizes.kButtonTextSize),
        ),
      ),
    );
  }
}
