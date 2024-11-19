// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stellar/constants/consts.dart';

class AndroidOutlinedButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool isLoading;
  final bool disable;
  final String? fontFamily;
  final double? buttonElevation,
      borderWidth,
      borderRadius,
      fontSize,
      buttonIconSize;

  final bool? isRowVisible, isSwitched;
  final MainAxisAlignment? mainAxisAlignment;
  final IconData? buttonIcon;
  final Color? borderColor,
      buttonColor,
      indicatorColor,
      textColor,
      buttonIconColor;
  final Widget? rowIconWidget;
  final FontWeight? fontWeight;

  const AndroidOutlinedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.disable = false,
    this.fontSize,
    this.fontFamily,
    this.buttonElevation,
    this.isRowVisible,
    this.buttonIcon,
    this.buttonIconColor,
    this.buttonIconSize,
    this.isSwitched = false,
    this.borderRadius,
    this.mainAxisAlignment,
    this.buttonColor,
    this.indicatorColor,
    this.textColor,
    this.rowIconWidget,
    this.fontWeight,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;
    return OutlinedButton(
      onPressed: disable
          ? null
          : isLoading
              ? null
              : onPressed,
      onLongPress: null,
      style: OutlinedButton.styleFrom(
        disabledBackgroundColor: colorScheme.inversePrimary.withOpacity(.6),
        backgroundColor: colorScheme.surface,
        side: BorderSide(
            color: borderColor ?? colorScheme.primary,
            width: borderWidth ?? .6),
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
                            color: textColor ?? colorScheme.primary,
                            fontSize: fontSize ?? 14,
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
                            color: textColor ?? colorScheme.primary,
                            fontSize: fontSize ?? 14,
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
                    color: textColor ?? colorScheme.primary,
                    fontSize: fontSize ?? 14,
                    fontFamily: fontFamily,
                    fontWeight: fontWeight ?? FontWeight.w600,
                  ),
                ),
    );
  }
}
