part of 'user_auth_bloc.dart';

enum UserAuthStatus { initial, login, logout, created, failed, loading }

class UserAuthState extends Equatable {
  final String alert;
  final UserAuthStatus status;

  const UserAuthState({this.status = UserAuthStatus.initial, this.alert = ""});

  UserAuthState copyWith({String? alert, UserAuthStatus? status}) {
    return UserAuthState(status: status ?? this.status, alert: alert ?? this.alert);
  }

  @override
  List<Object?> get props => [alert, status];

  @override
  String toString() {
    return "status is $status, error is $alert";
  }
}
