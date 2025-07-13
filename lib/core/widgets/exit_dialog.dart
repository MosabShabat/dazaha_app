import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/spacing.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:flutter/services.dart';

Widget exitDialog(BuildContext context) {
  return Dialog(
    elevation: 0,
    backgroundColor: context.colorsCustom.surfacePrimaryWhite,
    child: Padding(
      padding: EdgeInsets.all(10.0.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30.w,
            backgroundColor: context.colorsCustom.surfacePrimaryBlack,
            child: Icon(Icons.warning),
          ),
          verticalSpace(10.h),
          Text(
            context.confirm,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: context.textStyles.bodyLarge.bold.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 18,
            ),
          ),

          const Divider(),
          verticalSpace(10.h),
          Text(
            context.areYouSureYouWantToLeave,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: context.textStyles.bodyLarge.bold.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 18,
            ),
          ),

          verticalSpace(10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                minWidth: 60.w,
                height: 20.h,
                color: context.colorsCustom.TealGreenSecondary,
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text(
                  context.yes,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: context.textStyles.titleLarge.bold.copyWith(
                    color: context.colorsCustom.surfacePrimaryWhite,
                    fontSize: 20,
                  ),
                ),
              ),
              MaterialButton(
                minWidth: 60.w,
                height: 20.h,
                color: context.colorsCustom.TealGreenSecondary,
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  context.no,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: context.textStyles.titleLarge.bold.copyWith(
                    color: context.colorsCustom.surfacePrimaryWhite,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
