import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/blocs/user_auth_bloc/user_auth_bloc.dart';
import '../constants/app_sizes.dart';
import '../constants/custom_strings.dart';

class AlertUtils {
  static showLogoutDialog({
    required BuildContext context,
    required double height,
    required double width,
  }) {
    return showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              content: SizedBox(
                height: height * AppSizes.kDialogHeight,
                width: width,
                child: Column(
                  children: [
                    const Text(AppStrings.kLogoutAlert),
                    SizedBox(
                      height: height * AppSizes.kWidgetsSpace,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              context.read<UserAuthBloc>().add(UserLogoutEvent());
                            },
                            child: const Text(AppStrings.kYesButton)),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(AppStrings.kNoButton))
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
