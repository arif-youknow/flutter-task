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
    
    if(email=='arif@xyz.com' && password=='1234'){
      Get.toNamed('/home');
    }
    else{

      Get.snackbar('Email or Password is incorrect', 'Please enter:\narif@xyz.com\n1234');
    }

    
  }
}
