import '../../../../core/constant/exports_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget AppBuildDragIndicatorBottomSheet(BuildContext context) {
  return Center(
    child: Container(
      width: 65.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: context.colorsCustom.CardBorder,
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
