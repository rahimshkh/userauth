
import '../../helper/utils/hive_utils.dart';
import '../../views/screens/home_screen.dart';
import '../../views/screens/login_screen.dart';

userSession(){
  Map<String, dynamic> userMap = HiveStorageManager.getUserData();
  if(userMap.isEmpty){
    return const LoginScreen();
  }else{
    return const HomeScreen();
  }
}