import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/controllers/registration_controller.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_fonts.dart';

class RegistrationScreen extends StatelessWidget {

  final RegistrationController controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              Text(
                'Create Your Account',
                style: TextStyle(
                  fontFamily: AppFonts.primaryFont,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Join Task Manager today — organize better, work smarter, and stay in control of your day.',
                style: TextStyle(
                  fontFamily: AppFonts.primaryFont,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),

            
              _buildLabel('First Name'),
              _buildInput(controller.firstNameController, 'your first name'),

              
              _buildLabel('Last Name'),
              _buildInput(controller.lastNameController, 'your last name'),

            
              _buildLabel('Email Address'),
              _buildInput(controller.emailController, 'name@example.com'),

            
              _buildLabel('Address'),
              _buildInput(controller.addressController, 'your address'),

           
              _buildLabel('Password'),
              Obx(() => _buildPasswordField(
                controller.passwordController,
                controller.isPasswordHidden.value,
                controller.togglePasswordVisibility,
              )),

           
              _buildLabel('Confirm Password'),
              Obx(() => _buildPasswordField(
                controller.confirmPasswordController,
                controller.isConfirmPasswordHidden.value,
                controller.toggleConfirmPasswordVisibility,
              )),

              const SizedBox(height: 10),

              
              Obx(() => Row(
                children: [
                  Checkbox(
                    value: controller.termsAccepted.value,
                    onChanged: (value) =>
                        controller.termsAccepted.value = value ?? false,
                    activeColor: AppColors.brandColor,
                    checkColor: Colors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  ),
                  Expanded(
                    child: Text(
                      'I agree to the Terms & Conditions and Privacy Policy.',
                      style: TextStyle(fontFamily: AppFonts.primaryFont, fontSize: 13),
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 10),

             
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1, color: Colors.grey[400])),
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
                  Expanded(child: Divider(thickness: 1, color: Colors.grey[400])),
                ],
              ),
              const SizedBox(height: 15),

            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(fontFamily: AppFonts.primaryFont),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/login');
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontFamily: AppFonts.primaryFont,
                        color: AppColors.brandColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandColor,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: controller.register,
                child: Text(
                  'Continue',
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

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: AppFonts.primaryFont,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInput(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.inputFieldcolor,
        hintText: hint,
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
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, bool isHidden, VoidCallback toggleVisibility) {
    return TextField(
      controller: controller,
      obscureText: isHidden,
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
            isHidden ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: toggleVisibility,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
      ),
    );
  }
}
