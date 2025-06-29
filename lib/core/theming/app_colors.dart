import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  // Main color palette
  static final Color darkPurple = Color.fromARGB(255, 98, 63, 181);
  static final Color darkPurple2 = Color.fromARGB(255, 82, 41, 177);
  static final Color lightPurple = Color.fromARGB(255, 242, 233, 255);
  static final Color lightPurple2 = Color.fromARGB(255, 244, 239, 252);
  static final Color lightGrey = Color.fromARGB(255, 249, 250, 251);
  static final Color darkGray = Color.fromARGB(255, 102, 102, 102);
  static final Color grey = Color.fromARGB(255, 217, 217, 217);
  static final Color white = Colors.white;
  static final Color black = Colors.black;
  static final Color red = Colors.red;
  static final Color green = Colors.green;
  static final Color yellow = Colors.amber;
  static final Color lightYellow = const Color.fromARGB(255, 255, 243, 206);

  // Mapped theme colors (for backward compatibility)
  static final Color primary = darkPurple;
  static final Color primaryLight = lightPurple;
  static final Color secondary = darkPurple2;
  static final Color background = white;
  static final Color appBarBackground = white;
  static final Color border = grey;
  static final Color fieldBorder = lightGrey;
  static final Color shadow = black.withValues(alpha: 0.16);
  static final Color hint = darkGray;
  static final Color fillColor = white;

  static ColorFilter colorFilter(Color color) =>
      ColorFilter.mode(color, BlendMode.srcIn);
}
