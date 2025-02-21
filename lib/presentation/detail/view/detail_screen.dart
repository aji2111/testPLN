import 'package:flutter/material.dart';
import 'package:flutter_test_pln/presentation/detail/controller/detail_controller.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailController detailController = Get.put(DetailController());
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: detailController.idController,
              decoration: const InputDecoration(
                labelText: 'ID',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: detailController.title,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: detailController.body,
              decoration: const InputDecoration(
                labelText: 'Body',
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
