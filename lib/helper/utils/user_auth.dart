import 'package:firebase_auth/firebase_auth.dart';

import '../constants/custom_keys.dart';
import 'hive_utils.dart';

class UserAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static loginUser({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static signupUser(
      {required String email, required String password, required String name}) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      value.user!.updateDisplayName(name);
      UserAuth.saveInFireStore(
        email: value.user!.email,
        password: password,
        name: value.user!.displayName,
      );
    });
  }

  static logoutUser() async {
    await _auth.signOut();
  }

  static saveInFireStore({String? email, String? password, String? name}) {}

  static fetchUser() {
    User user = _auth.currentUser!;
    return user;
  }

  static updateUser({required String email, required String name}) async {
    User user = fetchUser();
    await user.updateEmail(email);
    await user.updateDisplayName(name);
  }

  static saveUserInHive() {
    User user = UserAuth.fetchUser();
    Map<String, dynamic> userData = {
      AppKeys.kName: user.displayName,
      AppKeys.kEmail: user.email,
    };
    HiveStorageManager.createData(userData);
  }
}
