import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokemon/utils/const.dart';

enum BackgroundSpecies {
  black,
  blue,
  brown,
  gray,
  green,
  pink,
  purple,
  red,
  white,
  yellow
}

extension BackgroundSpeciesExt on BackgroundSpecies {
  Color get color {
    switch (this) {
      case BackgroundSpecies.black:
        return Color.fromARGB(255, 31, 30, 30);
      case BackgroundSpecies.blue:
        return Color.fromARGB(255, 55, 118, 170);
      case BackgroundSpecies.brown:
        return Color.fromARGB(255, 121, 81, 67);
      case BackgroundSpecies.gray:
        return Color.fromARGB(255, 145, 128, 128);
      case BackgroundSpecies.green:
        return Color.fromARGB(255, 51, 172, 55);
      case BackgroundSpecies.pink:
        return Color.fromARGB(255, 168, 23, 72);
      case BackgroundSpecies.purple:
        return Color.fromARGB(255, 112, 24, 128);
      case BackgroundSpecies.red:
        return Color.fromARGB(255, 146, 44, 37);
      case BackgroundSpecies.yellow:
        return Color.fromARGB(255, 150, 138, 36);
      default:
        return AppColors.primaryColor;
    }
  }
}
