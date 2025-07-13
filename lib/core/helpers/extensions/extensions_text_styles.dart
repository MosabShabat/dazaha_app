import 'package:flutter/material.dart';

import '../../theming/app_text_styles.dart';



extension AppTextStyleExtension on BuildContext {
  AppTextPalette get textStyles {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark
        ? AppTextStyles.dark
        : AppTextStyles.light;
  }
} 


