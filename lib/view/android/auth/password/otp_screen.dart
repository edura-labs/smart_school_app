import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stellar/constants/assets.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/controllers/auth/otp_controller.dart';
import 'package:stellar/theme/colors.dart';
import 'package:stellar/utils/buttons/android/android_elevated_button.dart';
import 'package:stellar/utils/components/otp_field_widget.dart';

class OTPSreen extends GetView<OTPController> {
  const OTPSreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<OTPController>(
      init: OTPController(),
      builder: (controller) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: Scaffold(
            backgroundColor: colorScheme.primary,
            body: Stack(
              children: [
                backgroundImage(size),
                SafeArea(
                  child: Column(
                    children: [
                      topSection(size, colorScheme),
                      formSection(colorScheme, controller),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  formSection(ColorScheme colorScheme, OTPController controller) {
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
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              20.toHeight,
              Text(
                "Enter OTP",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              20.toHeight,
              OTPField(
                controller: controller.otpController,
                onCompleted: (otp) {
                  controller.verifyOtp(otp);
                },
              ),
              20.toHeight,
              Obx(() {
                return AndroidElevatedButton(
                  title: controller.isLoading.value ? "Verifying..." : "Verify OTP",
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          controller.verifyOtp(controller.otpController.text);
                        },
                );
              }),
              20.toHeight,
              GestureDetector(
                onTap: () {
                  controller.resendOtp();
                },
                child: const Text(
                  "Send Again",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  topSection(Size size, ColorScheme colorScheme) {
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
          10.toHeight,
          Text(
            "Stellar",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: colorScheme.inversePrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          20.toHeight,
          Text(
            "Forgot Password",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: kTextWhiteColor,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  backgroundImage(Size size) {
    return Image.asset(
      Assets.atomIconPng,
      color: kLightGreyColor.withOpacity(.06),
      height: size.height / 1.2,
      width: size.width,
      fit: BoxFit.cover,
    );
  }
}

