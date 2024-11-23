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
    // var size = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: Scaffold(
        floatingActionButton: Obx(
          () {
            final progress =
                (controller.currentPage.value + 1) / controller.totalPages;

            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 72,
                  width: 72,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 2.0,
                    strokeCap: StrokeCap.round,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(colorScheme.primary),
                    backgroundColor: kAccentColor,
                  ),
                ),
                FloatingActionButton(
                  onPressed: controller.goToNextPage,
                  shape: const CircleBorder(),
                  tooltip: "Go to next page",
                  foregroundColor: kLightBackgroundColor,
                  backgroundColor: colorScheme.inversePrimary,
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            );
          },
        ),
        body: Obx(
          () {
            return PageView.builder(
              controller: controller.pageController,
              itemCount: controller.onboardContent.value.items.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var title = controller.onboardContent.value.items[index].title;
                var subtitle =
                    controller.onboardContent.value.items[index].description;
                var image = controller.onboardContent.value.items[index].image;
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      transform: const GradientRotation(20),
                      colors: [
                        kPrimaryColor.withOpacity(.4),
                        kPrimaryColor.withOpacity(.3),
                      ],
                    ),
                  ),
                  child: ListView(
                    children: [
                      skipButton(colorScheme),
                      40.toHeight,
                      onboardImage(image),
                      20.toHeight,
                      onboardTitle(title),
                      20.toHeight,
                      onboardSubtitle(subtitle, textTheme),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  onboardSubtitle(String subtitle, TextTheme textTheme) {
    return Text(
      subtitle,
      overflow: TextOverflow.ellipsis,
      maxLines: 10,
      textAlign: TextAlign.center,
      style: textTheme.bodyMedium,
    ).animate().fadeIn(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 800),
        );
  }

  onboardTitle(String title) {
    return Text(
      title,
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

  onboardImage(String image) {
    return FittedBox(
      fit: BoxFit.contain,
      child: SvgPicture.asset(image),
    ).animate().scale(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 800),
        );
  }

  Align skipButton(ColorScheme colorScheme) {
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
