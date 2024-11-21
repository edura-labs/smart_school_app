import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stellar/controllers/connectivity_status_controller.dart';
import 'package:stellar/controllers/theme_controller.dart';
import 'package:stellar/utils/components/app_error_widget.dart';
// import 'package:stellar/view/android/onboarding/onboarding_screen_1.dart';
// import 'package:stellar/view/android/onboarding/onboarding_screen_2.dart';
import 'package:stellar/view/android/onboarding/onboarding_screen_3.dart';

import 'routes/routes.dart';
import 'theme/app_theme.dart';
import 'theme/colors.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: kTransparentColor),
  );
  WidgetsFlutterBinding.ensureInitialized();
  // Lock device orientation to portrait up
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  prefs = await SharedPreferences.getInstance();

  Get.put(ThemeController());
  Get.put(ConnectivityStatusController());

  //This is to handle widget errors by showing a custom error widget screen
  if (kReleaseMode) ErrorWidget.builder = (_) => const AppErrorWidget();

  FlutterError.onError = (details) {
    FlutterError.dumpErrorToConsole(details);
    if (!kReleaseMode) return;
  };

  runApp(const MyApp());
}

late SharedPreferences prefs;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //iOS App
    if (Platform.isIOS) {
      return GetCupertinoApp(
        title: "Stellar",
        color: kPrimaryColor,
        navigatorKey: Get.key,
        defaultTransition: Transition.native,
        debugShowCheckedModeBanner: false,
        highContrastTheme: androidLightTheme,
        highContrastDarkTheme: androidDarkTheme,
        locale: Get.deviceLocale,
        initialRoute: Routes.startupSplashscreen,
        // getPages: Routes.getPages,
        theme: Get.isDarkMode ? iOSDarkTheme : iOSLightTheme,
      );
    }

    //Android App
    return GetMaterialApp(
      title: "Stellar",
      color: kPrimaryColor,
      navigatorKey: Get.key,
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      highContrastTheme: androidLightTheme,
      highContrastDarkTheme: androidDarkTheme,
      locale: Get.deviceLocale,
      initialRoute: Routes.startupSplashscreen,
      getPages: Routes.getPages,
      theme: androidLightTheme,
      darkTheme: androidDarkTheme,
      themeMode: ThemeController.instance.themeMode.value,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        multitouchDragStrategy: MultitouchDragStrategy.sumAllPointers,
        // physics: const BouncingScrollPhysics(),
        scrollbars: true,
      ),
      // This is the home route
       home: const OnboardingScreen3(),
    );
  }
}
