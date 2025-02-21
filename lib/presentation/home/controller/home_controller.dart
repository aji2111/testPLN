import 'package:flutter_test_pln/model/task.dart';
import 'package:flutter_test_pln/presentation/home/bindings/extended/home_extended.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with ExtendHome {
  @override
  void onInit() {
    fetchAllData('todos');
    super.onInit();
  }

  Future<void> fetchAllData(String? todos) async {
    try {
      isLoading.value = true;

      // Fetch data concurrently
      await Future.wait([
        fetchData(todos, responseData),
      ]);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch data: $e',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchData(
    String? todos,
    RxList<Task> responseDataList,
  ) async {
    try {
      var response = await api.fetchToDoList(todos: todos ?? 'todos');

      if (response is List) {
        responseDataList.clear();
        for (var element in response) {
          if (element is Map) {
            responseDataList.add(Task.fromJson(element));
          }
        }
      }
    } catch (e) {
      // Handle specific fetch errors if needed
      Get.snackbar('Error', 'Failed to fetch $todos data: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      isLoading.value = true;
      await api.deleteToDoList(id: id);

      Get.snackbar('Success', 'Task deleted successfully',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete task: $e',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
