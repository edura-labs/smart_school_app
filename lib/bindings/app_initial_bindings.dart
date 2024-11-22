import 'dart:developer';

import 'package:get/get.dart';
import 'package:stellar/controllers/others/connectivity_status_controller.dart';
import 'package:stellar/controllers/others/theme_controller.dart';

class AppInitialBindings implements Bindings {
  // String? tag;

  // AppInitialBindings({this.tag});

  @override
  void dependencies() {
    log("AppInitialBindings are being executed");
    Get.put(ThemeController(), permanent: true);
    Get.put(ConnectivityStatusController(), permanent: true);
  }
}
