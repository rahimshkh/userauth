part of 'user_auth_bloc.dart';

abstract class UserAuthEvents {}

class UserLoginEvent extends UserAuthEvents {
  final String email;
  final String password;

  UserLoginEvent({
    required this.email,
    required this.password,
  });
}

class UserSignupEvent extends UserAuthEvents {
  final String email;
  final String password;
  final String name;

  UserSignupEvent({required this.email, required this.password, required this.name});
}

class UserLogoutEvent extends UserAuthEvents {}
