import 'package:get/get.dart';
import 'package:stellar/view/android/splash_screen/startup/android_startup_screen.dart';

class Routes {
  //Splash screens
  static const startupSplashscreen = "/";
  static const congratulationsSplashScreen = "/congratulations-splash";
  static const successSplashScreen = "/success-splash";
  static const loadingScreen = "/loading";
  static const successScreen = "/success-screen";

  static const onboarding = "/onboarding";

  //========================= GET PAGES ==========================\\
  static final getPages = [
    //Startup and Auth
    GetPage(
      name: startupSplashscreen,
      page: () => const AndroidStartupScreen(),
    ),
  ];
}
