import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stellar/constants/assets.dart';
import 'package:stellar/theme/colors.dart';

// Top Section
forgotPasswordTopSection(Size size, ColorScheme colorScheme) {
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
