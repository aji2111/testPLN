import 'package:flutter/material.dart';
import 'package:flutter_test_pln/config/routes/app_pages.dart';
import 'package:flutter_test_pln/model/task.dart';
import 'package:flutter_test_pln/presentation/home/controller/home_controller.dart';
import 'package:flutter_test_pln/themes/colours.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOS'),
      ),
      backgroundColor: MyColors.secondaryColor,
      body: Obx(() {
        if (homeController.isLoading.isTrue) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              Expanded(
                child: _buildTaskList(homeController.responseData),
              ),
            ],
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.detail, arguments: {'isNew': true});
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget _buildTaskList(List<Task> tasks) {
    return ListView.builder(
      padding: const EdgeInsets.all(8), // Tambahkan padding ke list
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return _buildTaskItem(tasks[index]);
      },
    );
  }

  Widget _buildTaskItem(Task task) {
    return Card(
      elevation: 6,
      color: MyColors.bgColor,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: task.completed!
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.cyan,
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.detail, arguments: {
                            'isEdit': true,
                            'id': task.id,
                            'title': task.title,
                            'userId': task.userId,
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.visibility,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.detail, arguments: {
                            'isView': true,
                            'id': task.id,
                            'title': task.title,
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          homeController.deleteTask(task.id!);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            if (task.completed!)
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 60,
              )
            else
              const Icon(
                Icons.radio_button_unchecked,
                color: Colors.red,
                size: 60,
              ),
          ],
        ),
      ),
    );
  }
}
