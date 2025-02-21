import 'package:flutter_test_pln/presentation/detail/bindings/extends/detail_extended.dart';
import 'package:get/get.dart';

class DetailController extends GetxController with ExtendDetail {
  @override
  void onInit() {
    isNew = arguments?['isNew'] ?? false;
    isView = arguments?['isView'] ?? false;
    isEdit = arguments?['isEdit'] ?? false;
    if (isNew) {
      id = 0;
    } else {
      id = arguments?['id'] ?? 0;
      title.text = arguments?['title'] ?? '';
      body.text = arguments?['body'] ?? '';
      userId.text = arguments?['userId'].toString() ?? '0';
    }
    super.onInit();
  }
}
