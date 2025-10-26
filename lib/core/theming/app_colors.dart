import 'package:flutter/material.dart';

class AppColors {
  static final light = TokenPalette(
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
    LightGreen: Color(0xFF388E3C),
    moreLightGray: Color(0xFFF4F4F5),

    //LightGreen
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
    LightGreen: Color.fromRGBO(232, 245, 233, 1),
    moreLightGray: Color(0xFFF4F4F5),
  );
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
  final Color LightGreen;
  final Color moreLightGray;

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
    required this.LightGreen,
    required this.moreLightGray,

    //LightGreen
  });
}
