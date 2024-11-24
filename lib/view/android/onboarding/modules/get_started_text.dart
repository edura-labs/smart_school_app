import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/theme/colors.dart';

getStartedText(String getStartedText) {
  return Text(
    getStartedText,
    overflow: TextOverflow.ellipsis,
    maxLines: 10,
    textAlign: TextAlign.center,
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
