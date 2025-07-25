import 'package:flutter/material.dart';
import 'package:flutter_task/screens/task/controllers/task_controller.dart';
import 'package:get/get.dart';


class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key});

  final TaskController taskController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Container(
      
       padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            ),
          ],
        ),
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildNavItem(
                icon: Icons.home,
                label: 'Home',
                color: Colors.black,
                onTap: () {
                  if (Get.currentRoute != '/home') {
                    Get.offAllNamed('/home');
                  }
                },
              ),
              _buildNavItem(
                icon: Icons.add,
                label: 'Add Task',
                color: Colors.black,
                onTap: () {
                  Get.toNamed('/add-task');
                },
              ),
              _buildNavItem(
                icon: Icons.person,
                label: 'Profile',
                color: Colors.black,
                onTap: () {
                  // TODO: Profile page
                },
              ),
            ],
          ),
        ),
      );
   
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 30,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
