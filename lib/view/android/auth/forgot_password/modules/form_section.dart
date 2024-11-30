import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/controllers/auth/forgot_password_controller.dart';
import 'package:stellar/utils/buttons/android/android_elevated_button.dart';
import 'package:stellar/utils/text_form_fields/android/android_textformfield.dart';

// Form Section
forgotPasswordFormSection(ColorScheme colorScheme) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
          ),
        ),
      ),
      child: GetBuilder<ForgotPasswordController>(
        init: ForgotPasswordController(),
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                AndroidTextFormField(
                  controller: controller.emailEC,
                  focusNode: controller.emailFN,
                  prefixIcon: Icon(
                    Icons.email,
                    color: colorScheme.inversePrimary,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email",
                  hintText: "Enter your email address",
                  validator: controller.validateEmail,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.none,
                  onFieldSubmitted: controller.onFieldSubmitted,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 0.4,
                      color: colorScheme.primary,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 1,
                      color: colorScheme.primary,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 1,
                      color: colorScheme.inversePrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Obx(() {
                  return AndroidElevatedButton(
                    title: "Generate OTP",
                    isLoading: controller.isLoading.value,
                    onPressed: controller.generateOtp,
                  );
                }),
                20.toHeight,
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "Cancel",
                    textAlign: TextAlign.center,
                    style: defaultTextStyle(
                      color: colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
