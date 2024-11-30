import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stellar/constants/assets.dart';
import 'package:stellar/controllers/auth/forgot_password_controller.dart';
import 'package:stellar/theme/colors.dart';
import 'package:stellar/utils/buttons/android/android_elevated_button.dart';
import 'package:stellar/utils/text_form_fields/android/android_textformfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
            _backgroundImage(size),
            SafeArea(
              child: Column(
                children: [
                  _topSection(size, colorScheme),
                  _formSection(colorScheme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Background Image
  Widget _backgroundImage(Size size) {
    return Image.asset(
      Assets.atomIconPng,
      color: kLightGreyColor.withOpacity(0.06),
      height: size.height / 1.2,
      width: size.width,
      fit: BoxFit.cover,
    );
  }

  // Top Section
  Widget _topSection(Size size, ColorScheme colorScheme) {
    return SizedBox(
      height: size.height / 3.6,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            height: 100,
            width: 100,
            Assets.appIconSvg,
          ),
          const SizedBox(height: 10),
          Text(
            "Stellar",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorScheme.inversePrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Forgot Password",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kTextWhiteColor,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // Form Section
  Widget _formSection(ColorScheme colorScheme) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
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
                    textInputAction: TextInputAction.done,
                    textCapitalization: TextCapitalization.none,
                    validator: controller.validateEmail,
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
                  ),
                  const SizedBox(height: 40),
                  Obx(() {
                    return AndroidElevatedButton(
                      title: controller.isLoading.value
                          ? "Loading..."
                          : "Generate OTP",
                      onPressed: controller.isLoading.value
                          ? null
                          : () => controller.generateOtp(),
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


