import '../../../features/choose_the_service/controller/order_data_controller.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../my_ads_details/widgets/from_to_cou_widget.dart';
import '../controller/home_page_controller.dart';
import 'case_req_widget.dart';
import 'req_info_widget.dart';

Widget DetailsContainerWidget(
  BuildContext context, {
  required HomePageController controller,
  required bool isOrder,
}) {
  final orderDataController = Get.find<OrderDataController>();
  final currentReq = isOrder
      ? controller.homeModel.value?.currentOrder
      : controller.homeModel.value?.currentOffer;

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
    decoration: BoxDecoration(
      border: Border.all(color: context.colorsCustom.LightGrey, width: 1),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CaseReqWidget(context, controller: controller, isOrder: isOrder),
          ReqInfoWidget(context, controller: controller, isOrder: isOrder),
          verticalSpace(10.h),
          if (currentReq?.to == null || currentReq!.to!.isEmpty)
            _listFromWidget(context, currentReq)
          else
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: FromToCouWidget(
                context,
                CircleSize: 8.w,
                LineHight: 56.h,
                horSpa: 7.w,
                DelText1: currentReq.from ?? '',
                DetText1: '',
                DelText2: currentReq.to ?? '',
                DetText2: '',
                verticalSpaceItems: 15.h,
                fromLat: null,
                fromLng: null,
                conWidth: 265.w,
                toLat: null,
                toLng: null,
              ),
            ),
        ],
      ),
    ),
  ).onTap(() {
    orderDataController.setItemUuid(currentReq?.uuid ?? '');
    if (isOrder) {
      Get.toNamed(Routes.myAdsDetailsScreen);
    } else {
      Get.toNamed(Routes.myOfferAdDetailsScreen);
    }
  });
}

Widget _listFromWidget(BuildContext context, currentOrder) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: CircleAvatar(
      radius: 8.w,
      backgroundColor: context.colorsCustom.TealGreenSecondary,
    ),
    title: Text(
      context.deliveryFrom,
      textAlign: TextAlign.start,
      maxLines: 5,
      style: context.textStyles.labelMedium.regular.copyWith(
        color: context.colorsCustom.TextSecondary,
        fontSize: 12.sp,
      ),
    ),
    subtitle: Text(
      currentOrder?.from ?? '',
      textAlign: TextAlign.start,
      maxLines: 5,
      style: context.textStyles.labelMedium.medium.copyWith(
        color: context.colorsCustom.TextPrimary,
      ),
    ),
  );
}
