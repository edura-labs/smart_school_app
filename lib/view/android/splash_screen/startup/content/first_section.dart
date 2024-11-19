import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar/constants/assets.dart';
import 'package:stellar/theme/colors.dart';

firstSection(Size size) {
  return Container(
    height: size.height - 140,
    decoration: ShapeDecoration(
      color: kLightBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(160),
          bottomRight: Radius.circular(300),
        ),
      ),
    ),
    child: Center(
      child: SvgPicture.asset(
        Assets.appIconSvg,
        height: size.height / 4,
        width: size.width / 4,
      )
          .animate(onPlay: (controller) => controller.repeat(), autoPlay: true)
          .scaleXY(
              curve: Curves.easeInOut, duration: const Duration(seconds: 2)),
    ),
  );
}
