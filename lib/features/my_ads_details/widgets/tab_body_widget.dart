import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/my_ads_details/widgets/presenter_info_widget.dart';
import '../../../core/widgets/progress_view_white.dart';
import '../controller/my_ads_details_controller.dart';

Widget TabBodyWidget(
  BuildContext context, {
  required MyAdsDetailsController controller,
}) {
  Widget _loading() => Center(
    child: Padding(
      padding: EdgeInsets.only(top: Height / 6),
      child: ProgressViewWhite(context, false),
    ),
  );
//service_model
  Widget _emptyData() => Center(
    child: Padding(
      padding: EdgeInsets.only(top: Height / 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppAssets.json.process_json,
            width: 101.w,
            height: 101.w,
          ),
          verticalSpace(20.h),
          Text(
            context.dataEmpty,
            textAlign: TextAlign.center,
            style: context.textStyles.titleLarge.bold.copyWith(
              color: context.colorsCustom.surfacePrimaryBlack,
            ),
          ),
        ],
      ),
    ),
  );

  Widget _offerItem(itemDet) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: itemDet.user?.image ?? '',
              fit: BoxFit.cover,
              height: 100.w,
              width: 100.w,
            ),
          ),
          horizontalSpace(5.w),
          PresenterInfoWidget(
            context,
            image : itemDet.user?.image ?? '',
            name: itemDet.user?.name ?? '',
            rate: itemDet.user?.rate ?? '',
            addedAt: itemDet.addedAt ?? '',
            priceCurr: '${itemDet.price ?? ''} ${itemDet.currency ?? ''}',
            uuid: itemDet.uuid ?? '',
          ),
        ],
      ),
      verticalSpace(10.h),
      Divider(color: context.colorsCustom.CardBorder, thickness: 1),
    ],
  );

  return Obx(() {
    if (controller.isOffersLoading.isTrue) return _loading();
    if (controller.offersList.isEmpty) return _emptyData();
    // orderDataController.OrderUuid

    return ListView.builder(
      itemCount: controller.offersList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => _offerItem(controller.offersList[index]),
    );
  });
}
