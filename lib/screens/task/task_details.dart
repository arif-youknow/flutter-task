import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_fonts.dart';
import 'package:flutter_task/screens/task/controllers/task_controller.dart';
import 'package:flutter_task/screens/task/model/task_model.dart';
import 'package:flutter_task/widgets/bottom_nav.dart';
import 'package:get/get.dart';

class TaskDetailsScreen extends StatelessWidget {

  final TaskController controller = Get.find();
  final Task task = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Tasks Details',
          style: TextStyle(
            fontFamily: AppFonts.primaryFont,
            color: AppColors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow(Icons.article_outlined, 'Task Title', task.title),
            SizedBox(height: 20),
            _buildDetailRow(
              Icons.description_outlined,
              'Task Description',
              task.description,
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: Icon(Icons.delete_outline, color: Colors.black),
                    label: Text(
                      'Delete Task',
                      style: TextStyle(color: AppColors.white),
                    ),
                    onPressed: () => controller.deleteTask(task.id),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.black),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.edit_outlined),
                    label: Text('Edit Task'),
                    onPressed: () {
                      controller.loadTaskForEdit(task);
                      Get.toNamed('/add-edit-task', arguments: task);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.brandColor,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );

   
  }

  Widget _buildDetailRow(IconData icon, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.brandColor),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ),
        Divider(height: 30),
      ],
    );
  }
}
