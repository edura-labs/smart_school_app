import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/theme/colors.dart';

onboardSubtitle(String subtitle) {
  return Text(
    subtitle,
    overflow: TextOverflow.ellipsis,
    maxLines: 10,
    textAlign: TextAlign.center,
    style: defaultTextStyle(
      color: kTextWhiteColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ).animate().fadeIn(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 800),
      );
}
