import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

onboardImage(
  String image,
  Size size,
) {
  return SvgPicture.asset(
    image,
    height: size.height / 2.2,
  ).animate().scale(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 800),
      );
}
