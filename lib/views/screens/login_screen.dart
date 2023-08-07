import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helper/utils/hive_utils.dart';
import 'home_screen.dart';
import '../../controller/blocs/user_auth_bloc/user_auth_bloc.dart';
import '../../helper/constants/custom_keys.dart';
import '../../helper/extensions/show_snackbar.dart';
import '../../helper/extensions/text_field_errors.dart';
import '../widgets/custom_text_button.dart';
import '../../helper/constants/app_dimensions.dart';
import '../../helper/constants/app_icons.dart';
import '../../helper/constants/app_sizes.dart';
import '../../helper/constants/custom_strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/flutter_logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocListener<UserAuthBloc, UserAuthState>(
      listener: (context, state) {
        if (state.status == UserAuthStatus.initial) {
        } else if (state.status == UserAuthStatus.created) {
        } else if (state.status == UserAuthStatus.failed) {
          state.alert.showSnackBar(context);
        } else if (state.status == UserAuthStatus.login) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()),
              ModalRoute.withName(AppKeys.kHomeScreenRoute));
          state.alert.showSnackBar(context);
        } else if (state.status == UserAuthStatus.logout) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()),
              ModalRoute.withName(AppKeys.kLoginScreenRoute));
          state.alert.showSnackBar(context);
        }
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
                              context.read<UserAuthBloc>().add(
                                    UserLoginEvent(
                                      email: emailController.text.toString(),
                                      password: passController.text.toString(),
                                    ),
                                  );
                            }
                          },
                          height: height,
                          width: width,
                          buttonName: AppStrings.kLoginButton),
                      SizedBox(height: height * AppSizes.kWidgetsSpace),
                      CustomButton(
                          function: () => Navigator.pushNamed(
                                context,
                                AppKeys.kSignupScreenRoute,
                              ),
                          height: height,
                          width: width,
                          buttonName: AppStrings.kCreateAccountButton),
                      CustomTextButton(
                        alignment: Alignment.centerRight,
                        function: () {},
                        buttonName: AppStrings.kForgotPasswordButton,
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
