import 'package:flutter/material.dart';
import 'package:flutter_task/screens/task/controllers/task_controller.dart';
import 'package:flutter_task/widgets/bottom_nav.dart';
import 'package:get/get.dart';

import '../core/theme/app_colors.dart';
import '../widgets/task_card.dart';

class HomeScreen extends StatelessWidget {
  
  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello Mojahid', style: TextStyle(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Welcome to Task Manager', style: TextStyle(color: Colors.grey, fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text('My Tasks', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.tasks.isEmpty) {
                  return Center(child: Text('No tasks found. Add one!'));
                }
                return ListView.builder(
                  itemCount: controller.tasks.length,
                  itemBuilder: (context, index) {
                    final task = controller.tasks[index];
                    return TaskCard(task: task);
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
