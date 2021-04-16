import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';
import 'scenery_theme.dart';

/// You can add themes for your own custom widgets here.
/// NB: for this challenge, it is only required to modify sceneryThemeData
class CustomWidgetThemes {
  static CustomWidgetThemes of(BuildContext context) => CustomWidgetThemes._(context);

  SceneryThemeData? sceneryThemeData;

  // todo(you) These colors are dreary! Modify this so the picture has different values for light and dark modes.
  //  If you are feeling ambitions, get creative and make a third theme (or a fourth!)
  CustomWidgetThemes._(BuildContext context) {
    final themeType = Provider.of<MyTheme>(context).themeType;

    switch (themeType) {
      case ThemeType.Light:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: getColorFromHex("#FFD454"),
          mountainFillColor: getColorFromHex("#ed9154"),
          waterFillColor:  getColorFromHex("#57c9e4"),
          drawMoon: false,
          drawSun: true,
        );
        break;
      case ThemeType.Dark:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Colors.grey,
          mountainFillColor: Colors.blueGrey,
          waterFillColor: Colors.blueGrey[800]!,
          drawMoon: true,
          drawSun: false,
        );
        break;
      case ThemeType.Other:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: getColorFromHex("#ee756d"),
          mountainFillColor: getColorFromHex("#623957"),
          waterFillColor: getColorFromHex("#49101f"),
          drawMoon: true,
          drawSun: true,
        );
        break;
    }
  }
}

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
  return Colors.white;
}