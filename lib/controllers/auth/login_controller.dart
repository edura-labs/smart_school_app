import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance {
    return Get.find<LoginController>();
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

  login() {}
}
