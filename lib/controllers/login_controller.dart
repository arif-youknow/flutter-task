import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isPasswordHidden = true.obs;
  var rememberMe = false.obs;

  void passwordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void login() {
    String email = emailController.text;
    String password = passwordController.text;
    // এখানে API call বা logic দিবেন
    print("Email: $email, Password: $password, Remember: ${rememberMe.value}");
  }
}
