// // ignore_for_file: deprecated_member_use
// import 'package:flutter/material.dart';
// import 'app_colors.dart';

// final lightTheme = ThemeData(
//   brightness: Brightness.light,
//   useMaterial3: true,
//   fontFamily: 'Tajawal',
//   colorScheme: ColorScheme.fromSeed(
//     seedColor: AppColors.light.primary,
//     brightness: Brightness.light,
//   ),
//   textSelectionTheme: TextSelectionThemeData(
//     selectionColor: AppColors.light.primary.withOpacity(0.3),
//     selectionHandleColor: AppColors.light.primary,
//   ),
// );

// final darkTheme = ThemeData(
//   brightness: Brightness.dark,
//   useMaterial3: true,
//   fontFamily: 'Tajawal',
//   colorScheme: ColorScheme.fromSeed(
//     seedColor: AppColors.dark.primary,
//     brightness: Brightness.dark,
//   ),
//   textSelectionTheme: TextSelectionThemeData(
//     selectionColor: AppColors.dark.primary.withOpacity(0.3),
//     selectionHandleColor: AppColors.dark.primary,
//   ),
// );

// ignore_for_file: deprecated_member_use

import 'package:dazaha_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
// import 'app_colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  fontFamily: 'sans',
  // scaffoldBackgroundColor: AppColors.light.surfacePrimaryWhite,
  primaryColor: AppColors.light.TealGreenSecondary,
  textTheme: const TextTheme(), // عدل لاحقاً حسب الحاجة
  // colorScheme: ColorScheme(
  //   brightness: Brightness.light,
  //   primary: AppColors.light.TealGreenSecondary,
  //   onPrimary: AppColors.light.TextPrimary,
  //   secondary: AppColors.light.TextSecondary,
  // onSecondary: AppColors.light.buttonText,
  // error: AppColors.light.textError,
  // onError: AppColors.light.textColor,
  // background: AppColors.light.surfaceBg,
  // onBackground: AppColors.light.textDark,
  // surface: AppColors.light.surfaceBg,
  // onSurface: AppColors.light.textDark,
  // ),
  textSelectionTheme: TextSelectionThemeData(
    // selectionColor: AppColors.light.buttonPrimary.withOpacity(0.3),
    // selectionHandleColor: AppColors.light.buttonPrimary,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  fontFamily: 'sans',
  // scaffoldBackgroundColor: AppColors.dark.surfacePrimaryBlack,
  // primaryColor: AppColors.dark.buttonPrimary,
  textTheme: const TextTheme(),
  // colorScheme: ColorScheme(
  //   brightness: Brightness.dark,
  //   primary: AppColors.dark.buttonPrimary,
  //   onPrimary: AppColors.dark.buttonText,
  //   secondary: AppColors.dark.buttonPrimary2,
  //   onSecondary: AppColors.dark.buttonText,
  //   error: AppColors.dark.textError,
  //   onError: AppColors.dark.textColor,
  //   background: AppColors.dark.surfaceBg,
  //   onBackground: AppColors.dark.textColor,
  //   surface: AppColors.dark.surfaceBg,
  //   onSurface: AppColors.dark.textColor,
  // ),
  textSelectionTheme: TextSelectionThemeData(
    // selectionColor: AppColors.dark.buttonPrimary.withOpacity(0.3),
    // selectionHandleColor: AppColors.dark.buttonPrimary,
  ),
);
