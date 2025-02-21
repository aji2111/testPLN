import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin ExtendDetail on GetxController {
  TextEditingController idController = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController userId = TextEditingController();
  final arguments = Get.arguments;
  late final bool isNew;
  late final bool isView;
  late final bool isEdit;
  late final int id;
}
