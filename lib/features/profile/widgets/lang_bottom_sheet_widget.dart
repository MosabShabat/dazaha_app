import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/profile/controller/profile_controller.dart';

Future<dynamic> LangBottomSheetWidget(BuildContext context) {
  final ProfileController controller = Get.put(ProfileController());

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return Obx(() {
        final isArabic = controller.radioValue.value;
        return Container(
          width: Width.w,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          color: context.colorsCustom.surfacePrimaryWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Divider(
                height: 4.h,
                color: context.colorsCustom.CardBorder,
                radius: BorderRadius.circular(3.r),
                endIndent: 60.w,
                indent: 60.w,
              ),
              Text(
                context.chooseLanguage,
                style: context.textStyles.titleMedium.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 18.sp,
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(AppAssets.svgs.mask_group_icon),
                title: Text(
                  context.arabic,
                  style: context.textStyles.bodySmall.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                ),
                trailing: Radio<bool>(
                  value: true,
                  groupValue: isArabic,
                  onChanged: (value) {
                    controller.setLanguage(true);
                  },
                ),
              ),
              Divider(
                color: context.colorsCustom.CardBorder,
                thickness: 1,
                height: 1,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 20.w,
                  backgroundColor: context.colorsCustom.CardBackgroundLightGray,
                  child: SvgPicture.asset(
                    AppAssets.svgs.setting_icon,
                    color: context.colorsCustom.surfacePrimaryBlack,
                  ),
                ),
                title: Text(
                  context.english,
                  style: context.textStyles.bodySmall.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                ),
                trailing: Radio<bool>(
                  value: false,
                  groupValue: isArabic,
                  onChanged: (value) {
                    controller.setLanguage(false);
                  },
                ),
              ),
            ],
          ),
        );
      });
    },
  );
}
