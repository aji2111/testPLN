import 'package:flutter_test_pln/presentation/home/controller/home_controller.dart';
import 'package:get/get.dart';


class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
