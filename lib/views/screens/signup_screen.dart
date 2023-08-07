import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/blocs/user_auth_bloc/user_auth_bloc.dart';
import '../../helper/extensions/show_snackbar.dart';
import '../../helper/extensions/text_field_errors.dart';
import '../../helper/constants/app_dimensions.dart';
import '../../helper/constants/app_icons.dart';
import '../../helper/constants/app_sizes.dart';
import '../../helper/constants/custom_strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/flutter_logo.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocListener<UserAuthBloc, UserAuthState>(
      listener: (context, state) {
        if (state.status == UserAuthStatus.initial) {
        } else if (state.status == UserAuthStatus.created) {
          Navigator.pop(context);
          state.alert.showSnackBar(context);
        } else if (state.status == UserAuthStatus.failed) {
          state.alert.showSnackBar(context);
        } else if (state.status == UserAuthStatus.login) {
        } else if (state.status == UserAuthStatus.logout) {}
      },
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<UserAuthBloc, UserAuthState>(
            builder: (context, state) {
              if (state.status == UserAuthStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Form(
                  key: formKey,
                  child: ListView(
                    padding: EdgeInsets.all(width * AppDimensions.kAllScreenPadding),
                    children: [
                      const FlutterScreenLogo(),
                      SizedBox(height: height * AppSizes.kWidgetsSpace),
                      CustomTextField(
                        validator: (val) => val.toString().nameValidation(),
                        controller: nameController,
                        label: AppStrings.kNameFieldLabel,
                        prefixIcon: AppIcons.kNameFieldIcon,
                      ),
                      SizedBox(height: height * AppSizes.kWidgetsSpace),
                      CustomTextField(
                        validator: (val) => val.toString().emailValidation(),
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        label: AppStrings.kEmailFieldLabel,
                        prefixIcon: AppIcons.kEmailFieldIcon,
                      ),
                      SizedBox(height: height * AppSizes.kWidgetsSpace),
                      CustomTextField(
                        validator: (val) => val.toString().passwordValidation(),
                        controller: passController,
                        label: AppStrings.kPasswordFieldLabel,
                        prefixIcon: AppIcons.kPasswordFieldIcon,
                        passwordField: true,
                      ),
                      SizedBox(height: height * AppSizes.kWidgetsSpace),
                      CustomButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              context.read<UserAuthBloc>().add(UserSignupEvent(
                                    email: emailController.text.toString().trim(),
                                    password: passController.text.toString().trim(),
                                    name: nameController.text.toString().trim(),
                                  ));
                            }
                          },
                          height: height,
                          width: width,
                          buttonName: AppStrings.kSignupButton),
                      CustomTextButton(
                        alignment: Alignment.centerRight,
                        function: () => Navigator.pop(context),
                        buttonName: AppStrings.kAlreadyHaveAccountButton,
                        height: height,
                        width: width,
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
