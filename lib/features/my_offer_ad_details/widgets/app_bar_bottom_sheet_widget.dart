import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/top_con_bot_sh_widget.dart';
import 'package:dazaha_app/features/item_ad_details/widgets/add_offer_bottom_sheet_widget.dart';
import 'package:dazaha_app/features/my_offer_ad_details/widgets/delete_bottom_sheet_widget.dart';

Future<dynamic> AppBarBottomSheetWidget(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          width: Width,
          color: context.colorsCustom.surfacePrimaryWhite,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TopConBotShWidget(context),
              verticalSpace(10.h),
              Text(
                    context.quoteOptions,
                    style: context.textStyles.titleSmall.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ).box
                  .alignment(
                    Localizations.localeOf(context).languageCode == "ar"
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                  )
                  .make(),
              verticalSpace(15.h),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: CircleAvatar(
                  radius: 23.5.r,
                  backgroundColor: context.colorsCustom.CardBackgroundLightGray,
                  child: SvgPicture.asset(AppAssets.svgs.edit_2_icon),
                ),
                title: Text(
                  context.edit,
                  style: context.textStyles.titleSmall.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                ),
                onTap: () {
                  AddOfferBottomSheetWidget(context);
                },
              ),
              verticalSpace(15.h),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: CircleAvatar(
                  radius: 23.5.r,
                  backgroundColor: context.colorsCustom.CardBackgroundLightGray,
                  child: SvgPicture.asset(AppAssets.svgs.trash_icon),
                ),
                title: Text(
                  context.delete,
                  style: context.textStyles.titleSmall.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                ),
                onTap: () {
                  DeleteBottomSheetWidget(context);
                },
              ),
              verticalSpace(20.h),
            ],
          ),
        ),
      );
    },
  );
}
