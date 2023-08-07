part of 'hive_bloc.dart';

enum HiveStatus { fetched, failed, loading, updated }

class HiveState extends Equatable {
  final HiveStatus status;
  final String alert;
  final UserModel? user;

  const HiveState({this.status = HiveStatus.loading, this.user, this.alert = ""});

  HiveState copyWith({HiveStatus? status, String? alert, UserModel? user}) {
    return HiveState(
        status: status ?? this.status,
        alert: alert ?? this.alert,
        user: user ?? this.user);
  }

  @override
  List<Object?> get props => [status, alert, user];

  @override
  String toString() {
    return "status is $status, error is $alert, user is $user";
  }
}
