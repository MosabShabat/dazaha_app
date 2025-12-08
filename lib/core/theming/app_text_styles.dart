import '../../../../core/constant/exports_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  // Helper function
  static TextStyle _style(
    double fontSize, {
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    String fontFamily = 'Tajawal',
    double? height,
  }) => TextStyle(
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: color,
    fontFamily: fontFamily,
    height: height,
  );

  // Static styles using context colors
  static TextStyle font10Grey400Regular(BuildContext context) => _style(
    10,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
  );

  static TextStyle font11White500Medium(BuildContext context) =>
      _style(11, fontWeight: FontWeight.w500, color: Colors.white);

  static TextStyle font11Black500Medium(BuildContext context) => _style(
    11,
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle font12Grey400Regular(BuildContext context) => _style(
    12,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
  );

  static TextStyle font18Black700Bold(BuildContext context) => _style(
    18,
    fontWeight: FontWeight.w700,
    color: context.colorsCustom.TextPrimary,
  );

  static TextStyle font12Black400Regular(BuildContext context) => _style(
    12,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle font12Black500Medium(BuildContext context) => _style(
    12,
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle font13Primary400Regular(BuildContext context, Color color) =>
      _style(13, fontWeight: FontWeight.w400, color: color);

  static TextStyle font13Black400Regular(BuildContext context) => _style(
    13,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle font14Black400Regular(BuildContext context) => _style(
    14,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle font14Black500Medium(BuildContext context) => _style(
    14,
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle font14White500Medium(BuildContext context, h) => _style(
    14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    height: h ?? 1.7.h,
  );

  static TextStyle font14Grey500Medium(BuildContext context) => _style(
    14,
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
  );

  static TextStyle font14Primary500Medium(
    BuildContext context, {
    Color? color,
  }) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: color ?? context.colorsCustom.surfacePrimaryWhite,
    fontFamily: 'Tajawal',
  );
  static TextStyle font14OrderNumberColor400Regular(BuildContext context) =>
      _style(
        14,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
      );

  static TextStyle font14Black700Bold(BuildContext context) => _style(
    16,
    fontWeight: FontWeight.w700,
    color: Theme.of(context).colorScheme.onSurface,
  );
  static TextStyle font16Black500Medium(BuildContext context) => _style(
    16,
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle font16White500Medium(BuildContext context) =>
      _style(16, fontWeight: FontWeight.w500, color: Colors.white);

  static TextStyle font16Black700Bold(BuildContext context) => _style(
    14,
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle font22Black700Bold(BuildContext context) => _style(
    22,
    fontWeight: FontWeight.w700,
    color: Theme.of(context).colorScheme.onSurface,
  );

  // Palette-based styles for light/dark themes
  static AppTextPalette light({
    required Color primary,
    required Color secondary,
  }) => AppTextPalette(
    defaultTextColor: primary,
    displayLarge: _style(57, fontWeight: FontWeight.w400, color: primary),
    displayMedium: _style(45, fontWeight: FontWeight.w400, color: primary),
    displaySmall: _style(36, fontWeight: FontWeight.w400, color: primary),
    headlineLarge: _style(32, fontWeight: FontWeight.w400, color: primary),
    headlineMedium: _style(28, fontWeight: FontWeight.w400, color: primary),
    headlineSmall: _style(24, fontWeight: FontWeight.w400, color: primary),
    titleLarge: _style(22, fontWeight: FontWeight.w700, color: primary),
    titleMedium: _style(16, fontWeight: FontWeight.w500, color: primary),
    titleSmall: _style(14, fontWeight: FontWeight.w500, color: primary),
    bodyLarge: _style(16, fontWeight: FontWeight.w400, color: primary),
    bodyMedium: _style(14, fontWeight: FontWeight.w400, color: primary),
    bodySmall: _style(12, fontWeight: FontWeight.w400, color: secondary),
    labelLarge: _style(14, fontWeight: FontWeight.w500, color: primary),
    labelMedium: _style(12, fontWeight: FontWeight.w500, color: secondary),
    labelSmall: _style(
      11,
      fontWeight: FontWeight.w400,
      color: secondary.withOpacity(0.6),
    ),
    inputLabel: _style(
      14,
      fontWeight: FontWeight.w700,
      color: primary,
      fontFamily: 'Tajawal',
    ),
  );

  static AppTextPalette dark({
    required Color primary,
    required Color secondary,
  }) => AppTextPalette(
    defaultTextColor: primary,
    displayLarge: _style(57, fontWeight: FontWeight.w400, color: primary),
    displayMedium: _style(45, fontWeight: FontWeight.w400, color: primary),
    displaySmall: _style(36, fontWeight: FontWeight.w400, color: primary),
    headlineLarge: _style(32, fontWeight: FontWeight.w400, color: primary),
    headlineMedium: _style(28, fontWeight: FontWeight.w400, color: primary),
    headlineSmall: _style(24, fontWeight: FontWeight.w400, color: primary),
    titleLarge: _style(22, fontWeight: FontWeight.w700, color: primary),
    titleMedium: _style(16, fontWeight: FontWeight.w500, color: primary),
    titleSmall: _style(14, fontWeight: FontWeight.w500, color: primary),
    bodyLarge: _style(16, fontWeight: FontWeight.w400, color: secondary),
    bodyMedium: _style(14, fontWeight: FontWeight.w400, color: secondary),
    bodySmall: _style(
      12,
      fontWeight: FontWeight.w400,
      color: secondary.withOpacity(0.6),
    ),
    labelLarge: _style(14, fontWeight: FontWeight.w500, color: secondary),
    labelMedium: _style(
      12,
      fontWeight: FontWeight.w500,
      color: secondary.withOpacity(0.6),
    ),
    labelSmall: _style(
      11,
      fontWeight: FontWeight.w400,
      color: secondary.withOpacity(0.4),
    ),
    inputLabel: _style(14, fontWeight: FontWeight.w400, color: primary),
  );
}

class AppTextPalette {
  final Color defaultTextColor;
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;
  final TextStyle inputLabel;

  const AppTextPalette({
    required this.defaultTextColor,
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.inputLabel,
  });
}
