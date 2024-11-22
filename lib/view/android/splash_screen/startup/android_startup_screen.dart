import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/controllers/auth/auth_controller.dart';
import 'package:stellar/view/android/splash_screen/startup/module/center_section.dart';

class AndroidStartupScreen extends GetView<AuthController> {
  const AndroidStartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // //Initialize the controller
    // Get.put(AuthController());

    var size = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: Scaffold(
            backgroundColor: colorScheme.primary,
            appBar: AppBar(toolbarHeight: 0),
            body: centerSection(size),
          ),
        );
      },
    );
  }
}
