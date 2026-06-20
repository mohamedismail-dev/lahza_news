import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  AppTextStyle._();

  static String _fontFamilyEn = 'Inter';

  // كاش لخط Cairo حتى لا يُعاد تحميله من جوجل فونتس مع كل نداء
  static TextStyle get _cairoBase => GoogleFonts.cairo();

  /// يرجع TextStyle مناسب حسب اللغة:
  /// - عربي: خط Cairo
  /// - غير عربي: خط Inter (الموجود في pubspec كالسابق)
  static TextStyle _base({
    required bool isArabic,
    required double fontSize,
    required double height,
    required FontWeight fontWeight,
    double? letterSpacing,
  }) {
    if (isArabic) {
      return _cairoBase.copyWith(
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );
    }
    return TextStyle(
      fontFamily: _fontFamilyEn,
      fontSize: fontSize,
      height: height,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }

  // ========== Headline ==========
  static TextStyle headline28({bool isArabic = false}) => _base(
    isArabic: isArabic,
    fontSize: 30,
    height: 1.25,
    fontWeight: FontWeight.w500,
  );

  static TextStyle headline24Bold({bool isArabic = false}) => _base(
    isArabic: isArabic,
    fontSize: 24,
    height: 1.29,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headline24Mid({bool isArabic = false}) => _base(
    isArabic: isArabic,
    fontSize: 24,
    height: 1.33,
    fontWeight: FontWeight.w400,
  );

  // ========== Title ==========
  static TextStyle titleLarge({bool isArabic = false}) => _base(
    isArabic: isArabic,
    fontSize: 24,
    height: 1.27,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleMedium({bool isArabic = false}) => _base(
    isArabic: isArabic,
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleSmall({bool isArabic = false}) => _base(
    isArabic: isArabic,
    fontSize: 16,
    height: 1.43,
    fontWeight: FontWeight.w500,
  );

  // ========== Body ==========
  static TextStyle bodyLarge({bool isArabic = false}) => _base(
    isArabic: isArabic,
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyMedium({bool isArabic = false}) => _base(
    isArabic: isArabic,
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodySmall({bool isArabic = false}) => _base(
    isArabic: isArabic,
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w400,
  );

  // ========== Label ==========
  static TextStyle labelLarge({bool isArabic = false}) => _base(
    isArabic: isArabic,
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static TextStyle labelMedium({bool isArabic = false}) => _base(
    isArabic: isArabic,
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w500,
  );

  static TextStyle labelSmall({bool isArabic = false}) => _base(
    isArabic: isArabic,
    fontSize: 11,
    height: 1.45,
    fontWeight: FontWeight.w500,
  );
}
