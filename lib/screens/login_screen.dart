import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/login_controller.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_fonts.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

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
                'Welcome Back!',
                style: TextStyle(
                  fontFamily: AppFonts.primaryFont,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Stay productive and take control of your tasks.',
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

              // Password
              Text(
                'Password',
                style: TextStyle(
                  fontFamily: AppFonts.primaryFont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Obx(
                () => TextField(
                  controller: controller.passwordController,
                  obscureText: controller.isPasswordHidden.value,
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: controller.passwordVisibility,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Remember me
              Obx(
                () => Row(
                  children: [
                    Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) =>
                          controller.rememberMe.value = value ?? false,
                      activeColor: AppColors.brandColor,
                      checkColor: Colors.white,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(fontFamily: AppFonts.primaryFont),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1, color: Colors.grey[400]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        fontFamily: AppFonts.primaryFont,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(thickness: 1, color: Colors.grey[400]),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontFamily: AppFonts.primaryFont),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/registration');
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontFamily: AppFonts.primaryFont,
                        color: AppColors.brandColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Login Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandColor,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: controller.login,
                child: const Text(
                  'Log In',
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
