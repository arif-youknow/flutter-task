

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewPassController extends GetxController{

var newPassword = TextEditingController();
var confirmPassword = TextEditingController();
var isNewPasswordHidden = true.obs;
var isConfirmPasswordHidden = true.obs;

  void newPasswordVisibility() {
    isNewPasswordHidden.value = !isNewPasswordHidden.value;
  }

   void confirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  void netStep(){

    Get.toNamed('/home');

  }







}