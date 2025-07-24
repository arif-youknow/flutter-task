import 'package:flutter/material.dart';
import 'package:flutter_task/screens/login_screen.dart';
import 'package:flutter_task/screens/registration_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
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


      ],


      home: LoginScreen(),
    );
  }
}
