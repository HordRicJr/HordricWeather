import 'package:flutter/material.dart';

enum ScreenSize { mobile, tabletPortrait, tabletLandscape, desktop }

class Responsive {
  static ScreenSize getSize(BuildContext ctx) {
    final w = MediaQuery.of(ctx).size.width;
    if (w < 600) return ScreenSize.mobile;
    if (w >= 600 && w < 900) return ScreenSize.tabletPortrait;
    if (w >= 900 && w < 1200) return ScreenSize.tabletLandscape;
    return ScreenSize.desktop;
  }

  static double horizontalPadding(BuildContext ctx) {
    switch (getSize(ctx)) {
      case ScreenSize.mobile:
        return 12.0;
      case ScreenSize.tabletPortrait:
        return 18.0;
      case ScreenSize.tabletLandscape:
        return 24.0;
      case ScreenSize.desktop:
        return 32.0;
    }
  }

  static int columnsForWeatherCards(BuildContext ctx) {
    switch (getSize(ctx)) {
      case ScreenSize.mobile:
        return 1;
      case ScreenSize.tabletPortrait:
        return 2;
      case ScreenSize.tabletLandscape:
        return 3;
      case ScreenSize.desktop:
        return 4;
    }
  }
}
