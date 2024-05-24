import 'package:flutter/material.dart';

class LibColors {
  static const Color green = Color(0xFF77D173);
  static const Color mainRed = Color(0xFFFF593E);
  static const Color secondaryRed = Color(0xFFAF2500);
  static const Color greyish = Color(0xFF9C9C9D);
  static const Color blue = Color(0xFF0075FF);
  static const Color amber = Color(0xFFFFC107);
  static const Color ashGrey = Color(0xFFB4B4B4);

  static const LinearGradient mainGradient = LinearGradient(
    colors: [Color(0xFF76D073), Color(0xFF045A1F)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const secGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff378834),
      Color(0xff05250D),
    ],
    stops: [0.29, 1.0],
  );

  static const negGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      mainRed,
      secondaryRed,
    ],
    stops: [0.29, 1.0],
  );
}
