import '../../../../core/constant/exports_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../helpers/constants.dart';

Widget AppButtonBack({
  required BuildContext context,
  Color? color,
  String? routeName,
  String navigationType = AppNavigationType.offNamed,
  double paddingLeft = 10.0,
  double paddingRight = 10.0,
}) {
  return Padding(
    padding: EdgeInsets.only(top: 14, right: paddingRight, left: paddingLeft),
    child: IconButton(
      onPressed: () {
        print('AppButtonBack Pressed');
        print('routeName : ${routeName}');
        print('routeName : ${navigationType}');

        if (routeName != null && routeName.isNotEmpty) {
          print(
            'Navigating to $routeName using $navigationType navigation type',
          );
          if (navigationType == AppNavigationType.toNamed) {
            Get.toNamed(routeName);
          } else if (navigationType == AppNavigationType.offNamed) {
            Get.offNamed(routeName);
          } else if (navigationType == AppNavigationType.offAllNamed) {
            Get.offAllNamed(routeName);
          }
        } else {
          print('No routeName provided, performing Get.back()');
          Get.back();
        }
      },
      icon: Icon(
        Icons.arrow_back_ios,
        size: 16.sp,
        color: color ?? context.colorsCustom.surfacePrimaryBlack,
      ),
    ),
  );
}
