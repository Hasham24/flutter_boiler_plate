import 'package:boiler_plate/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

/// Utility class for common text styles in the app.
class TextStyleUtil {
  // Font families
  static const String _font = 'Urbanist';

  // Font sizes
  static final double _fs12 = 12.0.sp;
  static final double _fs13 = 13.0.sp;
  static final double _fs14 = 14.0.sp;
  static final double _fs15 = 15.0.sp;
  static final double _fs16 = 16.0.sp;
  static final double _fs18 = 18.0.sp;
  static final double _fs20 = 20.0.sp;
  static final double _fs22 = 22.0.sp;
  static final double _fs24 = 24.0.sp;
  static final double _fs26 = 26.0.sp;
  static final double _fs28 = 28.0.sp;
  static final double _fs30 = 30.0.sp;
  static final double _fs34 = 34.0.sp;
  static final double _fs42 = 42.0.sp;

  /// ===== REGULAR (w400) =====
  static TextStyle get regular12 => _baseStyle(_fs12, FontWeight.w400);
  static TextStyle get regular13 => _baseStyle(_fs13, FontWeight.w400);
  static TextStyle get regular14 => _baseStyle(_fs14, FontWeight.w400);
  static TextStyle get regular15 => _baseStyle(_fs15, FontWeight.w400);
  static TextStyle get regular16 => _baseStyle(_fs16, FontWeight.w400);
  static TextStyle get regular18 => _baseStyle(_fs18, FontWeight.w400);
  static TextStyle get regular20 => _baseStyle(_fs20, FontWeight.w400);

  /// ===== MEDIUM (w500) =====
  static TextStyle get medium12 => _baseStyle(_fs12, FontWeight.w500);
  static TextStyle get medium13 => _baseStyle(_fs13, FontWeight.w500);
  static TextStyle get medium14 => _baseStyle(_fs14, FontWeight.w500);
  static TextStyle get medium15 => _baseStyle(_fs15, FontWeight.w500);
  static TextStyle get medium16 => _baseStyle(_fs16, FontWeight.w500);
  static TextStyle get medium18 => _baseStyle(_fs18, FontWeight.w500);

  /// ===== SEMI-BOLD (w600) =====
  static TextStyle get semiBold12 => _baseStyle(_fs12, FontWeight.w600);
  static TextStyle get semiBold14 => _baseStyle(_fs14, FontWeight.w600);
  static TextStyle get semiBold15 => _baseStyle(_fs15, FontWeight.w600);
  static TextStyle get semiBold16 => _baseStyle(_fs16, FontWeight.w600);
  static TextStyle get semiBold18 => _baseStyle(_fs18, FontWeight.w600);
  static TextStyle get semiBold20 => _baseStyle(_fs20, FontWeight.w600);
  static TextStyle get semiBold22 => _baseStyle(_fs22, FontWeight.w500);
  static TextStyle get semiBold24 => _baseStyle(_fs24, FontWeight.w500);
  static TextStyle get semiBold28 => _baseStyle(_fs28, FontWeight.w600);
  static TextStyle get semiBold30 => _baseStyle(_fs30, FontWeight.w600);
  static TextStyle get semiBold34 => _baseStyle(_fs34, FontWeight.w600);

  /// ===== BOLD (w700) =====
  static TextStyle get bold12 => _baseStyle(_fs12, FontWeight.w700);
  static TextStyle get bold14 => _baseStyle(_fs14, FontWeight.w700);
  static TextStyle get bold16 => _baseStyle(_fs16, FontWeight.w700);
  static TextStyle get bold18 => _baseStyle(_fs18, FontWeight.w700);
  static TextStyle get bold20 => _baseStyle(_fs20, FontWeight.w700);
  static TextStyle get bold22 => _baseStyle(_fs22, FontWeight.w700);
  static TextStyle get bold24 => _baseStyle(_fs24, FontWeight.w700);
  static TextStyle get bold26 => _baseStyle(_fs26, FontWeight.w700);
  static TextStyle get bold30 => _baseStyle(_fs30, FontWeight.w700);
  static TextStyle get bold34 => _baseStyle(_fs34, FontWeight.w700);
  static TextStyle get bold42 => _baseStyle(_fs42, FontWeight.w700);

  /// ===== EXTRA-BOLD (w800) =====
  static TextStyle get extraBold12 => _baseStyle(_fs12, FontWeight.w800);
  static TextStyle get extraBold14 => _baseStyle(_fs14, FontWeight.w800);
  static TextStyle get extraBold16 => _baseStyle(_fs16, FontWeight.w800);
  static TextStyle get extraBold18 => _baseStyle(_fs18, FontWeight.w800);

  /// Base style generator
  static TextStyle _baseStyle(double fontSize, FontWeight weight) {
    return TextStyle(
      fontFamily: _font,
      fontSize: fontSize,
      fontWeight: weight,
      color: AppColors.black,
    );
  }

  /// Utility method for customization
  static TextStyle custom({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    String? fontFamily,
    TextDecoration? decoration,
    double? height,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize ?? _fs14,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      decoration: decoration,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
