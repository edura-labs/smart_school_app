import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../constants/consts.dart';
import '../../../../../../../../theme/colors.dart';

myAppBar(
  ColorScheme colorScheme,
  Size media, {
  Color? backgroundColor,
  Color? backIconColor,
  bool? centerTitle,
  bool? leadingIsVisible = true,
  String? title,
  bool? automaticallyImplyLeading,
  Widget? flexibleSpace,
  double? leadingWidth,
  double? elevation,
  double? scrolledUnderElevation,
  double? toolBarHeight,
  Widget? titleWidget,
  Widget? leading,
  PreferredSizeWidget? bottom,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: backgroundColor ?? colorScheme.surface,
    centerTitle: centerTitle ?? true,
    automaticallyImplyLeading: automaticallyImplyLeading ?? false,
    flexibleSpace: flexibleSpace ?? Container(),
    elevation: elevation ?? 0,
    scrolledUnderElevation: scrolledUnderElevation ?? 0,
    bottom: bottom,
    toolbarHeight: toolBarHeight ?? kToolbarHeight,
    leadingWidth: leadingWidth ?? 56.0,
    leading: leadingIsVisible == true
        ? leading ??
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: IconButton(
                tooltip: "Go back",
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.chevron_left,
                  size: 26,
                  color: backIconColor,
                ),
              ),
            )
        : const SizedBox(),
    title: titleWidget ??
        SizedBox(
          width: media.width / 1.6,
          child: Text(
            title ?? "",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: kTextBoldHeadingColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
    actions: actions ?? [],
  );
}
