import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
        brightness: Brightness.light,
        textTheme: const TextTheme(
            bodySmall: AppTextStyles.bodySmall,
            bodyMedium: AppTextStyles.bodyMedium,
            bodyLarge: AppTextStyles.bodyLarge,
            headlineSmall: AppTextStyles.headlineSmall,
            headlineMedium: AppTextStyles.headlineMedium,
            headlineLarge: AppTextStyles.headlineLarge),
        colorScheme: const ColorScheme(
            primary: AppColors.primaryColor,
            onPrimary: AppColors.backgroundColor,
            secondary: AppColors.secondaryColor,
            onSecondary: AppColors.backgroundColor,
            error: AppColors.errorColor,
            onError: AppColors.surfaceColor,
            surface: AppColors.backgroundColor,
            onSurface: AppColors.textColor,
            brightness: Brightness.light),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.backgroundColor,
                elevation: 0,
                disabledBackgroundColor: AppColors.primaryColor.withOpacity(0.3),
                textStyle: AppTextStyles.button)));
  }
}