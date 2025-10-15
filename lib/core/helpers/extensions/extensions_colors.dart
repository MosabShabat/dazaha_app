import 'package:flutter/material.dart';
import '../../theming/app_colors.dart';

extension AppColorExtension on BuildContext {
  TokenPalette get colorsCustom {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark ? AppColors.dark : AppColors.light;
  }
}
