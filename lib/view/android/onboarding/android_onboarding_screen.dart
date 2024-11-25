import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/controllers/auth/onboarding_controller.dart';
import 'package:stellar/view/android/onboarding/modules/floating_action_button.dart';
import 'package:stellar/view/android/onboarding/modules/get_started_text.dart';
import 'package:stellar/view/android/onboarding/modules/page_view_builder_section.dart';

class AndroidOnboardingScreen extends GetView<OnboardingController> {
  const AndroidOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;
    // var textTheme = Theme.of(context).textTheme;

    return GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (controller) {
          return Obx(() {
            return GestureDetector(
              onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
              child: Scaffold(
                floatingActionButton: controller.isLoading.value
                    ? null
                    : floatingActionButton(colorScheme, controller),
                floatingActionButtonAnimator:
                    FloatingActionButtonAnimator.scaling,
                body: Obx(() {
                  return Stack(
                    children: [
                      pageViewBuilderSection(controller, size, colorScheme),
                      controller.currentPage.value <
                              controller.onboardContent.value.items.length - 1
                          ? const SizedBox()
                          : Positioned(
                              bottom: 40,
                              left: (size.width - 120) / 2,
                              child: getStartedText("Get Started"),
                            ),
                      controller.isLoading.value
                          ? BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 70,
                                sigmaY: 70,
                              ),
                              child: Center(
                                child: CircularProgressIndicator.adaptive(
                                  strokeAlign: 10,
                                  strokeWidth: 10,
                                  backgroundColor: colorScheme.surface,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  );
                }),
              ),
            );
          });
        });
  }
}
