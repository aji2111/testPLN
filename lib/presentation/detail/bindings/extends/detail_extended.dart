import 'package:flutter/material.dart';
import 'package:flutter_test_pln/services/rest_api.dart';
import 'package:get/get.dart';

mixin ExtendDetail on GetxController {
  RestApi api = RestApi();
  TextEditingController title = TextEditingController();
  RxBool isFlag = false.obs;
  RxBool isLoading = false.obs;
  final arguments = Get.arguments;
  late final bool isNew;
  late final bool isView;
  late final bool isEdit;
  late final int id;
}
