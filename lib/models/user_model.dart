import '../helper/constants/custom_keys.dart';

class UserModel {
  final String? name;
  final String? email;

  UserModel({this.name, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    String name = json[AppKeys.kName];
    String email = json[AppKeys.kEmail];

    return UserModel(name: name, email: email);
  }
}
