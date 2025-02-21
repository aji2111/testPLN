import 'package:flutter/material.dart';
import 'package:flutter_test_pln/config/routes/app_pages.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'movie app',
      initialRoute: Routes.home,
      getPages: AppPages.routes,
    );
  }
}
