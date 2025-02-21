// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test_pln/presentation/detail/bindings/detail_binding.dart';
import 'package:flutter_test_pln/presentation/detail/view/detail_screen.dart';
import 'package:flutter_test_pln/presentation/home/bindings/home_binding.dart';
import 'package:flutter_test_pln/presentation/home/view/home_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: _Paths.detail,
      page: () => DetailScreen(),
      binding: DetailBindings(),
      arguments: Get.arguments,
    ),
  ];
}
