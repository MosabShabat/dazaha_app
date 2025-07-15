import 'package:flutter/material.dart';

//  Text(
//       'TransportationAndeliveryScreen',
//       style: context.textStyles.headlineSmall.bold.copyWith(
//         color: context.colorsCustom.TextPrimary,
//       ),
//     ),
//context.colorsCustom.surfacePrimaryWhite,
class AppColors {
  static final light = TokenPalette(
    // BUTTON
    surfacePrimaryWhite: Color(0xFFFFFFFF),
    surfacePrimaryBlack: Color(0xFF161618),
    BluePrimary: Color(0xFF1A6FB3),
    TealGreenSecondary: Color(0xFF119892),
    ButtonLabelPrimary: Color(0xFFFFFFFF),
    TextPrimary: Color(0xFF161618),
    TextSecondary: Color(0xFF4E4E4E),
    SecondaryElement: Color(0xFF4E4E4E),
    CardBackgroundWhite: Color(0xFFFFFFFF),
    CardBackgroundLightGray: Color(0xFFF6F6F6),
    CardBorder: Color(0xFFD4D4D8),
    BlueBlue: Color(0xFFF3F7FC),
    LightBlue: Color(0xFFE8F5FE),
    LightGrey: Color(0xFFD4D4D8),
    redColor: Color(0xFFF50002),
    LightYellow: Color(0xFFFFF8E1),
    LightTealGreen: Color(0xFFE7F5F4),
    LightOrange: Color(0xFFFFF6E9),
    LightRed: Color(0xFFFFF0F0),

    //LightRed
    // INPUT

    // inputBorderSelected: Color(0xFFB9CFFF),
    // inputText: Color(0xFFBDBDBD),
    // otpSelected: Color(0xFFDAE9FF),

    // SURFACE
    // surfaceBg: Color(0xFFFFFFFF),
    // surfaceLoginButton: Color(0xFFF5F5F5),
    // divider: Color(0xFFF0F0F0),
    // border: Color(0xFFF5F5F5),
    // borderLight: Color(0xFFF1F1F1),
    // borderLight2: Color(0xFFF9F9F9),
    // overlay: Color(0x80000000),
    // overlayColored: Color(0xCC1646A7),
    // swipeUpBg: Color(0xFFFFFFFF),
    // primaryPrimaryLight: Color(0xFF1646A7),
    // tagBgColor: Color(0xFFF6F6F6),
    // tagBgRedColor: Color(0xCCFF5777),
    // stepGrayBg: Color(0xFFF0F0F0),
    // disabledBg: Color(0x1A3C3C43),
    // componentSelected: Color(0xFFE0EBFF),
    // zIndex1: Color(0xFFFFFFFF),
    // tagGreen: Color(0x40D6F4DE),
    // buttonTag: Color(0x80DBE8FF),

    // selectedBrColor: Color(0xFF216AFF),
    // tonal1: Color(0x141646A7), // 8%
    // tonal2: Color(0x801646A7), // 50%
    // tonal3: Color(0x0D1646A7), // 5%
    // warningTransparentBg: Color(0x33FFF5CC), // 20% شفافية
    // TEXT
    // textLightGray: Color(0xFF999999),
    // textDark: Color(0xFF1A1A1A),
    // textLink: Color(0xFF1646A7),
    // textError: Color(0xFFFF2D55),
    // textSuccess: Color(0xFF34C759),
    // textColor: Color(0xFFFFFFFF),
    // disabledText: Color(0x333C3C43),

    // BASE
    // baseWhite: Color(0xFFFFFFFF),
    // baseBlack: Color(0xFF000000),
    // baseDarkBlue: Color(0xFF000A29),

    // GRADIENTS
    // gradient01: Color(0xFFFFFFFF),
    // gradient02: Color(0xFFFFFFFF),
    // gradient03: Color(0xFFFFFFFF),

    // gradientTopBar: Color(0x4D3379FF),
    // gradientTopBarStart: Color(0xB31646A7),
    // gradientTopBarEnd: Color(0x001646A7),

    //For Me
    // warning: Color(0xFFFFCF55),
    // secoundryColor: Color(0xFFFFFFFF),
    // indectorColorUnselected: Color(0xFF33333366),
    // balckWhite: Color(0xFF000000),
    // dotColor: Color(0xFFC4C4C4),
    // tagBgColor2: Color(0xFFF6F6F6),
    // tagBgRed: Color(0x1AE85473),
    // selectedBlueBg: Color(0x211646A7),
    // tealGreen: Color(0x211646A7),
  );

  static final dark = TokenPalette(
    surfacePrimaryWhite: Color(0xFFFFFFFF),
    surfacePrimaryBlack: Color(0xFF1646A7),
    BluePrimary: Color(0xFF1646A7),
    TealGreenSecondary: Color(0xFF1A1A1A),
    ButtonLabelPrimary: Color(0xFFFFFFFF),
    TextPrimary: Color(0xFFFF2D55),
    TextSecondary: Color(0xFF34C759),
    SecondaryElement: Color(0xFF9E9E9E),
    CardBackgroundWhite: Color(0xFFF2F2F2),
    CardBackgroundLightGray: Color(0xFFFAFAFA),
    CardBorder: Color(0xFFD4D4D8),
    BlueBlue: Color(0xFFF3F7FC),
    LightBlue: Color(0xFFE8F5FE),
    redColor: Color(0xFFF50002),
    LightGrey: Color(0xFFD4D4D8),
    LightYellow: Color(0xFFFFF8E1),
    LightTealGreen: Color(0xFFE7F5F4),
    LightOrange: Color(0xFFFFF6E9),
    LightRed: Color(0xFFFFF0F0),

    // inputBg: Color(0xFF000A29),
    // inputBorder: Color(0xFF26428B),
    // inputBorderSelected: Color(0xFF000F2D),
    // inputText: Color(0xFFBDBDBD),
    // otpSelected: Color(0xFF000F2D),
    // tealGreen: Color(0x211646A7),
    // surfaceBg: Color(0xFF0B0B0B),
    // surfaceLoginButton: Color(0xFF000B2E),
    // divider: Color(0xFF404040),
    // border: Color(0xFF404040),
    // borderLight: Color(0x23B3B3B3),
    // borderLight2: Color(0xFFB3B3B3),
    // overlay: Color(0x9900040F),
    // overlayColored: Color(0xA6000B2E),
    // swipeUpBg: Color(0xFF0D0D0D),
    // primaryPrimaryLight: Color(0xFF216AFF),
    // tagBgColor: Color(0x14FBFBFB),
    // tagBgRedColor: Color(0xCCFF5777),
    // stepGrayBg: Color(0x24B3B3B3),
    // disabledBg: Color(0xFF0E1015),
    // componentSelected: Color(0xFF000B2E),
    // selectedBrColor: Color(0xFF387AFF),
    // tonal1: Color(0xFF1E2A54),
    // tonal2: Color(0xFF0E1A35),
    // tonal3: Color(0x1A216AFF),
    // warningTransparentBg: Color(0x29FFCC00),
    // zIndex1: Color(0xFF000B2E),
    // tagGreen: Color(0x0DD6F4DE),
    // buttonTag: Color(0x0DDBE8FF),

    // textLightGray: Color(0xFFB3B3B3),
    // textDark: Color(0xFFF0F0F0),
    // textLink: Color(0xFFFFFFFF),
    // textError: Color(0xFFCC2444),
    // textSuccess: Color(0xFF81E6BA),
    // textColor: Color(0xFFFFFFFF),
    // disabledText: Color(0xFF555555),

    // baseWhite: Color(0xFF000000),
    // baseBlack: Color(0xFFFFFFFF),
    // baseDarkBlue: Color(0xFFFFFFFF),

    // gradient01: Color(0xFF000B2E),
    // gradient02: Color(0xFF000821),
    // gradient03: Color(0xFF00040F),
    // gradientTopBar: Color(0x003379FF),
    // gradientTopBarStart: Color(0xB3000B2E),
    // gradientTopBarEnd: Color(0x00000B2E),

    //For Me
    // warning: Color(0xFFFFCF55),
    // secoundryColor: Color(0xFF000821),
    // indectorColorUnselected: Color(0xFF404040),
    // balckWhite: Color(0xFFFFFFFF),
    // dotColor: Color(0xFFC4C4C4),
    // tagBgColor2: Color(0xFFF6F6F6),
    // tagBgRed: Color(0x1AE85473),
    // selectedBlueBg: Color(0x211646A7),
  );

  // static LinearGradient lightScreenBackgroundGradient = LinearGradient(
  //   begin: Alignment.topCenter,
  //   end: Alignment.bottomCenter,
  //   colors: [light.gradient03, light.gradient02, light.gradient01],
  //   stops: [0.0, 0.08, 0.52],
  // );
}

class TokenPalette {
  final Color surfacePrimaryWhite;
  final Color surfacePrimaryBlack;
  final Color BluePrimary;
  final Color TealGreenSecondary;
  final Color ButtonLabelPrimary;
  final Color TextPrimary;
  final Color TextSecondary;
  final Color SecondaryElement;
  final Color CardBackgroundWhite;
  final Color CardBackgroundLightGray;
  final Color CardBorder;
  final Color BlueBlue;
  final Color LightBlue;
  final Color LightGrey;
  final Color redColor;
  final Color LightYellow;
  final Color LightTealGreen;
  final Color LightOrange;
  final Color LightRed;

  //LightYellow

  const TokenPalette({
    required this.surfacePrimaryWhite,
    required this.surfacePrimaryBlack,
    required this.BluePrimary,
    required this.TealGreenSecondary,
    required this.ButtonLabelPrimary,
    required this.TextPrimary,
    required this.TextSecondary,
    required this.SecondaryElement,
    required this.CardBackgroundWhite,
    required this.CardBackgroundLightGray,
    required this.CardBorder,
    required this.BlueBlue,
    required this.LightBlue,
    required this.LightGrey,
    required this.redColor,
    required this.LightYellow,
    required this.LightTealGreen,
    required this.LightOrange,
    required this.LightRed,

    //LightRed
  });
}

class WarningPalette {
  static const Color warning100 = Color(0xFFFFF5CC);
  static const Color warning200 = Color(0xFFFFEB99);
  static const Color warning300 = Color(0xFFFFE066);
  static const Color warning400 = Color(0xFFFFD633);
  static const Color warning500 = Color(0xFFFFCC00);
  static const Color warning600 = Color(0xFFCCA300);
  static const Color warning700 = Color(0xFF997A00);
  static const Color warning800 = Color(0xFF665200);
  static const Color warning900 = Color(0xFF332900);
}
