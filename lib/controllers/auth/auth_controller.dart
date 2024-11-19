import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

import '../../../../main.dart';

class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static AuthController get instance {
    return Get.find<AuthController>();
  }

  var isLoading = false.obs;

  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  @override
  void onInit() {
    Timer(const Duration(days: 3), () {
      loadApp();
    });
    super.onInit();
  }

  // var userEmail = prefs.getString("userEmail");
  // var userPhoneNumber = prefs.getString("userPhoneNumber");
  // var userPassword = prefs.getString("password");

  Future<void> loadApp() async {
    bool isOnboarded = prefs.getBool("isOnboarded") ?? false;
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    bool isLoggedOut = prefs.getBool("isLoggedOut") ?? false;

    if (Platform.isIOS) {
    } else {
      if (isLoggedIn) {
        // await UserController.instance.getUserProfile();
        // await Get.offAll(
        //   () => const AndroidHomeScreen(),
        //   routeName: "/home",
        //   fullscreenDialog: true,
        //   curve: Curves.easeInOut,
        //   predicate: (routes) => false,
        //   popGesture: false,
        //   transition: Get.defaultTransition,
        // );
      } else if (!isLoggedIn && isLoggedOut) {
        // await Get.offAll(
        //   () => const AndroidLoginSignupScreen(),
        //   routeName: "/login-signup",
        //   fullscreenDialog: true,
        //   curve: Curves.easeInOut,
        //   predicate: (routes) => false,
        //   popGesture: false,
        //   transition: Get.defaultTransition,
        // );
      } else if (isOnboarded) {
        // await Get.offAll(
        //   () => const AndroidLoginSignupScreen(),
        //   routeName: "/login-signup",
        //   fullscreenDialog: true,
        //   curve: Curves.easeInOut,
        //   predicate: (routes) => false,
        //   popGesture: false,
        //   transition: Get.defaultTransition,
        // );
      } else {
        // await Get.offAll(
        //   () => const AndroidOnboardingScreen(),
        //   routeName: "/onboarding",
        //   fullscreenDialog: true,
        //   curve: Curves.easeInOut,
        //   predicate: (routes) => false,
        //   popGesture: false,
        //   transition: Get.defaultTransition,
        // );
      }
    }
  }
}
