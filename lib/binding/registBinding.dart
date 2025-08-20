

import 'package:get/get.dart';

import '../controller/registController.dart';

class RegistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistController());
  }
}