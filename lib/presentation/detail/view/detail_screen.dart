import 'package:flutter/material.dart';
import 'package:flutter_test_pln/presentation/detail/controller/detail_controller.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final DetailController detailController = Get.put(DetailController());
    return Obx(() {
      if (detailController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text(detailController.isNew
                ? 'Add'
                : detailController.isView
                    ? 'View'
                    : 'Edit'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: detailController.title,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Obx(() => SwitchListTile(
                        title: const Text('Flag'),
                        value: detailController.isFlag.value,
                        onChanged: (bool value) {
                          detailController.isFlag.value = value;
                        },
                      )),
                  const SizedBox(height: 32.0),
                  Visibility(
                    visible: !detailController.isView,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (detailController.isNew) {
                            detailController.submit().then((success) {
                              if (success) {
                                Get.back();
                                Get.snackbar('Success',
                                    'Data has been successfully added');
                              }
                            });
                          } else {
                            detailController.submitEdit().then((success) {
                              if (success) {
                                Get.back();
                                Get.snackbar('Success',
                                    'Data has been successfully updated');
                              }
                            });
                          }
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
