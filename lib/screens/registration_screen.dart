import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_fonts.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Text("Hello registration Page",
      style: TextStyle(fontFamily: AppFonts.primaryFont),),
    );
  }
}