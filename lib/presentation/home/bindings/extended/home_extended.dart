import 'package:flutter/material.dart';
import 'package:flutter_test_pln/model/task.dart';
import 'package:flutter_test_pln/services/rest_api.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

mixin ExtendHome on GetxController {
  RestApi api = RestApi();
  ScrollController controller = ScrollController();
  TextEditingController textController = TextEditingController();
  RxBool isLoading = false.obs;
  RxList<Task> responseData = <Task>[].obs;
  List<Map<String, String>> users = [
  {'name': 'John Doe', 'avatar': 'https://i.pravatar.cc/150?img=1'},
  {'name': 'Jane Smith', 'avatar': 'https://i.pravatar.cc/150?img=2'},
  {'name': 'David Lee', 'avatar': 'https://i.pravatar.cc/150?img=3'},
  {'name': 'Sarah Jones', 'avatar': 'https://i.pravatar.cc/150?img=4'},
  {'name': 'Michael Brown', 'avatar': 'https://i.pravatar.cc/150?img=5'},
  {'name': 'Emily Davis', 'avatar': 'https://i.pravatar.cc/150?img=6'},
  {'name': 'Kevin Wilson', 'avatar': 'https://i.pravatar.cc/150?img=7'},
  {'name': 'Jessica Garcia', 'avatar': 'https://i.pravatar.cc/150?img=8'},
  {'name': 'Brian Rodriguez', 'avatar': 'https://i.pravatar.cc/150?img=9'},
  {'name': 'Ashley Martinez', 'avatar': 'https://i.pravatar.cc/150?img=10'},
];
}
