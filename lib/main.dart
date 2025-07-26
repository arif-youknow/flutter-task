import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/screens/home_screen.dart';
import 'package:flutter_task/screens/login_screen.dart';
import 'package:flutter_task/screens/new_pass_screen.dart';
import 'package:flutter_task/screens/otp_screen.dart';
import 'package:flutter_task/screens/registration_screen.dart';
import 'package:flutter_task/screens/task/add_task.dart';
import 'package:flutter_task/screens/task/task_details.dart';
import 'package:flutter_task/screens/verify_screen.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'flutter_Task',
      debugShowCheckedModeBanner: false,

      initialRoute: '/login',
      getPages: [

        GetPage(name: '/login', page: ()=> LoginScreen()),
        GetPage(name: '/registration', page: ()=> RegistrationScreen()),
        GetPage(name: '/email-varify', page: ()=> VarifyScreen()),
        GetPage(name: '/otp-screen', page: ()=> OTPScreen()),
        GetPage(name: '/setpassword', page:()=>SetNewPass()),
        GetPage(name: '/home', page: ()=> HomeScreen()),
        GetPage(name: '/task-details', page: ()=> TaskDetailsScreen()),
        GetPage(name: '/add-task', page: ()=> AddTaskScreen()),


      ],


     
    );
  }
}
