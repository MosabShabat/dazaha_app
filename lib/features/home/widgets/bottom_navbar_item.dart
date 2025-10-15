import '../../../../core/constant/exports_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarItem extends StatelessWidget {
  final String assetName;
  final bool isSelected;

  const BottomNavBarItem({required this.assetName, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      colorFilter: ColorFilter.mode(
        isSelected
            ? context.colorsCustom.TealGreenSecondary
            : context.colorsCustom.surfacePrimaryBlack,
        BlendMode.srcIn,
      ),
    );
  }
}
