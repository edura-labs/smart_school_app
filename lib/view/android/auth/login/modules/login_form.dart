import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/controllers/auth/login_controller.dart';
import 'package:stellar/routes/routes.dart';
import 'package:stellar/utils/buttons/android/android_elevated_button.dart';
import 'package:stellar/utils/text_form_fields/android/android_textformfield.dart';

loginForm(LoginController controller, ColorScheme colorScheme) {
  return Form(
    key: controller.formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.none,
          validator: controller.validateEmail,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: .4,
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
        20.toHeight,
        AndroidTextFormField(
          controller: controller.passwordEC,
          focusNode: controller.passwordFN,
          obscureText: controller.passwordIsHidden.value,
          obscuringCharacter: "*",
          prefixIcon: Icon(
            Icons.password,
            color: colorScheme.inversePrimary,
          ),
          suffixIcon: IconButton(
            onPressed: controller.togglePasswordVisibility,
            icon: Icon(
              controller.passwordIsHidden.value
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: colorScheme.inversePrimary,
            ),
          ),
          keyboardType: TextInputType.visiblePassword,
          hintText: "Enter your password",
          labelText: "Password",
          textInputAction: TextInputAction.done,
          textCapitalization: TextCapitalization.none,
          validator: controller.validatePassword,
          onFieldSubmitted: controller.onFieldSubmitted,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: .4,
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
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Get.toNamed(Routes.forgotPassword);
            },
            child: Text(
              "Forgot Password?",
              textAlign: TextAlign.center,
              style: defaultTextStyle(
                color: colorScheme.inversePrimary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        40.toHeight,
        AndroidElevatedButton(
          title: "Sign In",
          isLoading: controller.isLoading.value,
          onPressed: controller.login,
        ),
      ],
    ),
  );
}
