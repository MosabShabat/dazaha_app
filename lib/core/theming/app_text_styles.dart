import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'app_colors.dart';

class AppTextStyles {
  static final light = AppTextPalette(
    defaultTextColor: AppColors.light.TextPrimary,
    displayLarge: _style(57.sp),
    displayMedium: _style(45.sp),
    displaySmall: _style(36.sp),

    headlineLarge: _style(32.sp),
    headlineMedium: _style(28.sp),
    headlineSmall: _style(24.sp),

    titleLarge: _style(22.sp),
    titleMedium: _style(16.sp),
    titleSmall: _style(14.sp),

    bodyLarge: _style(16.sp),
    bodyMedium: _style(14.sp),
    bodySmall: _style(12.sp, AppColors.light.TextSecondary),

    labelLarge: _style(14.sp),
    labelMedium: _style(12.sp, AppColors.light.TextSecondary),
    labelSmall: _style(11.sp, Colors.black45),

    inputLabel: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'sans_bold',
      color: AppColors.light.TextPrimary,
    ),
  );

  static final dark = AppTextPalette(
    defaultTextColor: AppColors.dark.TextPrimary,
    displayLarge: _style(57.sp, AppColors.dark.TextPrimary),
    displayMedium: _style(45.sp, AppColors.dark.TextPrimary),
    displaySmall: _style(36.sp, AppColors.dark.TextPrimary),

    headlineLarge: _style(32.sp, AppColors.dark.TextPrimary),
    headlineMedium: _style(28.sp, AppColors.dark.TextPrimary),
    headlineSmall: _style(24.sp, AppColors.dark.TextPrimary),

    titleLarge: _style(22.sp, AppColors.dark.TextPrimary),
    titleMedium: _style(16.sp, AppColors.dark.TextPrimary),
    titleSmall: _style(14.sp, AppColors.dark.TextPrimary),

    bodyLarge: _style(16.sp, AppColors.dark.surfacePrimaryWhite),
    bodyMedium: _style(14.sp, AppColors.dark.surfacePrimaryWhite),
    bodySmall: _style(12.sp, Colors.white60),

    labelLarge: _style(14.sp, AppColors.dark.surfacePrimaryWhite),
    labelMedium: _style(12.sp, Colors.white60),
    labelSmall: _style(11.sp, Colors.white38),

    inputLabel: TextStyle(
      fontSize: 14.sp,
      height: 22 / 14,
      fontWeight: FontWeight.w400,
      color: AppColors.dark.TextPrimary,
    ),
  );

  static TextStyle _style(double size, [Color? color]) =>
      TextStyle(fontSize: size.sp, color: color);
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
