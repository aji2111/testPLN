import 'package:flutter_test_pln/presentation/detail/controller/detail_controller.dart';
import 'package:get/get.dart';

class DetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailController());
  }
}
