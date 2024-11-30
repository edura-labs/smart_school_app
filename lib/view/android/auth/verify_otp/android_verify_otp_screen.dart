import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/constants/assets.dart';
import 'package:stellar/controllers/auth/verify_otp_controller.dart';
import 'package:stellar/theme/colors.dart';
import 'package:stellar/view/android/auth/verify_otp/modules/verify_otp_form_section.dart';
import 'package:stellar/view/android/auth/verify_otp/modules/verify_otp_top_section.dart';

class AndroidVerifyOTPSreen extends GetView<VerifyOTPController> {
  const AndroidVerifyOTPSreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

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
                  verifyOTPTopSection(size, colorScheme),
                  verifyOTPFormSection(context, colorScheme, controller)
                ],
              ),
            ),
          ],
        ),
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
