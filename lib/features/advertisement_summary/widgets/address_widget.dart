import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/list_tile_advertisement_summary_widget.dart';

Widget AddressWidget(BuildContext context, {required isShow}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.address,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: context.textStyles.titleMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),

      verticalSpace(10.h),
      Text(
        context.receiptMethod,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: context.textStyles.bodySmall.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),

      verticalSpace(10.h),
      ListTileAdvertisementSummaryWidget(
        context,
        img: AppAssets.svgs.marker_a_icon,
        title: 'بيت الأهل',
        subTitle: 'حي الجزائر، شارع الكويت، البصرة، العراق',
        isShow: true,
      ),
      verticalSpace(10.h),
      Text(
        context.deliveryPoint,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: context.textStyles.bodySmall.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(10.h),
      ListTileAdvertisementSummaryWidget(
        context,
        img: AppAssets.svgs.marker_b_icon,
        title: 'بيت الأهل',
        subTitle: 'حي الجزائر، شارع الكويت، البصرة، العراق',
        isShow: true,
      ),
      verticalSpace(10.h),
      Text(
        context.receiptMethod,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: context.textStyles.bodySmall.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(10.h),
      ListTileAdvertisementSummaryWidget(
        context,
        img: AppAssets.svgs.dar_icon,
        title: context.stairs,
        subTitle: context.movingItemsRequiresClimbingStairs,
        isShow: true,
      ),
      isShow
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10.h),
                Text(
                  context.sizeOfItems,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: context.textStyles.bodySmall.medium.copyWith(
                    color: context.colorsCustom.TextSecondary,
                  ),
                ),
                ListTileAdvertisementSummaryWidget(
                  context,
                  img: AppAssets.svgs.maximize_3_icon,
                  title: 'متوسط',
                  subTitle: '',
                  isShow: false,
                ),
                Text(
                  context.assistants,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: context.textStyles.bodySmall.medium.copyWith(
                    color: context.colorsCustom.TextSecondary,
                  ),
                ),
                verticalSpace(10.h),
                ListTileAdvertisementSummaryWidget(
                  context,
                  img: AppAssets.svgs.people_icon,
                  title: '3 مساعدين',
                  subTitle: '',
                  isShow: false,
                ),
              ],
            )
          : Container(),
    ],
  );
}
