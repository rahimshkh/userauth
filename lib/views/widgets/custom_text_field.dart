import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubits/show_password_cubit.dart';
import '../../helper/constants/app_icons.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  bool passwordField;
  final IconData prefixIcon;
  final String label;
  final bool enabled;
  final String? Function(String?)? validator;
  final TextInputType textInputType;

  CustomTextField({
    super.key,
    required this.controller,
    this.enabled = true,
    required this.label,
    required this.prefixIcon,
    this.passwordField = false,
    required this.validator,
    this.textInputType = TextInputType.text
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowPasswordCubit, bool>(builder: (context, state) {
      return TextFormField(
        keyboardType: textInputType,
        enabled: enabled,
        validator: (value) => validator!(value),
        obscureText: passwordField ? state : false,
        controller: controller,
        cursorColor: Theme
            .of(context)
            .colorScheme
            .primary,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: passwordField
              ? IconButton(
            onPressed: () {
              context.read<ShowPasswordCubit>().hidePassword();
            },
            icon: Icon(
                state ? AppIcons.kPasswordShowIcon : AppIcons.kPasswordHideIcon),
          )
              : null,
          label: Text(label),
        ),
      );
    });
  }
}
