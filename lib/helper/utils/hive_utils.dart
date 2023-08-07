import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import '../constants/custom_keys.dart';

class HiveStorageManager {
  static Box hiveBox = Hive.box(AppKeys.kHiveBoxName);

  static Future<void> openHiveBox() async {
    await Hive.initFlutter();
    await Hive.openBox(AppKeys.kHiveBoxName);
    if (!hiveBox.containsKey(AppKeys.kHiveKeyName)) {
      createData({});
    } else {}
  }

  static createData(Map<String, dynamic> userData) {
    _saveData(key: AppKeys.kHiveKeyName, userData: userData);
  }

  static getUserData() {
    String userDataJson = _readData(key: AppKeys.kHiveKeyName);
    Map<String, dynamic> dataDecode = jsonDecode(userDataJson);
    (dataDecode);
    return dataDecode;
  }

  static _saveData({required String key, required Map<String, dynamic> userData}) {
    String userDataJson = jsonEncode(userData);
    hiveBox.put(key, userDataJson);
  }

  static _readData({required String key}) {
    String value = hiveBox.get(key);
    (value);
    return value;
  }

  static emptyBox() async {
    await hiveBox.clear();
    createData({});
  }

  static updateUserName(String name) {
    Map<String, dynamic> userData = getUserData();
    emptyBox();
    userData[AppKeys.kName] = name;
    createData(userData);
  }
}
