import '../../../../core/constant/exports_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../theming/app_text_styles.dart';

Widget EmptyNotifications(BuildContext context) {
  return Container(
    width: Width.w,
    height: Height.h * 0.5,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(80),
          Lottie.asset(
            AppAssets.json.JsonNotification,
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
          Text(
            context.notificationEmptyTitle,
            style: AppTextStyles.font22Black700Bold(context),
          ),
       
        ],
      ),
    ),
  );
}
