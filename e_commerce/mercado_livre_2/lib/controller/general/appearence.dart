import 'package:flutter/material.dart';

final class Appearence {
  static final Map<String, ApplicationTheme> _themes = {
    "pinkdark": PinkDarkTheme(),
    "pinklight": PinkLightTheme(),
    "bluedark": DarkBlueTheme(),
    "bluelight": LightBlueTheme(),
    "greendark": DarkGreenTheme(),
    "greenlight": LightGreenTheme(),
    "yellowdark": YellowDarkTheme(),
    "yellowlight": YellowLightTheme(),
  };

  static String theme = "yellow";
  static String _color = "pink";
  static ApplicationTheme activeTheme = YellowLightTheme();
  static const double buttonFontSize = 18;
  static const double floatingLabelFontSize = 18;
  static const double h3 = 12;

  static void setTheme(String theme) {
    activeTheme = _themes[_color + theme]!;
    Appearence.theme = theme;
  }

  static void setColor(String color) {
    activeTheme = _themes[color + theme]!;
    Appearence._color = color;
  }

  static getData(JuiceThemeData data) {
    return activeTheme.getData(data);
  }
}

abstract class ApplicationTheme {
  Color getData(JuiceThemeData data) {
    return Colors.black;
  }
}

class PinkLightTheme extends ApplicationTheme {
  PinkLightTheme();

  static const Map<JuiceThemeData, Color> _colors = {
    JuiceThemeData.backgroundColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.primaryColor: Color.fromRGBO(255, 0, 98, 1),
    JuiceThemeData.secondaryColor: Color.fromRGBO(184, 0, 113, 1),
    JuiceThemeData.terciaryColor: Color.fromRGBO(255, 50, 190, 1),
    JuiceThemeData.textColor: Color.fromRGBO(0, 0, 0, 1),
    JuiceThemeData.appBarTextColor: Color.fromRGBO(0, 0, 0, 1),
    JuiceThemeData.borderColor: Color.fromRGBO(0, 0, 0, 1),
    JuiceThemeData.cardBackgroundColor: Color.fromRGBO(210, 210, 210, 1),
  };

  @override
  Color getData(JuiceThemeData data) {
    return PinkLightTheme._colors[data]!;
  }
}

class YellowDarkTheme extends ApplicationTheme {
  YellowDarkTheme();

  static const Map<JuiceThemeData, Color> _colors = {
    JuiceThemeData.backgroundColor: Color.fromRGBO(0, 0, 0, 1),
    JuiceThemeData.primaryColor: Color.fromRGBO(255, 217, 0, 1),
    JuiceThemeData.secondaryColor: Color.fromRGBO(255, 252, 158, 1),
    JuiceThemeData.terciaryColor: Color.fromRGBO(255, 221, 174, 1),
    JuiceThemeData.textColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.appBarTextColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.borderColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.cardBackgroundColor: Color.fromRGBO(33, 33, 33, 1),
  };

  @override
  Color getData(JuiceThemeData data) {
    return YellowDarkTheme._colors[data]!;
  }
}

class YellowLightTheme extends ApplicationTheme {
  YellowLightTheme();

  static const Map<JuiceThemeData, Color> _colors = {
    JuiceThemeData.backgroundColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.primaryColor: Color.fromRGBO(255, 217, 0, 1),
    JuiceThemeData.secondaryColor: Color.fromRGBO(233, 233, 233, 1),
    JuiceThemeData.terciaryColor: Color.fromRGBO(255, 221, 174, 1),
    JuiceThemeData.textColor: Color.fromRGBO(0, 14, 47, 1),
    JuiceThemeData.appBarTextColor: Color.fromRGBO(0, 0, 0, 1),
    JuiceThemeData.borderColor: Color.fromRGBO(0, 0, 0, 1),
    JuiceThemeData.cardBackgroundColor: Color.fromRGBO(210, 210, 210, 1),
  };

  @override
  Color getData(JuiceThemeData data) {
    return YellowLightTheme._colors[data]!;
  }
}

class PinkDarkTheme extends ApplicationTheme {
  PinkDarkTheme();

  static const Map<JuiceThemeData, Color> _colors = {
    JuiceThemeData.backgroundColor: Color.fromRGBO(0, 0, 0, 1),
    JuiceThemeData.primaryColor: Color.fromRGBO(255, 0, 98, 1),
    JuiceThemeData.secondaryColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.terciaryColor: Color.fromRGBO(255, 100, 188, 1),
    JuiceThemeData.textColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.appBarTextColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.borderColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.cardBackgroundColor: Color.fromRGBO(33, 33, 33, 1),
  };

  @override
  Color getData(JuiceThemeData data) {
    return PinkDarkTheme._colors[data]!;
  }
}

class LightGreenTheme extends ApplicationTheme {
  LightGreenTheme();

  static const Map<JuiceThemeData, Color> _colors = {
    JuiceThemeData.backgroundColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.primaryColor: Color.fromRGBO(0, 255, 153, 1),
    JuiceThemeData.secondaryColor: Color.fromRGBO(0, 184, 144, 1),
    JuiceThemeData.terciaryColor: Color.fromRGBO(50, 255, 180, 1),
    JuiceThemeData.textColor: Color.fromRGBO(0, 0, 0, 1),
    JuiceThemeData.appBarTextColor: Color.fromRGBO(0, 0, 0, 1),
    JuiceThemeData.borderColor: Color.fromRGBO(0, 0, 0, 1),
    JuiceThemeData.cardBackgroundColor: Color.fromRGBO(210, 210, 210, 1),
  };

  @override
  Color getData(JuiceThemeData data) {
    return LightGreenTheme._colors[data]!;
  }
}

class DarkGreenTheme extends ApplicationTheme {
  DarkGreenTheme();

  static const Map<JuiceThemeData, Color> _colors = {
    JuiceThemeData.backgroundColor: Color.fromRGBO(0, 0, 0, 1),
    JuiceThemeData.primaryColor: Color.fromRGBO(0, 255, 123, 1),
    JuiceThemeData.secondaryColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.terciaryColor: Color.fromRGBO(100, 255, 154, 1),
    JuiceThemeData.textColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.appBarTextColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.borderColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.cardBackgroundColor: Color.fromRGBO(33, 33, 33, 1),
  };

  @override
  Color getData(JuiceThemeData data) {
    return DarkGreenTheme._colors[data]!;
  }
}

class LightBlueTheme extends ApplicationTheme {
  LightBlueTheme();

  static const Map<JuiceThemeData, Color> _colors = {
    JuiceThemeData.backgroundColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.primaryColor: Color.fromRGBO(0, 128, 255, 1),
    JuiceThemeData.secondaryColor: Color.fromRGBO(0, 48, 136, 1),
    JuiceThemeData.terciaryColor: Color.fromRGBO(107, 191, 255, 1),
    JuiceThemeData.textColor: Color.fromRGBO(0, 0, 0, 1),
    JuiceThemeData.appBarTextColor: Color.fromRGBO(0, 0, 0, 1),
    JuiceThemeData.borderColor: Color.fromRGBO(146, 244, 255, 1),
    JuiceThemeData.cardBackgroundColor: Color.fromRGBO(210, 210, 210, 1),
  };

  @override
  Color getData(JuiceThemeData data) {
    return LightBlueTheme._colors[data]!;
  }
}

class DarkBlueTheme extends ApplicationTheme {
  DarkBlueTheme();

  static const Map<JuiceThemeData, Color> _colors = {
    JuiceThemeData.backgroundColor: Color.fromRGBO(0, 0, 0, 1),
    JuiceThemeData.primaryColor: Color.fromRGBO(0, 128, 255, 1),
    JuiceThemeData.secondaryColor: Color.fromRGBO(0, 48, 136, 1),
    JuiceThemeData.terciaryColor: Color.fromRGBO(156, 202, 255, 1),
    JuiceThemeData.textColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.appBarTextColor: Color.fromRGBO(255, 255, 255, 1),
    JuiceThemeData.borderColor: Color.fromRGBO(146, 244, 255, 1),
    JuiceThemeData.cardBackgroundColor: Color.fromRGBO(36, 36, 36, 1),
  };

  @override
  Color getData(JuiceThemeData data) {
    return DarkBlueTheme._colors[data]!;
  }
}

enum JuiceThemeData {
  backgroundColor,
  primaryColor,
  secondaryColor,
  terciaryColor,
  textColor,
  appBarTextColor,
  borderColor,
  cardBackgroundColor,
}
