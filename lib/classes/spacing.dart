import 'package:flutter/material.dart';

class Spacing {
  SizedBox get h4 => const SizedBox(height: 4);
  SizedBox get h8 => const SizedBox(height: 8);
  SizedBox get h12 => const SizedBox(height: 12);
  SizedBox get h16 => const SizedBox(height: 16);
  SizedBox get h20 => const SizedBox(height: 20);
  SizedBox get h24 => const SizedBox(height: 24);
  SizedBox get h28 => const SizedBox(height: 28);
  SizedBox get h32 => const SizedBox(height: 32);
  SizedBox get h36 => const SizedBox(height: 36);

  SizedBox get w4 => const SizedBox(width: 4);
  SizedBox get w8 => const SizedBox(width: 8);
  SizedBox get w12 => const SizedBox(width: 12);
  SizedBox get w16 => const SizedBox(width: 16);
  SizedBox get w20 => const SizedBox(width: 20);
  SizedBox get w24 => const SizedBox(width: 24);
  SizedBox get w28 => const SizedBox(width: 28);
  SizedBox get w32 => const SizedBox(width: 32);
  SizedBox get w36 => const SizedBox(width: 36);

  SizedBox h(double height) => SizedBox(height: height);
  SizedBox w(double width) => SizedBox(width: width);
}
