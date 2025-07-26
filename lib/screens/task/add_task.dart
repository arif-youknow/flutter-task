import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_fonts.dart';
import 'package:flutter_task/screens/task/controllers/task_controller.dart';
import 'package:flutter_task/screens/task/model/task_model.dart';
import 'package:flutter_task/widgets/bottom_nav.dart';
import 'package:get/get.dart';

class AddTaskScreen extends StatelessWidget {

  final TaskController controller = Get.find();
  final Task? taskToEdit = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final isEditing = taskToEdit != null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          isEditing ? 'Edit Task' : 'Add Task',
          style: TextStyle(fontFamily: AppFonts.primaryFont, color: AppColors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(
                labelText: 'Task Title',
                hintText: 'e.g. Design Landing Page Header',
                filled: true,
                fillColor: AppColors.taskCardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: controller.descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'e.g. Include logo, navigation, and CTA button',
                filled: true,
                fillColor: AppColors.taskCardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (isEditing) {
                    controller.updateTask(taskToEdit!.id);
                  } else {
                    controller.addTask();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandColor,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  isEditing ? 'Update' : 'Save Task',
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
