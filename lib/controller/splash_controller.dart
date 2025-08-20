
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {

  timerNext() {
    Future.delayed(const Duration(seconds: 2), () {
      // checkMasuk();
    });
  }
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    timerNext();
  }
}