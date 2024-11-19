import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileView,
    required this.tabletView,
    required this.desktopView,
  });

  final Widget mobileView;
  final Widget tabletView;
  final Widget desktopView;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 480) {
          return mobileView;
        } else if (constraints.maxWidth > 480 && constraints.maxWidth <= 900) {
          return mobileView;
        } else {
          return desktopView;
        }
      },
    );
  }
}
