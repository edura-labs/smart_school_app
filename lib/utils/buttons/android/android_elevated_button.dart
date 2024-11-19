// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stellar/constants/consts.dart';

import '../../../../../theme/colors.dart';

class AndroidElevatedButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool isLoading;
  final bool disable;
  final String? fontFamily;
  final double? buttonElevation, borderRadius, fontSize, buttonIconSize;
  final bool? isRowVisible, isSwitched;
  final MainAxisAlignment? mainAxisAlignment;
  final IconData? buttonIcon;
  final Color? disabledBackgroundColor,
      buttonColor,
      indicatorColor,
      textColor,
      buttonIconColor;
  final Widget? rowIconWidget;
  final FontWeight? fontWeight;

  const AndroidElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.disable = false,
    this.fontFamily,
    this.fontSize,
    this.buttonElevation,
    this.isRowVisible = false,
    this.buttonIcon,
    this.buttonIconColor,
    this.buttonIconSize,
    this.isSwitched,
    this.buttonColor,
    this.borderRadius,
    this.mainAxisAlignment,
    this.indicatorColor,
    this.textColor,
    this.rowIconWidget,
    this.fontWeight,
    this.disabledBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: disable
          ? null
          : isLoading
              ? null
              : onPressed,
      onLongPress: null,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: disabledBackgroundColor ??
            colorScheme.inversePrimary.withOpacity(.6),
        backgroundColor: buttonColor ?? colorScheme.secondary,
        elevation: buttonElevation ?? 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10)),
        minimumSize: Size(media.width, 40),
      ),
      child: isLoading
          ? CupertinoActivityIndicator(color: colorScheme.surface)
          : isRowVisible == true
              ? isSwitched == true
                  ? Row(
                      mainAxisAlignment:
                          mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
                      children: [
                        rowIconWidget ??
                            Icon(
                              buttonIcon,
                              color: buttonIconColor,
                              size: buttonIconSize ?? 16,
                            ),
                        mainAxisAlignment == null
                            ? const SizedBox()
                            : 10.toWidth,
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: defaultTextStyle(
                            color: textColor ?? kTextWhiteColor,
                            fontSize: fontSize ?? 14.0,
                            fontFamily: fontFamily,
                            fontWeight: fontWeight ?? FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment:
                          mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: defaultTextStyle(
                            color: textColor ?? kTextWhiteColor,
                            fontSize: fontSize ?? 14.0,
                            fontFamily: fontFamily,
                            fontWeight: fontWeight ?? FontWeight.w600,
                          ),
                        ),
                        mainAxisAlignment == null
                            ? const SizedBox()
                            : 10.toWidth,
                        rowIconWidget ??
                            Icon(
                              buttonIcon,
                              color: buttonIconColor,
                              size: buttonIconSize ?? 16,
                            ),
                      ],
                    )
              : Text(
                  title,
                  textAlign: TextAlign.center,
                  style: defaultTextStyle(
                    color: textColor ?? kTextWhiteColor,
                    fontSize: fontSize ?? 14.0,
                    fontFamily: fontFamily,
                    fontWeight: fontWeight ?? FontWeight.w600,
                  ),
                ),
    );
  }
}
