import '../../../../core/constant/exports_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';


class CustomShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final bool hasMargin;

  const CustomShimmer({
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius = 6.0,
    this.hasMargin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          margin: hasMargin ? EdgeInsets.symmetric(horizontal: 4.0.w) : EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius.r),
            color: context.colorsCustom.surfacePrimaryWhite,
          ),
          width: width.w,
          height: height.h,
        ),
      ),
    );
  }
}
