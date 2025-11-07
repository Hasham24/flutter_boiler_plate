import 'package:flutter/material.dart';

class AppColors {
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

  // Primary and accents
  static const Color primary = Color(0xFFFF001F);
  static const Color primary70 = Color.fromRGBO(255, 0, 31, 0.7);
  static const Color green = Color(0xFF00B25B);

  // Light gray tones and others from JS
  static const Color lightGray = Color(0xFFE9E9E9);
  static const Color lightGray3 = Color(0xFFEEEEEE);
  static const Color mercury = Color(0xFFE2E2E2);
  static const Color gray = Color(0xFFB5B5B5);
  static const Color blackSqueeze = Color(0xFFF7FBFC);
  static const Color doveGray = Color(0x77707070);
  static const Color boulder = Color(0x77757575);
  static const Color blueChill = Color(0xFF148F96);
  static const Color wildSand = Color(0xFFF5F5F5);
  static const Color cultured = Color(0xFFF4F4F4);
  static const Color alto = Color(0xFFDBDBDB);
  static const Color catskillWhite = Color(0xFFEBF6F6);
  // rgba(20,143,150,0.08)
  static const Color blueChill8 = Color.fromRGBO(20, 143, 150, 0.08);
  static const Color gamboge = Color(0xFFDFA20C);
  static const Color gallery = Color(0xFFEDEDED);
  static const Color snow = Color(0xFFFBFAFA);
  static const Color chinesSilver = Color(0xFFCCCCCC);

  static const Color chatBubbleUser = Color.fromRGBO(20, 143, 150, 0.10);
  // If you previously had a singleton pattern, you can keep or drop it.
  // Example singleton (optional):
  static final AppColors instance = AppColors._();
  AppColors._();
}
