import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/controllers/auth/onboarding_controller.dart';
import 'package:stellar/theme/colors.dart';

floatingActionButton(
  ColorScheme colorScheme,
  OnboardingController controller,
) {
  return Obx(() {
    final progress = (controller.currentPage.value + 1) / controller.totalPages;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 72,
            width: 72,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              backgroundColor: controller.currentPage.value <
                      controller.onboardContent.value.items.length - 1
                  ? colorScheme.primary
                  : colorScheme.primary,
              value: progress,
              valueColor: AlwaysStoppedAnimation<Color>(kAccentColor),
            ),
          ),
          IconButton(
            onPressed: controller.currentPage.value <
                    controller.onboardContent.value.items.length - 1
                ? controller.goToNextPage
                : controller.login,
            style: IconButton.styleFrom(
                shape: const CircleBorder(),
                elevation: 40,
                enableFeedback: true,
                shadowColor: kDarkBackgroundColor,
                foregroundColor: kLightBackgroundColor,
                backgroundColor: colorScheme.inversePrimary,
                minimumSize: const Size(60, 60)),
            tooltip: "Go to next page",
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  });
}
