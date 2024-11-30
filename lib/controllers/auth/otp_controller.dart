import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  // Method to verify OTP
  void verifyOtp(String otp) {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      // Simulate API call
      Future.delayed(const Duration(seconds: 2), () {
        isLoading.value = false;
        Get.snackbar(
          "OTP Verified",
          "You have successfully verified your OTP",
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    }
  }

  // Method to resend OTP
  void resendOtp() {
    Get.snackbar(
      "OTP Resent",
      "A new OTP has been sent to your email",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Validator for OTP input
  String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter the OTP";
    } else if (value.length != 6) {
      return "OTP must be 6 digits";
    }
    return null;
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}
