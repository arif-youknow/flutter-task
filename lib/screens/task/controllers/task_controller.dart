import 'package:flutter/material.dart';
import 'package:flutter_task/screens/task/model/task_model.dart';
import 'package:get/get.dart';


class TaskController extends GetxController {
  
  var tasks = <Task>[
    Task(id: '1', title: 'Design Landing Page Header', description: 'Create a clean, responsive header section with logo, navigation links, and a clear call-to-action button.'),
    Task(id: '2', title: 'Develop Onboarding Screens', description: 'Design a 3-step onboarding flow to introduce users to core app features using illustrations and concise text.'),
    Task(id: '3', title: 'Organize Task Card Components', description: 'Build reusable task card UI elements for listing, prioritizing, and editing individual tasks.'),
  ].obs;

 
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

 
  void addTask() {
    if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
      final newTask = Task(
        id: DateTime.now().toString(),
        title: titleController.text,
        description: descriptionController.text,
      );
      tasks.add(newTask);
      Get.back(); 
      Get.snackbar('Success', 'Task added successfully', backgroundColor: Colors.green, colorText: Colors.white);
      clearControllers();
    } else {
      Get.snackbar('Error', 'Please fill all fields', backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  
  void updateTask(String id) {
    
    int taskIndex = tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      var updatedTask = Task(
        id: id,
        title: titleController.text,
        description: descriptionController.text,
      );
      tasks[taskIndex] = updatedTask;
      Get.back();
      Get.back();
      Get.snackbar('Success', 'Task updated successfully', backgroundColor: Colors.green, colorText: Colors.white);
      clearControllers();
    }
  }

  
  void deleteTask(String id) {
    tasks.removeWhere((task) => task.id == id);
    Get.back();
    Get.snackbar('Success', 'Task deleted successfully', backgroundColor: Colors.orange, colorText: Colors.white);
  }

  
  void loadTaskForEdit(Task task) {
    titleController.text = task.title;
    descriptionController.text = task.description;
  }
  
  
  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
  }
}