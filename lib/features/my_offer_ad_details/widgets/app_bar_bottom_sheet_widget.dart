import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/top_con_bot_sh_widget.dart';
import '../../../features/item_ad_details/widgets/add_offer_bottom_sheet_widget.dart';
import '../../../features/my_offer_ad_details/widgets/delete_bottom_sheet_widget.dart';

/// BottomSheet لإظهار خيارات التعديل أو الحذف
Future<dynamic> AppBarBottomSheetWidget(
  BuildContext context, {
  required int timeLen,
  required List<dynamic> timeItem,
  required dynamic price,
  required String curr,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) => SingleChildScrollView(
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
            _buildOptionTile(
              context,
              iconPath: AppAssets.svgs.edit_2_icon,
              title: context.edit,
              onTap: () {
                AddOfferBottomSheetWidget(
                  context,
                  price: price,
                  curr: curr,
                  timeLen: timeLen,
                  timeItem: timeItem,
                  isUpdate: true,
                );
              },
            ),
            verticalSpace(15.h),
            _buildOptionTile(
              context,
              iconPath: AppAssets.svgs.trash_icon,
              title: context.delete,
              onTap: () => DeleteBottomSheetWidget(context),
            ),
            verticalSpace(20.h),
          ],
        ),
      ),
    ),
  );
}

/// عنصر ListTile موحد مع Avatar
Widget _buildOptionTile(
  BuildContext context, {
  required String iconPath,
  required String title,
  required VoidCallback onTap,
}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: CircleAvatar(
      radius: 23.5.r,
      backgroundColor: context.colorsCustom.CardBackgroundLightGray,
      child: SvgPicture.asset(iconPath),
    ),
    title: Text(
      title,
      style: context.textStyles.titleSmall.medium.copyWith(
        color: context.colorsCustom.TextPrimary,
      ),
    ),
    onTap: onTap,
  );
}
