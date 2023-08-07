import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../helper/utils/hive_utils.dart';
import '../../../helper/constants/custom_strings.dart';
import '../../../helper/utils/user_auth.dart';

part 'user_auth_events.dart';

part 'user_auth_states.dart';

class UserAuthBloc extends Bloc<UserAuthEvents, UserAuthState> {
  UserAuthBloc() : super(const UserAuthState()) {
    on<UserSignupEvent>(onUserSignupEvent);
    on<UserLogoutEvent>(onUserLogoutEvent);
    on<UserLoginEvent>(onLoginUser);
  }

  onUserSignupEvent(UserSignupEvent event, Emitter<UserAuthState> emit) async {
    emit(state.copyWith(status: UserAuthStatus.loading));
    await UserAuth.signupUser(
            email: event.email, password: event.password, name: event.name)
        .then((value) {
      emit(state.copyWith(
          status: UserAuthStatus.created, alert: AppStrings.kAccountCreatedSuccessfully));
    }).catchError((error) {
      emit(state.copyWith(status: UserAuthStatus.failed, alert: error.toString()));
    });
  }

  onLoginUser(UserLoginEvent event, Emitter<UserAuthState> emit) async {
    emit(state.copyWith(status: UserAuthStatus.loading));
    await UserAuth.loginUser(email: event.email, password: event.password).then((_) {
      HiveStorageManager.emptyBox();
      UserAuth.saveUserInHive();
      emit(state.copyWith(
          status: UserAuthStatus.login, alert: AppStrings.kLoginSuccessfully));
    }).catchError((error) {
      emit(state.copyWith(status: UserAuthStatus.failed, alert: error.toString()));
    });
  }

  onUserLogoutEvent(UserLogoutEvent event, Emitter<UserAuthState> emit) async {
    emit(state.copyWith(status: UserAuthStatus.loading));
    await UserAuth.logoutUser().then((_) {
      HiveStorageManager.emptyBox();
      emit(state.copyWith(
          status: UserAuthStatus.logout, alert: AppStrings.kLogoutSuccessfully));
    });
  }
}
