import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stellar/controllers/api_processor_controller.dart';

class ConnectivityStatusController extends GetxController {
  static ConnectivityStatusController get instance {
    return Get.find<ConnectivityStatusController>();
  }

  var isConnected = false.obs;
  var connectionType = ''.obs;
  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 3));
    // initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus = result;
    if (result.contains(ConnectivityResult.mobile)) {
      // Mobile network available.
      ApiProcessorController.successSnack("Cellular network is connected");
    } else if (result.contains(ConnectivityResult.wifi)) {
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
      ApiProcessorController.successSnack("Wi-Fi is connected");
    } else if (result.contains(ConnectivityResult.none)) {
      ApiProcessorController.errorSnack("No internet connection");
    }
    log('Connectivity changed: $_connectionStatus');
  }
}
