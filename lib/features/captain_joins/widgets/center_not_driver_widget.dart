import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/bottom_navigation_bar_widget.dart';
import '../../../core/widgets/login_required_bottom_sheet/view/login_required_bottom_sheet.dart';

Widget CenterNotDriverWidget(BuildContext context) {
  return Scaffold(
    backgroundColor: context.colorsCustom.surfacePrimaryWhite,
    bottomNavigationBar: BottomNavigationBarWidget(
      text: context.startNow,
      context,
      GetScreen: () {
        if (AppConstants.userToken.isNotEmpty &&
            AppConstants.userToken != '' &&
            AppConstants.userUUid.isNotEmpty &&
            AppConstants.userUUid != '') {
          Get.toNamed(Routes.personalDataScreen);
        } else {
          showLoginRequiredBottomSheet(
            Get.context!,
            typeSelected: 'homeScreen3',
          );
        }
      },
    ),
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.images.group_120857_png,
              width: 320.w,
              height: 200.h,
              fit: BoxFit.fill,
            ).box.alignCenter.make(),
            verticalSpace(10.h),
            Text(
              '${context.joinAsCap}',
              textAlign: TextAlign.center,
              style: context.textStyles.bodyLarge.bold.copyWith(
                color: context.colorsCustom.TextPrimary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ).box.alignCenter.make(),
            verticalSpace(20.h),
            Text(
              '${context.offerDevSer}',
              textAlign: TextAlign.center,
              style: context.textStyles.bodyLarge.medium.copyWith(
                color: context.colorsCustom.TextSecondary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ).box.alignCenter.make(),
          ],
        ),
      ),
    ),
  );
}
