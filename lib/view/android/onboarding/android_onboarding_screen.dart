import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/controllers/auth/onboarding_controller.dart';
import 'package:stellar/theme/colors.dart';

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
          return GestureDetector(
            onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
            child: Scaffold(
              floatingActionButton:
                  floatingActionButton(colorScheme, controller),
              floatingActionButtonAnimator:
                  FloatingActionButtonAnimator.scaling,
              body: Obx(() {
                return Stack(
                  children: [
                    PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.onboardContent.value.items.length,
                      onPageChanged: controller.onPageChanged,
                      itemBuilder: (context, index) {
                        var title =
                            controller.onboardContent.value.items[index].title;
                        var subtitle = controller
                            .onboardContent.value.items[index].description;
                        var image =
                            controller.onboardContent.value.items[index].image;
                        var backgroundColor = controller
                            .onboardContent.value.items[index].backgroundColor;
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
                                      controller.onboardContent.value.items
                                              .length -
                                          1
                                  ? const SizedBox()
                                  : 40.toHeight,
                              controller.currentPage.value <
                                      controller.onboardContent.value.items
                                              .length -
                                          1
                                  ? skipButton(colorScheme)
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
                    ),
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
  }

  floatingActionButton(
    ColorScheme colorScheme,
    OnboardingController controller,
  ) {
    return Obx(() {
      final progress =
          (controller.currentPage.value + 1) / controller.totalPages;
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

  getStartedText(String getStartedText) {
    return Text(
      getStartedText,
      overflow: TextOverflow.ellipsis,
      maxLines: 10,
      textAlign: TextAlign.center,
      style: defaultTextStyle(
        color: kTextWhiteColor,
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
    ).animate().fadeIn(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 800),
        );
  }

  onboardSubtitle(String subtitle) {
    return Text(
      subtitle,
      overflow: TextOverflow.ellipsis,
      maxLines: 10,
      textAlign: TextAlign.center,
      style: defaultTextStyle(
        color: kTextWhiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ).animate().fadeIn(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 800),
        );
  }

  onboardTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
      style: defaultTextStyle(
        color: kTextWhiteColor,
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
    ).animate().fadeIn(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 800),
        );
  }

  onboardImage(
    String image,
    Size size,
  ) {
    return SvgPicture.asset(
      image,
      height: size.height / 2.2,
    ).animate().scale(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 800),
        );
  }

  skipButton(ColorScheme colorScheme) {
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
}
