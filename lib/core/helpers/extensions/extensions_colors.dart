import 'package:flutter/material.dart';
import '../../theming/app_colors.dart';


extension AppColorExtension on BuildContext {
  TokenPalette get colorsCustom {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark ? AppColors.dark : AppColors.light;
  }



  // LinearGradient get topGradient {
  //   final brightness = Theme.of(this).brightness;
  //   return brightness == Brightness.dark
  //       ? AppColors.darkTopBarGradient
  //       : AppColors.lightTopBarGradient;
  // }

}

extension WarningColorsExtension on BuildContext {
  WarningPaletteExtension get warning {
    return WarningPaletteExtension();
  }
}

class WarningPaletteExtension {
  Color get w100 => WarningPalette.warning100;
  Color get w200 => WarningPalette.warning200;
  Color get w300 => WarningPalette.warning300;
  Color get w400 => WarningPalette.warning400;
  Color get w500 => WarningPalette.warning500;
  Color get w600 => WarningPalette.warning600;
  Color get w700 => WarningPalette.warning700;
  Color get w800 => WarningPalette.warning800;
  Color get w900 => WarningPalette.warning900;
}
