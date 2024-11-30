import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance {
    return Get.find<LoginController>();
  }

  @override
  void onClose() {
    emailEC.dispose();
    passwordEC.dispose();
    emailFN.dispose();
    passwordFN.dispose();
    super.onClose();
  }

  //=========== Keys =============\\
  final formKey = GlobalKey<FormState>();

  //=========== Variables =============\\

  //=========== Booleans =============\\
  var isLoading = false.obs;
  var passwordIsHidden = true.obs;

  //=========== Controllers =============\\
  var emailEC = TextEditingController();
  var passwordEC = TextEditingController();

  //=========== Focus Nodes =============\\
  var emailFN = FocusNode();
  var passwordFN = FocusNode();

  //=========== Functions =============\\

  String? validateEmail(dynamic value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!GetUtils.isEmail(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? validatePassword(dynamic value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    return null;
  }

  togglePasswordVisibility() {
    passwordIsHidden.value = !passwordIsHidden.value;
  }

  emailOnChanged(String value) {
    if (value.isEmpty) {
    } else {}
  }

  passwordOnChanged(String value) {
    if (value.isEmpty) {
    } else {}
  }

  onFieldSubmitted(String value) {
    login();
  }

  login() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }
}
