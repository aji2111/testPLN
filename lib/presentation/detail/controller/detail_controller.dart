import 'package:flutter_test_pln/presentation/detail/bindings/extends/detail_extended.dart';
import 'package:get/get.dart';

class DetailController extends GetxController with ExtendDetail {
  @override
  void onInit() {
    isNew = arguments?['isNew'] ?? false;
    isView = arguments?['isView'] ?? false;
    if (isNew == false) {
      getDetail(arguments?['id'], arguments?['title']);
    }
    super.onInit();
  }

  getDetail(int detailId, String titleId) async {
    isLoading(true);
    try {
      var response =
          await api.detailToDoList(id: detailId) as Map<String, dynamic>;

      title.text = response['title'];
      isFlag.value = response['completed'];
      
    } catch (e) {
      // Handle specific fetch errors if needed
      Get.snackbar('Error', 'Failed to fetch data: $e',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  submit() async {
    try {
      await api.submit(
        body: {
          "title": title.text,
          "completed": isFlag.value,
          "userId": Get.arguments['userId'],
        },
      ) as Map<String, dynamic>;

      return true;
    } catch (e) {
      // Handle specific fetch errors if needed
      Get.snackbar('Error', 'Failed to submit  data: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  submitEdit() async {
    try {
       await api.submitEdit(
        id: Get.arguments['id'],
        body: {
          "title": title.text,
          "completed": isFlag.value,
          'id': Get.arguments['id'],
          "userId": Get.arguments['userId']
        },
      ) as Map<String, dynamic>;

      return true;
    } catch (e) {
      // Handle specific fetch errors if needed
      Get.snackbar('Error', 'Failed to submit  data: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
