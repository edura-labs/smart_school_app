import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/controllers/auth/login_controller.dart';
import 'package:stellar/main.dart';
import 'package:stellar/view/android/auth/login/android_login_screen.dart';
import 'package:stellar/view/android/onboarding/modules/onboard_content.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find<OnboardingController>();
  @override
  void onInit() {
    pageController.addListener(pageListener);
    startAutoPageTimer();
    super.onInit();
  }

  @override
  void onClose() {
    _pageTimer?.cancel();
    super.onClose();
  }

  //=========== Variables =============\\
  // Total number of pages
  final int totalPages = 4;
  // Observable for the current page index
  var currentPage = 0.obs;
  var onboardContent = OnboardContent().obs;
  Timer? _pageTimer;

  //=========== Booleans =============\\
  var isLastPage = false.obs;
  var shouldAnimate = false.obs;
  var isLoading = false.obs;

  //=========== Controllers =============\\
  var pageController = PageController();

  //=========== Functions =============\\

  // Listener to track current page and reset the timer if user navigates manually
  pageListener() {
    int newPage = pageController.page!.round();
    if (newPage != currentPage.value) {
      currentPage.value = newPage;
      resetAutoPageTimer();
    }
    setIsLastPage(newPage);
  }

  // Starts the auto page navigation timer
  void startAutoPageTimer() {
    _pageTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!isLastPage.value) {
        goToNextPage();
      } else {
        timer.cancel();
      }
    });
  }

  // Reset and restart the timer
  void resetAutoPageTimer() {
    _pageTimer?.cancel();
    if (!isLastPage.value) {
      startAutoPageTimer();
    }
  }

  // Checks if the current page is the last page
  setIsLastPage(int index) {
    isLastPage.value = onboardContent.value.items.length - 1 == index;
    if (isLastPage.value) {
      _pageTimer?.cancel(); // Stop timer if on the last page
    }
  }

  onPageChanged(int index) {
    currentPage.value = index;
  }

  goToLastPage() => pageController.animateToPage(
        onboardContent.value.items.length,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

  goToNextPage() {
    if (currentPage.value < onboardContent.value.items.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  login() async {
    shouldAnimate.value = true;
    await Future.delayed(const Duration(milliseconds: 1400), () {
      isLoading.value = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    shouldAnimate.value = false;
    isLoading.value = false;
    // Save state that the user has been onboarded
    prefs.setBool("isOnboarded", true);

    await Get.offAll(
      () => const AndroidLoginScreen(),
      routeName: "/login",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
      binding: BindingsBuilder(() => Get.lazyPut<LoginController>(
            () => LoginController(),
          )),
    );
  }
}
