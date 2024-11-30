import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/controllers/auth/verify_otp_controller.dart';
import 'package:stellar/utils/buttons/android/android_elevated_button.dart';
import 'package:stellar/view/android/auth/verify_otp/modules/verify_otp_form.dart';

verifyOTPFormSection(
  BuildContext context,
  ColorScheme colorScheme,
  VerifyOTPController controller,
) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(32),
          ),
        ),
      ),
      child: ListView(
        children: [
          20.toHeight,
          Text(
            "Enter OTP",
            style: defaultTextStyle(
              fontSize: 16,
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
          20.toHeight,
          androidVerifyOTPForm(controller, context),
          Obx(() {
            return Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: controller.timerComplete.value
                    ? controller.requestOTP
                    : null,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  style: defaultTextStyle(
                    fontSize: 15.0,
                    color: controller.timerComplete.value
                        ? colorScheme.primary
                        : colorScheme.inversePrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  child: const Text("Send again"),
                ),
              ),
            );
          }),
          20.toHeight,
          Obx(() {
            return AndroidElevatedButton(
              title: "Verify OTP",
              isLoading: controller.isLoading.value,
              onPressed: () {},
            );
          }),
        ],
      ),
    ),
  );
}
