// app_theme.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

class AppTheme {
  static const String _fontFamily = "Inter";

  static TextTheme _textTheme({bool isArabic = false}) => TextTheme(
    headlineLarge: AppTextStyle.headline28(isArabic: isArabic),
    headlineMedium: AppTextStyle.headline24Bold(isArabic: isArabic),
    headlineSmall: AppTextStyle.headline24Mid(isArabic: isArabic),
    titleLarge: AppTextStyle.titleLarge(isArabic: isArabic),
    titleMedium: AppTextStyle.titleMedium(isArabic: isArabic),
    titleSmall: AppTextStyle.titleSmall(isArabic: isArabic),
    bodyLarge: AppTextStyle.bodyLarge(isArabic: isArabic),
    bodyMedium: AppTextStyle.bodyMedium(isArabic: isArabic),
    bodySmall: AppTextStyle.bodySmall(isArabic: isArabic),
    labelLarge: AppTextStyle.labelLarge(isArabic: isArabic),
    labelMedium: AppTextStyle.labelMedium(isArabic: isArabic),
    labelSmall: AppTextStyle.labelSmall(isArabic: isArabic),
  );

  // ========== Light Theme ==========
  static ThemeData _lightTheme({bool isArabic = false}) {
    final textTheme = _textTheme(isArabic: isArabic);
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColorLight,
      scaffoldBackgroundColor: AppColors.primaryColorLight,
      fontFamily: isArabic ? null : _fontFamily,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColorLight,
        onPrimary: AppColors.onPrimaryColorLight,
        secondary: AppColors.secondaryColorLight,
        onSecondary: AppColors.onSecondaryColorLight,
        error: Colors.red,
        onError: Colors.white,
        surface: AppColors.primaryColorLight,
        onSurface: AppColors.onPrimaryColorLight,
        outline: AppColors.strokeLight,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColorLight,
        foregroundColor: AppColors.onPrimaryColorLight,
        elevation: 0,
        centerTitle: true,
      ),
      // ===== FilledButton =====
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primaryColorLight,
          foregroundColor: AppColors.onPrimaryColorLight,
          textStyle: AppTextStyle.titleMedium(isArabic: isArabic),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      //===== Icon Button =====
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.primaryColorLight,
          foregroundColor: AppColors.onPrimaryColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      // ===== OutlinedButton (Stroked) =====
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryColorLight,
          side: const BorderSide(
            color: AppColors.primaryColorLight,
            width: 1.5,
          ),
          textStyle: AppTextStyle.labelLarge(isArabic: isArabic),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      // ===== TextField =====
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primaryColorLight,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        labelStyle: AppTextStyle.bodyMedium(
          isArabic: isArabic,
        ).copyWith(color: Colors.grey),
        hintStyle: AppTextStyle.bodyMedium(
          isArabic: isArabic,
        ).copyWith(color: Colors.grey),
        errorStyle: AppTextStyle.bodySmall(
          isArabic: isArabic,
        ).copyWith(color: Colors.red),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  // ========== Dark Theme ==========
  static ThemeData _darkTheme({bool isArabic = false}) {
    final textTheme = _textTheme(isArabic: isArabic);
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryColorDark,
      scaffoldBackgroundColor: AppColors.primaryColorDark,
      fontFamily: isArabic ? null : _fontFamily,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryColorDark,
        onPrimary: AppColors.onPrimaryColorDark,
        secondary: AppColors.secondaryColorDark,
        onSecondary: AppColors.onSecondaryColorDark,
        error: Colors.red,
        onError: Colors.white,
        surface: AppColors.primaryColorDark,
        onSurface: AppColors.onPrimaryColorDark,
        outline: AppColors.strokeDark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColorDark,
        foregroundColor: AppColors.onPrimaryColorDark,
        elevation: 0,
        centerTitle: true,
      ),
      // ===== FilledButton (Dark) =====
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primaryColorDark,
          foregroundColor: AppColors.onPrimaryColorDark,
          textStyle: AppTextStyle.titleMedium(isArabic: isArabic),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      //====icon Button====
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primaryColorDark,
          foregroundColor: AppColors.onPrimaryColorDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      // ===== OutlinedButton (Dark) =====
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryColorDark,
          side: const BorderSide(color: AppColors.primaryColorDark, width: 1.5),
          textStyle: AppTextStyle.labelLarge(isArabic: isArabic),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      // ===== TextField (Dark) =====
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primaryColorDark,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        labelStyle: AppTextStyle.bodyMedium(
          isArabic: isArabic,
        ).copyWith(color: Colors.grey),
        hintStyle: AppTextStyle.bodyMedium(
          isArabic: isArabic,
        ).copyWith(color: Colors.grey),
        errorStyle: AppTextStyle.bodySmall(
          isArabic: isArabic,
        ).copyWith(color: Colors.red),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  // ===== Public getters =====
  // بيستخدموا فعليًا في MaterialApp بناءً على اللغة الحالية
  static ThemeData lightTheme({bool isArabic = false}) =>
      _lightTheme(isArabic: isArabic);

  static ThemeData darkTheme({bool isArabic = false}) =>
      _darkTheme(isArabic: isArabic);

  static ThemeData getThemeByBrightness(
    Brightness brightness, {
    bool isArabic = false,
  }) {
    return brightness == Brightness.light
        ? lightTheme(isArabic: isArabic)
        : darkTheme(isArabic: isArabic);
  }
}
