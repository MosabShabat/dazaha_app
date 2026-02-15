

import '../../../core/theming/app_colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  fontFamily: 'Tajawal',
  scaffoldBackgroundColor: AppColors.light.surfacePrimaryWhite,
  primaryColor: AppColors.light.TealGreenSecondary,
  textTheme: const TextTheme(), // عدل لاحقاً حسب الحاجة
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.light.TealGreenSecondary,
    onPrimary: AppColors.light.TextPrimary,
    secondary: AppColors.light.TextSecondary,
    onSecondary: AppColors.light.SecondaryElement,
    error: AppColors.light.redColor,
    onError: AppColors.light.redColor,
    surface: AppColors.light.surfacePrimaryWhite,
    onSurface: AppColors.light.surfacePrimaryBlack,
  ),
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: AppColors.light.TealGreenSecondary.withOpacity(0.3),
    selectionHandleColor: AppColors.light.TealGreenSecondary,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  fontFamily: 'Tajawal',
  scaffoldBackgroundColor: AppColors.dark.surfacePrimaryBlack,
  primaryColor: AppColors.dark.TealGreenSecondary,
  textTheme: const TextTheme(),
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.dark.TextPrimary,
    onPrimary: AppColors.dark.TextPrimary,
    secondary: AppColors.dark.TextSecondary,
    onSecondary: AppColors.dark.SecondaryElement,
    error: AppColors.dark.redColor,
    onError: AppColors.dark.redColor,
    surface: AppColors.dark.surfacePrimaryBlack,
    onSurface: AppColors.dark.TextPrimary,
  ),
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: AppColors.dark.TealGreenSecondary.withOpacity(0.3),
    selectionHandleColor: AppColors.dark.TealGreenSecondary,
  ),
);
