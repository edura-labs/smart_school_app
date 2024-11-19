import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../constants/consts.dart';

class CupertinoElevatedButton extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final bool isLoading;
  final bool disable;
  final String? fontFamily;
  final double? buttonPadding, fontSize;
  final bool? isIcon, isRowVisible, isSwitched;
  final MainAxisAlignment? mainAxisAlignment;
  final IconData? buttonIcon;
  final Color? buttonColor, indicatorColor, textColor, buttonIconColor;
  final double? buttonIconSize;
  final Widget? rowIconWidget, iconWidget;
  final FontWeight? fontWeight;

  const CupertinoElevatedButton({
    super.key,
    required this.onPressed,
    this.title,
    this.isLoading = false,
    this.disable = false,
    this.fontFamily,
    this.fontSize,
    this.isRowVisible,
    this.isSwitched,
    this.buttonIcon,
    this.buttonIconColor,
    this.buttonIconSize,
    this.buttonColor,
    this.rowIconWidget,
    this.indicatorColor,
    this.textColor,
    this.mainAxisAlignment,
    this.fontWeight,
    this.isIcon,
    this.iconWidget,
    this.buttonPadding,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return CupertinoButton(
      borderRadius: BorderRadius.circular(10),
      minSize: 20,
      padding: EdgeInsets.all(buttonPadding ?? 10),
      color: buttonColor ?? kSuccessColor,
      disabledColor: colorScheme.inversePrimary,
      onPressed: disable
          ? null
          : isLoading
              ? null
              : onPressed,
      child: isLoading
          ? CupertinoActivityIndicator(color: colorScheme.primary)
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
                              size: buttonIconSize ?? 14,
                            ),
                        mainAxisAlignment == null
                            ? const SizedBox()
                            : 10.toWidth,
                        Text(
                          title ?? "",
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
                          title ?? "",
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
                              size: buttonIconSize ?? 14,
                            ),
                      ],
                    )
              : isIcon == true
                  ? iconWidget!
                  : Text(
                      title ?? "",
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
