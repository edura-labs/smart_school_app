import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../constants/assets.dart';
import '../../constants/consts.dart';

Widget circleAvatarImage(
  ColorScheme colorScheme, {
  Color? backgroundColor,
  Color? textColor,
  double? height,
  double? radius,
  String? imageText,
  ImageProvider<Object>? foregroundImage,
}) {
  return SizedBox(
    height: height ?? 40,
    child: FittedBox(
      fit: BoxFit.contain,
      child: CircleAvatar(
        backgroundColor: backgroundColor ?? Colors.grey.shade200,
        radius: radius ?? 64,
        foregroundImage:
            foregroundImage ?? const NetworkImage(Assets.userPlaceholderImage),
        child: Text(
          imageText ?? "",
          style: defaultTextStyle(
            fontSize: 32.0,
            color: textColor ?? kTextBoldHeadingColor,
          ),
        ),
      ),
    ),
  );
}
