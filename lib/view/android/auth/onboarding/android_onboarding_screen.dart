import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/controllers/auth/onboarding_controller.dart';

class AndroidOnboardingScreen extends GetView<OnboardingController> {
  const AndroidOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: Scaffold(
        backgroundColor: colorScheme.primary,
        body: ListView(
          children: const [],
        ),
      ),
    );
  }
}
