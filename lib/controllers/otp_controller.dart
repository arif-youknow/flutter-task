import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPcontroller extends GetxController {
  final int codeLength = 6;
  late List<TextEditingController> codeControllers;
  late List<FocusNode> focusNodes;

  @override
  void onInit() {
    super.onInit();
    codeControllers = List.generate(codeLength, (_) => TextEditingController());
    focusNodes = List.generate(codeLength, (_) => FocusNode());
  }

  void nextField(String value, int index, BuildContext context) {
    if (value.isNotEmpty && index < codeLength - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  void onConfirm() {
    
    Get.toNamed('/setpassword');
  }

  @override
  void onClose() {
    for (final controller in codeControllers) {
      controller.dispose();
    }
    for (final node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }
}
