import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/controllers/auth/login_controller.dart';
import 'package:stellar/view/android/auth/login/modules/login_form.dart';

formSection(ColorScheme colorScheme, LoginController controller) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
          ),
        ),
      ),
      child: ListView(
        children: [
          20.toHeight,
          Obx(() {
            return loginForm(controller, colorScheme);
          }),
        ],
      ),
    ),
  );
}
