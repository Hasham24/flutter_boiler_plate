import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  // White related
  static const Color white = Color(0xFFFFFFFF);
  // If you need the semi-transparent variant from JS:
  static const Color white10 = Color.fromRGBO(255, 255, 255, 0.1);
  static const Color white50 = Color.fromRGBO(255, 255, 255, 0.5);
  static const Color white90 = Color.fromRGBO(255, 255, 255, 0.9);

  // Core dark/neutral
  static const Color black = Color(0xFF202020);
  static const Color black8 = Color.fromRGBO(32, 32, 32, 0.08);
  static const Color black10 = Color.fromRGBO(32, 32, 32, 0.10);
  static const Color black15 = Color.fromRGBO(32, 32, 32, 0.15);
  static const Color black20 = Color.fromRGBO(32, 32, 32, 0.2);
  static const Color black50 = Color.fromRGBO(32, 32, 32, 0.50);
  static const Color black60 = Color.fromRGBO(32, 32, 32, 0.60);
  static const Color black80 = Color.fromRGBO(32, 32, 32, 0.80);

  // Transparent
  static const Color transparent = Color(0x00000000);
}
