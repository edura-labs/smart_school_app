import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/constants/assets.dart';
import 'package:stellar/controllers/auth/forgot_password_controller.dart';
import 'package:stellar/theme/colors.dart';
import 'package:stellar/view/android/auth/forgot_password/modules/form_section.dart';
import 'package:stellar/view/android/auth/forgot_password/modules/top_section.dart';

class AndroidForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const AndroidForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colorScheme.primary,
        body: Stack(
          children: [
            backgroundImage(size),
            SafeArea(
              child: Column(
                children: [
                  forgotPasswordTopSection(size, colorScheme),
                  forgotPasswordFormSection(colorScheme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Background Image
  backgroundImage(Size size) {
    return Image.asset(
      Assets.atomIconPng,
      color: kLightGreyColor.withOpacity(0.06),
      height: size.height / 1.2,
      width: size.width,
      fit: BoxFit.cover,
    );
  }
}
