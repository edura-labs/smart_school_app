import 'package:flutter/material.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/controllers/auth/onboarding_controller.dart';
import 'package:stellar/view/android/onboarding/modules/onboard_image.dart';
import 'package:stellar/view/android/onboarding/modules/onboard_subtitle.dart';
import 'package:stellar/view/android/onboarding/modules/onboard_title.dart';
import 'package:stellar/view/android/onboarding/modules/skip_button.dart';

pageViewBuilderSection(
    OnboardingController controller, Size size, ColorScheme colorScheme) {
  return PageView.builder(
    controller: controller.pageController,
    itemCount: controller.onboardContent.value.items.length,
    onPageChanged: controller.onPageChanged,
    itemBuilder: (context, index) {
      var title = controller.onboardContent.value.items[index].title;
      var subtitle = controller.onboardContent.value.items[index].description;
      var image = controller.onboardContent.value.items[index].image;
      var backgroundColor =
          controller.onboardContent.value.items[index].backgroundColor;
      return Container(
        width: size.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          // gradient: LinearGradient(
          //   begin: Alignment.centerRight,
          //   transform: const GradientRotation(20),
          //   colors: [
          //     backgroundColor,
          //     backgroundColor.withOpacity(.3),
          //   ],
          // ),
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            controller.currentPage.value <
                    controller.onboardContent.value.items.length - 1
                ? const SizedBox()
                : 40.toHeight,
            controller.currentPage.value <
                    controller.onboardContent.value.items.length - 1
                ? skipButton(colorScheme, controller)
                : const SizedBox(),
            20.toHeight,
            onboardImage(image, size),
            20.toHeight,
            onboardTitle(title),
            20.toHeight,
            onboardSubtitle(subtitle),
          ],
        ),
      );
    },
  );
}
