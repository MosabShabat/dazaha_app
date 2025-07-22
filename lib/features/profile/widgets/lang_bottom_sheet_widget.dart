import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/top_con_bot_sh_widget.dart';
import 'package:dazaha_app/features/profile/controller/profile_controller.dart';
import 'package:dazaha_app/features/profile/widgets/lan_list_tail_widget.dart';

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
          height: 270.h,
          color: context.colorsCustom.surfacePrimaryWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TopConBotShWidget(context),
              Text(
                context.chooseLanguage,
                style: context.textStyles.titleMedium.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                ),
              ),
              LanListTailWidget(
                context,
                img: SvgPicture.asset(AppAssets.svgs.mask_group_icon),
                value: true,
                isArabic: isArabic,
                text: context.arabic,
                changeLang: (value) {
                  controller.setLanguage(true);
                },
              ),
              Divider(
                color: context.colorsCustom.CardBorder,
                thickness: 1,
                height: 1,
              ),
              LanListTailWidget(
                context,
                img: CircleAvatar(
                  radius: 20.w,
                  backgroundColor: context.colorsCustom.CardBackgroundLightGray,
                  child: SvgPicture.asset(
                    AppAssets.svgs.setting_icon,
                    color: context.colorsCustom.surfacePrimaryBlack,
                  ),
                ),
                isArabic: isArabic,
                text: context.english,
                value: false,
                changeLang: (value) {
                  controller.setLanguage(false);
                },
              ),
              verticalSpace(20.h),
            ],
          ),
        );
      });
    },
  );
}


