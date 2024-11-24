import 'package:flutter/material.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/controllers/auth/onboarding_controller.dart';

skipButton(ColorScheme colorScheme, OnboardingController controller) {
  return Align(
    alignment: Alignment.topRight,
    child: TextButton(
      onPressed: controller.goToLastPage,
      child: Text(
        "Skip",
        textAlign: TextAlign.center,
        style: defaultTextStyle(
          color: colorScheme.inversePrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
