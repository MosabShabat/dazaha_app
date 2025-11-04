import 'dart:developer';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/network/models/orders/my_order_details.dart';
import '../../../core/widgets/login_required_bottom_sheet/view/login_required_bottom_sheet.dart';
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
  log(
    'myAdsDetailsController.myOrderDetails!.value.status : ${myAdsDetailsController.myOrderDetails!.value.status}',
  );
  if (myAdsDetailsController.myOrderDetails!.value.status !=
      'receiving_offers') {
    final orderData = myAdsDetailsController.myOrderDetails!.value;
    orderDataController.setFrom(orderData.from ?? '');
    orderDataController.setFromAddress(orderData.fromAddress ?? '');
    orderDataController.setFromLat(orderData.fromLat ?? '');
    orderDataController.setFromLng(orderData.fromLng ?? '');
    orderDataController.setTo(orderData.to ?? '');
    orderDataController.setToAddress(orderData.toAddress ?? '');
    orderDataController.setToLat(orderData.toLat ?? '');
    orderDataController.setToLng(orderData.toLng ?? '');
    orderDataController.setUserImage(orderData.driver!.image ?? '');
    orderDataController.setUserName(orderData.driver!.name ?? '');
    orderDataController.setUserMobile('${orderData.driver!.mobile ?? ''}');
    orderDataController.setUserRate('${orderData.driver!.rate ?? ''}');
    orderDataController.setUserUuid('${orderData.driver!.uuid ?? ''}');
    orderDataController.setOrderStatus('${orderData.status}');
    // orderDataController.setItemStatus('${orderData.statusText}');

    AppConstants.userName = '${orderData.driver!.name ?? ''}';
    AppConstants.orderId = '${orderData.orderId ?? ''}';
    AppConstants.orderTitle = '${orderData.title ?? ''}';
    AppConstants.userImage = '${orderData.driver!.image ?? ''}';
    AppConstants.uuid = '${orderData.driver!.uuid ?? ''}';
  }
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
                    isShow: orderDataController.orderStatus.value,
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
                    fromLat: order.fromLat,
                    fromLng: order.fromLng,
                    toLat: order.toLat,
                    toLng: order.toLng,
                  ),
                  verticalSpace(20.h),
                  CaptainInfoWidget(context, order.driver!),
                  verticalSpace(20.h),
                  TDDelWidget(
                    context,
                    title: context.transferDate,
                    date: order.date ?? '',
                    time: order.times ?? '',
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
                      if (AppConstants.userToken.isNotEmpty &&
                          AppConstants.userToken != '' &&
                          AppConstants.userUUid.isNotEmpty &&
                          AppConstants.userUUid != '') {
                        Get.toNamed(
                          Routes.reportAProblemScreen,
                          arguments: {
                            // AppConstants.referenceType: AppConstants.purchase,
                            // AppConstants.referenceUuid: orderUuid
                            'referenceType': '',
                            'referenceUuid': '',
                          },
                        );
                      } else {
                        showLoginRequiredBottomSheet(Get.context!);
                      }
                    },
                  ),
                  verticalSpace(20.h),
                ],
              ),
            ),
    ],
  );
}
