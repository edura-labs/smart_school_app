import 'package:get/get.dart';
import 'package:stellar/controllers/auth/auth_controller.dart';
import 'package:stellar/controllers/auth/login_controller.dart';
import 'package:stellar/controllers/auth/onboarding_controller.dart';
import 'package:stellar/view/android/auth/login/android_login_screen.dart';
import 'package:stellar/view/android/onboarding/android_onboarding_screen.dart';
import 'package:stellar/view/android/splash_screen/startup/android_startup_screen.dart';

class Routes {
  //Splash screens
  static const startupSplashscreen = "/";
  static const successSplashScreen = "/success-splash";
  static const loadingScreen = "/loading";
  static const successScreen = "/success-screen";

  //Auth screens
  static const onboarding = "/onboarding";
  static const login = "/login";

  //========================= GET PAGES ==========================\\
  static final getPages = [
    //Startup and Auth
    GetPage(
      name: startupSplashscreen,
      page: () => const AndroidStartupScreen(),
      binding: BindingsBuilder(() => Get.lazyPut<AuthController>(
            () => AuthController(),
          )),
    ),
    GetPage(
      name: login,
      page: () => const AndroidOnboardingScreen(),
      binding: BindingsBuilder(() => Get.lazyPut<OnboardingController>(
            () => OnboardingController(),
          )),
    ),
    GetPage(
      name: login,
      page: () => const AndroidLoginScreen(),
      binding: BindingsBuilder(() => Get.lazyPut<LoginController>(
            () => LoginController(),
          )),
    ),
  ];
}
