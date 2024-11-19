import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:stellar/constants/consts.dart';

import '../../../theme/colors.dart';

class MessageAlertToast extends StatelessWidget {
  final String title, message, appLogo;
  final Color color;
  const MessageAlertToast({
    super.key,
    required this.title,
    required this.message,
    required this.appLogo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return ToastCard(
      color: colorScheme.surface,
      leading: Image.asset(appLogo, color: kPrimaryColor),
      title: Text(
        title,
        style: defaultTextStyle(
          fontWeight: FontWeight.w900,
          color: color,
          fontSize: 14,
          letterSpacing: -0.40,
        ),
      ),
      subtitle: Text(
        message,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: defaultTextStyle(
          fontWeight: FontWeight.w800,
          color: colorScheme.inversePrimary,
          fontSize: 14,
          letterSpacing: -0.40,
        ),
      ),
    );
  }
}
