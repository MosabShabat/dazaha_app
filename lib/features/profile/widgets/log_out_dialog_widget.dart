import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../controller/profile_controller.dart';

Future<dynamic> LogOutDialogWidget(
  BuildContext context,
  ProfileController profileController,
) {
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 8,
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      child: Container(
        width: 300.w, // عرض ثابت نسبيًا
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.svgs.ic_error,
              color: context.colorsCustom.redColor,
              width: 40.w,
              height: 40.w,
            ),
            verticalSpace(12.h),
            Text(
              context.areYouSureYouWantToLeave,
              textAlign: TextAlign.center,
              style: context.textStyles.titleMedium.bold.copyWith(
                color: context.colorsCustom.surfacePrimaryBlack,
                fontSize: 16.sp,
              ),
            ),

            verticalSpace(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120.w,
                  height: 44.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colorsCustom.TealGreenSecondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () async {
                      // اغلق الحوار أولًا
                      Get.back();
                      // ثم نفّذ الخروج (يمكنك انتظار الانتهاء أو لا)
                      profileController.logout();
                    },
                    child: Text(
                      context.yes,
                      style: context.textStyles.bodyMedium.medium.copyWith(
                        color: context.colorsCustom.surfacePrimaryWhite,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 120.w,
                  height: 44.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          context.colorsCustom.CardBackgroundLightGray,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      context.no,
                      style: context.textStyles.bodyMedium.medium.copyWith(
                        color: context.colorsCustom.surfacePrimaryBlack,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    barrierDismissible:
        false, // أو true إذا أردت أن يتم الإغلاق بالنقر خارج الحوار
  );
}
