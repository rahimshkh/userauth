import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashRemover {
  static splashRemove() {
    Future.delayed(const Duration(seconds: 3), () {
      FlutterNativeSplash.remove();
    });
  }
}
