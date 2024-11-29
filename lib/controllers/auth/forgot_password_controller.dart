

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  // Observables
  final isLoading = false.obs;

  // Form Key
  final formKey = GlobalKey<FormState>();

  // Text Editing Controllers
  final emailEC = TextEditingController();

  // Focus Nodes
  final emailFN = FocusNode();

  @override
  void onClose() {
    // Dispose controllers and focus nodes 
    emailEC.dispose();
    emailFN.dispose();
    super.onClose();
  }

  // Email Validator
  String? validateEmail(dynamic value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!GetUtils.isEmail(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  // Generate OTP Method
  Future<bool> generateOtp() async {
  if (!formKey.currentState!.validate()) return false;

  isLoading.value = true;

  try {
    // Generate OTP 
    await Future.delayed(const Duration(seconds: 2));
    Get.snackbar("Success", "OTP Sent");
    return true;
  } catch (e) {
    Get.snackbar("Error", "Failed to generate OTP");
    return false;
  } finally {
    isLoading.value = false;
  }
 }
}
