import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/routes/routes.dart';
import 'package:stellar/view/android/onboarding/module/onboard_content.dart';

import '../../../main.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find<OnboardingController>();

  //=========== Variables =============\\
  // Total number of pages
  final int totalPages = 4;
  // Observable for the current page index
  var currentPage = 0.obs;
  var onboardContent = OnboardContent().obs;

  //=========== Booleans =============\\
  var isLastPage = false.obs;

  //=========== Controllers =============\\
  var scrollController = ScrollController().obs;
  var pageController = PageController();

  //=========== Functions =============\\
  onPageChanged(int index) {
    currentPage.value = index;
  }

  setIsLastPage(index) {
    isLastPage.value = onboardContent.value.items.length - 1 == index;
  }

  goToLastPage() => pageController.animateToPage(
        onboardContent.value.items.length,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

  goToNextPage() => pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

  login() async {
    //Save state that the user has been onboarded
    prefs.setBool("isOnboarded", true);

    await Get.offAllNamed(
      Routes.login,
      // () => const AndroidLoginScreen(),
      // routeName: "/login",
      // fullscreenDialog: true,
      // curve: Curves.easeInOut,
      predicate: (routes) => false,
      // popGesture: false,
      // transition: Get.defaultTransition,
    );
  }
}
