import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/cubits/confirm_password_cubit.dart';
import '../../helper/constants/custom_strings.dart';
import '../../helper/constants/app_icons.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  const ConfirmPasswordTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowConfirmPasswordCubit, bool>(builder: (context, state) {
      return TextFormField(
        obscureText: state,
        controller: controller,
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          prefixIcon: const Icon(AppIcons.kPasswordFieldIcon),
          suffixIcon: IconButton(
            onPressed: () => context.read<ShowConfirmPasswordCubit>().hidePassword(),
            icon: Icon(state ? AppIcons.kPasswordShowIcon : AppIcons.kPasswordHideIcon),
          ),
          label: const Text(AppStrings.kConfirmPasswordFieldLabel),
        ),
      );
    });
  }
}
