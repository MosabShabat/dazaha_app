import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/latest_announcements_widget.dart';
import '../../../../core/widgets/top_con_bot_sh_widget.dart';
import '../../../../features/my_ads_details/widgets/accept_cat_bottom_sheet/custom_price_box_widget.dart';
import '../../../../features/my_ads_details/widgets/accept_cat_bottom_sheet/mid_info_col_widget.dart';
import '../../../choose_the_service/controller/order_data_controller.dart';

Future<dynamic> AcceptBottomSheetWidget(
  BuildContext context, {
  required String name,
  required String rate,
  required String addedAt,
  required String priceCurr,
  required String uuid,
  required String image,

  //image
}) {
  OrderDataController orderDataController = Get.find();
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return SingleChildScrollView(
        child: SafeArea(
          child:
              Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopConBotShWidget(context).box.alignCenter.make(),
                      verticalSpace(10.h),
                      LatestAnnouncementsRowWidget(
                        context,
                        text: context.acceptTheOffer,
                        size: 12.sp,
                        fontFamily:
                            context.textStyles.bodySmall.medium.fontFamily,
                        onPressed: () {},
                        Widget: Container(),
                      ),
                      Text(
                        '${context.doYouWantToAcceptTheOffer}',
                        style: context.textStyles.titleMedium.bold.copyWith(
                          color: context.colorsCustom.TextPrimary,
                          fontSize: 18.sp,
                        ),
                      ).box.alignCenter.make(),
                      verticalSpace(10.h),
                      CustomPriceBoxWidget(context, priceCurr: priceCurr),
                      verticalSpace(10.h),
                      MidInfoColWidget(
                        context,
                        name: name,
                        rate: rate,
                        image: image,
                        addedAt: addedAt,
                        uuid: uuid,
                      ),
                      Text(
                        context.ifYouAcceptTheOfferTheOrder,
                        style: context.textStyles.bodySmall.regular.copyWith(
                          color: context.colorsCustom.TextPrimary,
                        ),
                      ),
                      verticalSpace(Width * 0.1),
                      GeneralBottomAppWidget(
                        context,
                        text: context.acceptTheOffer,
                        onTap: () {
                          orderDataController.setOfferItemUuid(uuid);
                          Get.toNamed(Routes.myAdPayMentScreen);
                        },
                      ),
                      verticalSpace(10.h),
                      GeneralBottomAppWidget(
                        context,
                        text: context.no,
                        backgroundColorB:
                            context.colorsCustom.CardBackgroundLightGray,
                        textColorB: context.colorsCustom.TextPrimary,
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ],
                  ).box
                  .color(context.colorsCustom.surfacePrimaryWhite)
                  .padding(EdgeInsets.symmetric(horizontal: 20.w, vertical: 20))
                  .width(Width)
                  .make(),
        ),
      );
    },
  );
}
