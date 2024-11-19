import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stellar/constants/consts.dart';

import 'colors.dart';

//IOS Light Theme
CupertinoThemeData? iOSLightTheme = CupertinoThemeData(
  brightness: Brightness.light,
  applyThemeToAll: true,
  scaffoldBackgroundColor: kLightBackgroundColor,
  barBackgroundColor: kLightBackgroundColor,
  textTheme: CupertinoTextThemeData(
    textStyle: defaultTextStyle(),
  ),
);

//IOS Dark Theme
CupertinoThemeData? iOSDarkTheme = CupertinoThemeData(
  brightness: Brightness.dark,
  applyThemeToAll: true,
  scaffoldBackgroundColor: kDarkBackgroundColor,
  barBackgroundColor: kDarkBackgroundColor,
  textTheme: CupertinoTextThemeData(
    textStyle: defaultTextStyle(),
  ),
);

//Android Light Theme
ThemeData androidLightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  applyElevationOverlayColor: false,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 36,
      fontWeight: FontWeight.w900,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    titleMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    titleSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 16,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 24,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 18,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    bodySmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 12,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    labelLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 30,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    labelMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    labelSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 10,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
  ),
  // textTheme: GoogleFonts.montserratAlternatesTextTheme(Typography.dense2021),
  colorScheme: ColorScheme.light(
    surface: kLightBackgroundColor,
    primary: kDarkBackgroundColor,
    inversePrimary: Colors.grey,
    secondary: kAccentColor,
    brightness: Brightness.light,
    error: Colors.red,
  ),
);

//Android Dark Theme
ThemeData androidDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  applyElevationOverlayColor: false,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 36,
      fontWeight: FontWeight.w900,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    titleMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    titleSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 16,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 24,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 18,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    bodySmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 12,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    labelLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 30,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    labelMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    labelSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 10,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
  ),
  // textTheme: GoogleFonts.montserratAlternatesTextTheme(Typography.dense2021),
  colorScheme: ColorScheme.dark(
    surface: kDarkBackgroundColor,
    primary: kLightBackgroundColor,
    inversePrimary: Colors.grey.shade800,
    secondary: kAccentColor,
    brightness: Brightness.dark,
    error: Colors.red,
  ),
);
