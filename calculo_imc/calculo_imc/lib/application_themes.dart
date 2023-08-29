import 'package:flutter/material.dart';

abstract class ApplicationTheme {
  get primaryColor {}

  get secondaryColor {}

  get backgroundColor {}

  get textColor {}

  get appBarTextColor {}
}

class LightTheme extends ApplicationTheme {
  LightTheme();

  final Map<String, Color> _colors = {
    "backgroundColor": const Color.fromRGBO(255, 255, 255, 1),
    "primaryColor": const Color.fromRGBO(200, 200, 255, 1),
    "secondaryColor": const Color.fromRGBO(78, 78, 255, 1),
    "textColor": const Color.fromARGB(255, 0, 0, 0),
    "appBarTextColor": const Color.fromARGB(255, 0, 0, 0),
  };

  @override
  get primaryColor {
    return _colors["primaryColor"];
  }

  @override
  get secondaryColor {
    return _colors["secondaryColor"];
  }

  @override
  get backgroundColor {
    return _colors["backgroundColor"];
  }

  @override
  get textColor {
    return _colors["textColor"];
  }

  @override
  get appBarTextColor {
    return _colors["appBarTextColor"];
  }
}

class DarkTheme extends ApplicationTheme {
  DarkTheme();

  final Map<String, Color> _colors = {
    "backgroundColor": const Color.fromRGBO(0, 0, 0, 1),
    "primaryColor": const Color.fromARGB(255, 255, 115, 0),
    "secondaryColor": const Color.fromRGBO(0, 200, 255, 1),
    "textColor": const Color.fromRGBO(255, 255, 255, 1),
    "appBarTextColor": const Color.fromARGB(255, 255, 255, 255),
  };

  @override
  get primaryColor {
    return _colors["primaryColor"];
  }

  @override
  get secondaryColor {
    return _colors["secondaryColor"];
  }

  @override
  get backgroundColor {
    return _colors["backgroundColor"];
  }

  @override
  get textColor {
    return _colors["textColor"];
  }

  @override
  get appBarTextColor {
    return _colors["appBarTextColor"];
  }
}
