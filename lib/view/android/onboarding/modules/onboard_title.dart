import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/theme/colors.dart';

onboardTitle(String title) {
  return Text(
    title,
    textAlign: TextAlign.center,
    maxLines: 10,
    overflow: TextOverflow.ellipsis,
    style: defaultTextStyle(
      color: kTextWhiteColor,
      fontSize: 20,
      fontWeight: FontWeight.w900,
    ),
  ).animate().fadeIn(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 800),
      );
}
