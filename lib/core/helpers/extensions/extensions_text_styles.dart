import 'package:flutter/material.dart';
import '../../theming/app_text_styles.dart';

extension AppTextStyleExtension on BuildContext {
  AppTextPalette get textStyles {
    final brightness = Theme.of(this).brightness;

    // تحديد ألوان افتراضية
    final primary = Theme.of(this).colorScheme.onSurface;
    final secondary = Theme.of(this).colorScheme.onSurface.withOpacity(0.6);

    return brightness == Brightness.dark
        ? AppTextStyles.dark(primary: primary, secondary: secondary)
        : AppTextStyles.light(primary: primary, secondary: secondary);
  }
}
