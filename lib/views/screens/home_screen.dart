import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/blocs/hive_bloc/hive_bloc.dart';

import '../../controller/blocs/user_auth_bloc/user_auth_bloc.dart';
import '../../controller/cubits/edit_form_cubit.dart';
import '../../helper/constants/custom_strings.dart';
import '../../helper/extensions/show_snackbar.dart';
import '../../helper/extensions/text_field_errors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../../helper/constants/app_dimensions.dart';
import '../../helper/constants/app_icons.dart';
import '../../helper/constants/app_sizes.dart';
import '../../helper/constants/custom_keys.dart';
import '../../helper/utils/alert_utils.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();

    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final formKey = GlobalKey<FormState>();
    return BlocBuilder<EditFormCubit, bool>(builder: (context, enabled) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  context.read<EditFormCubit>().editForm();
                },
                icon: (enabled)
                    ? const Icon(AppIcons.kEditIcon)
                    : const Icon(AppIcons.kRemoveEditIcon)),
            BlocListener<UserAuthBloc, UserAuthState>(
              listener: (context, state) {
                if (state.status == UserAuthStatus.initial) {
                } else if (state.status == UserAuthStatus.created) {
                } else if (state.status == UserAuthStatus.failed) {
                } else if (state.status == UserAuthStatus.login) {
                } else if (state.status == UserAuthStatus.logout) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const LoginScreen()),
                      ModalRoute.withName(AppKeys.kLoginScreenRoute));
                }
                state.alert.showSnackBar(context);
              },
              child: IconButton(
                onPressed: () => AlertUtils.showLogoutDialog(
                  context: context,
                  width: width,
                  height: height,
                ),
                icon: const Icon(AppIcons.kLogoutIcon),
              ),
            ),
          ],
        ),
        body: BlocListener<HiveBloc, HiveState>(
          listener: (context, state) {
            if (state.status == HiveStatus.failed) {
              state.alert.showSnackBar(context);
            } else if (state.status == HiveStatus.updated){
              state.alert.showSnackBar(context);
            }
          },
          child: BlocBuilder<HiveBloc, HiveState>(
            builder: (context, state) {
              if (state.status == HiveStatus.loading) {
                context.read<HiveBloc>().add(FetchDataEvent());
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                nameController.text = state.user!.name.toString();
                emailController.text = state.user!.email.toString();
                return Form(
                  key: formKey,
                  child: ListView(
                    padding: EdgeInsets.all(width * AppDimensions.kAllScreenPadding),
                    children: [
                      SizedBox(height: height * AppSizes.kWidgetsSpace),
                      CustomTextField(
                        controller: nameController,
                        enabled: enabled,
                        label: AppStrings.kNameFieldLabel,
                        prefixIcon: AppIcons.kNameFieldIcon,
                        validator: (val) => val.toString().nameValidation(),
                      ),
                      SizedBox(height: height * AppSizes.kWidgetsSpace),
                      CustomTextField(
                        enabled: enabled,
                        validator: (val) => val.toString().emailValidation(),
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        label: AppStrings.kEmailFieldLabel,
                        prefixIcon: AppIcons.kEmailFieldIcon,
                      ),
                      SizedBox(height: height * AppSizes.kWidgetsSpace),
                      if (enabled)
                        CustomButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                context.read<HiveBloc>().add(
                                      UpdateDataEvent(
                                        name: nameController.text.toString().trim(),
                                        email: emailController.text.toString().trim(),
                                      ),
                                    );
                                context.read<EditFormCubit>().editForm();
                              }
                            },
                            height: height,
                            width: width,
                            buttonName: AppStrings.kUpdateButton)
                    ],
                  ),
                );
              }
            },
          ),
        ),
      );
    });
  }
}
