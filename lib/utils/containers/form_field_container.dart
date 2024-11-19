import 'package:flutter/material.dart';
import 'package:stellar/theme/colors.dart';

Widget formFieldContainer(
  ColorScheme colorScheme,
  Size media, {
  Widget? child,
  double? containerHeight,
  double? containerWidth,
  double? borderRadius,
  EdgeInsetsGeometry? padding,
  Color? color,
  Color? borderSideColor,
}) {
  return Container(
    width: containerWidth ?? media.width,
    height: containerHeight ?? media.height * 0.06,
    padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
    decoration: ShapeDecoration(
      color: color ?? kTransparentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        side: BorderSide(
            color: borderSideColor ?? colorScheme.primary, width: 0.2),
      ),

      // shadows: [
      //   BoxShadow(
      //     color: const Color(0x0C000000),
      //     blurRadius: 10,
      //     offset: const Offset(0, 4),
      //     spreadRadius: Get.isDarkMode ? 20 : 10,
      //   ),

      // ],
    ),
    child: Center(
      child: child,
    ),
  );
}
