import 'package:flutter/material.dart';
import '../../helper/constants/app_dimensions.dart';
import '../../helper/constants/app_sizes.dart';

class CustomTextButton extends StatelessWidget {
  final double width;
  final double height;
  final String buttonName;
  final Function function;
  final Alignment alignment;

  const CustomTextButton({
    super.key,
    required this.alignment,
    required this.function,
    required this.buttonName,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height*AppDimensions.kTextButtonMargin),
      width: width,
      alignment: alignment,
      child: GestureDetector(
        onTap: ()=>function(),
        child: Text(buttonName, style: TextStyle(
          fontSize: AppSizes.kTextButtonFontSize,
          color: Theme.of(context).colorScheme.primary,
          decoration: TextDecoration.underline
        ),),
      ),
    );
  }
}
