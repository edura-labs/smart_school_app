import 'package:flutter/material.dart';
import 'package:stellar/constants/consts.dart';
import 'package:stellar/theme/colors.dart';

bottomSection(Size size) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: SizedBox(
      width: size.width / 2,
      child: Column(
        children: [
          Text(
            "Ride with Ease",
            style: defaultTextStyle(
              color: kTextWhiteColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Divider(color: kLightBackgroundColor),
          Text(
            "Pick your Trip",
            style: defaultTextStyle(
              color: kTextWhiteColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
