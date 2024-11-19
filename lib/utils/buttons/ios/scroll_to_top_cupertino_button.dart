import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';

scrollToTopCupertinoButton(
  controller,
) {
  return CupertinoButton(
    padding: const EdgeInsets.all(0),
    borderRadius: BorderRadius.circular(100),
    onPressed: controller.scrollToTop,
    color: kAccentColor,
    child: const Icon(Icons.keyboard_arrow_up),
  );
}
