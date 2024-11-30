import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/controllers/others/api_processor_controller.dart';
import 'package:stellar/routes/routes.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance {
    return Get.find<ForgotPasswordController>();
  }

  @override
  void onInit() {
    emailFN.requestFocus();
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose controllers and focus nodes
    emailEC.dispose();
    emailFN.dispose();
    super.onClose();
  }

  // Observables
  final isLoading = false.obs;

  // Form Key
  final formKey = GlobalKey<FormState>();

  // Text Editing Controllers
  final emailEC = TextEditingController();

  // Focus Nodes
  final emailFN = FocusNode();

//============== Functions =================\\
  onFieldSubmitted(String value) {
    generateOtp();
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
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      try {
        // Generate OTP
        await Future.delayed(const Duration(seconds: 2));
        ApiProcessorController.successSnack("OTP has been sent to your email");
        Get.toNamed(Routes.verifyOTP, arguments: {"email": emailEC.text});
        return true;
      } catch (e) {
        ApiProcessorController.errorSnack("Failed to generate OTP");
        return false;
      } finally {
        isLoading.value = false;
      }
    }
    return false;
  }
}
