import 'package:flutter/material.dart';

Widget loadingIndicator(
  Size? media,
  ColorScheme colorScheme,
) {
  return SizedBox(
    width: media!.width,
    height: 2,
    child: LinearProgressIndicator(color: colorScheme.secondary),
  );
}
