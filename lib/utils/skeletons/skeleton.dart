import 'package:flutter/material.dart';
import 'package:stellar/constants/consts.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
    this.padding,
    this.color,
  });
  final double height, width, borderRadius;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: color ?? theme.inversePrimary.withOpacity(0.08),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
    );
  }
}
