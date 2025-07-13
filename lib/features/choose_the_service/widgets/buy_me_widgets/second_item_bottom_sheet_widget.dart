import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/choose_the_service/widgets/buy_me_widgets/secondI_info_column_widget.dart';
import 'package:dazaha_app/features/home_page/widgets/main_bottom_widget.dart';

Future<dynamic> SecondItemBottomSheetWidget(
  BuildContext context, {
  required String topTitle,
  required String subTitle1,
  required String subTitle2,
  required String subTitle3,
  required VoidCallback onTap,
}) {
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
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20),
          color: context.colorsCustom.surfacePrimaryWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                topTitle,
                style: context.textStyles.titleMedium.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 20.h),
              mainBottomWidget(
                context,
                fontWeight: FontWeight.w400,
                CircleAvatarRadius: 20.0.w,
                backGroundColor: context.colorsCustom.surfacePrimaryWhite,
                fontFamily: context.textStyles.labelSmall.regular.fontFamily,
                fontSize: 10.0.sp,
                textColor: context.colorsCustom.TextSecondary,
                img: ListImagesBottomSheet,
                text: [
                  context.returnLostItems,
                  context.pickUpFromMarket,
                  context.deliverPurchases,
                  context.transportOfSmallItems,
                ],
              ),
              SecondInfoColumnWidget(
                context,
                text1: subTitle1,
                text2: subTitle2,
                text3: subTitle3,
              ),
              SizedBox(height: 50.h),
              GeneralBottomAppWidget(
                context,
                text: context.continuation,
                onTap: onTap,
              ),
            ],
          ),
        ),
      );
    },
  );
}
