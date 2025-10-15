import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/network/models/orders/my_order_details.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import 'captain_info_widget.dart';
import 'invoice_box_widget.dart';
import 'pay_mth_widget.dart';
import 'place_col_widget.dart';
import 't_d_del_widget.dart';
import 'track_your_flight_widget.dart';
import '../controller/my_ads_details_controller.dart';
import 'med_cus_widget.dart';
import 'tab_body_widget.dart';

Widget StatusTypeWidget(
  BuildContext context,
  MyOrderDetails order,
  OrderDataController orderDataController,
  MyAdsDetailsController myAdsDetailsController,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      myAdsDetailsController.myOrderDetails!.value.status == 'receiving_offers'
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MedCusWidget(
                        context,
                        count: '${order.offersCount ?? ''}',
                      ),
                      verticalSpace(20.h),
                      TabBodyWidget(
                        context,
                        controller: myAdsDetailsController,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(10.h),
                  TrackYourFlightWidget(
                    context,
                    isShow: orderDataController.itemStatus.value,
                    BottomText: context.tracking,
                    isShowBo: false,
                    rating: '${order.rating ?? ''}',
                    page: () {
                      Get.toNamed(Routes.myAdsDetailsScreen);
                    },
                  ),
                  verticalSpace(20.h),
                  PlaceColWidget(
                    context,
                    fromDet: '${order.from ?? ''}',
                    fromTitle: '${order.fromAddress ?? ''}',
                    toDet: '${order.to ?? ''}',
                    toTitle: '${order.toAddress ?? ''}',
                  ),
                  verticalSpace(20.h),
                  CaptainInfoWidget(context, order.driver!),
                  verticalSpace(20.h),
                  TDDelWidget(
                    context,
                    title: context.transferDate,
                    date: order.date ?? '',
                    time: order.time ?? '',
                  ),
                  verticalSpace(20.h),
                  PayMthWidget(
                    context,
                    cardNumber: order.payment!.paymentCardNumber ?? '',
                    cardType: order.payment!.paymentWayText ?? '',
                  ),
                  verticalSpace(20.h),
                  InvoiceBoxWidget(context, order.payment!),
                  verticalSpace(20.h),
                  GeneralBottomAppWidget(
                    context,
                    text: context.reportAProblem,
                    fontFamily: context.textStyles.bodyLarge.bold.fontFamily,
                    fontWeight: FontWeight.w700,
                    backgroundColorB: context.colorsCustom.LightGrey
                        .withOpacity(0.2),
                    textColorB: context.colorsCustom.TextPrimary,
                    onTap: () {
                      Get.toNamed(Routes.reportAProblemScreen);
                    },
                  ),
                  verticalSpace(20.h),
                ],
              ),
            ),
    ],
  );
}
