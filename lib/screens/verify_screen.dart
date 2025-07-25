import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/verify_controller.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_fonts.dart';
import 'package:get/get.dart';

class VarifyScreen extends StatelessWidget {
  

  final VarifyController controller = Get.put(VarifyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(height: 60),
              Text(
                'Verify Your Email',
                style: TextStyle(
                  fontFamily: AppFonts.primaryFont,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "We'll send a verification code to this email to confirm your account.",
                style: TextStyle(
                  fontFamily: AppFonts.primaryFont,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),

              // Email
              Text(
                'Email Address',
                style: TextStyle(
                  fontFamily: AppFonts.primaryFont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.inputFieldcolor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppColors.brandColor,
                      width: 2.0,
                    ),
                  ),
                  hintText: 'name@example.com',
                ),
              ),
              const SizedBox(height: 20),

              // Login Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandColor,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: controller.send,
                child: const Text(
                  'Send',
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
