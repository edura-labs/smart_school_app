import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/main.dart';

class ThemeController extends GetxController {
  static ThemeController get instance {
    return Get.find<ThemeController>();
  }

  var themeMode = ThemeMode.system.obs; // Default to system theme mode

  @override
  void onInit() {
    super.onInit();
    _loadAndApplyThemeMode();
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    await prefs.setInt('themeMode', themeMode.index);
    this.themeMode.value = themeMode; // Update the observable value
  }

  Future<void> _loadAndApplyThemeMode() async {
    final loadedThemeMode = await loadThemeMode();
    if (loadedThemeMode != null) {
      themeMode.value = loadedThemeMode;
    }
  }

  Future<ThemeMode?> loadThemeMode() async {
    final themeModeIndex = prefs.getInt('themeMode');
    if (themeModeIndex != null) {
      return ThemeMode.values[themeModeIndex];
    }
    return null; // Return null if no theme mode is saved
  }
}
