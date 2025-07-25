import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_fonts.dart';
import 'package:flutter_task/screens/task/model/task_model.dart';
import 'package:get/get.dart';
import '../core/theme/app_colors.dart';


class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        
        Get.toNamed('/task-details', arguments: task);
      },
      child: Card(
        color: AppColors.taskCardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey[200]!),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.article, color: AppColors.brandColor),
                  SizedBox(width: 8),
                  
                ],
              ),
              SizedBox(height: 10),
              Text(
                task.title,
                style: TextStyle(fontFamily: AppFonts.primaryFont, fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                task.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontFamily: AppFonts.primaryFont, fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}