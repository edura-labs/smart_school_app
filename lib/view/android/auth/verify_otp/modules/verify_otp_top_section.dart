import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stellar/constants/assets.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/theme/colors.dart';

verifyOTPTopSection(Size size, ColorScheme colorScheme) {
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
