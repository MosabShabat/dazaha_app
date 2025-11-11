import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
// import '../../../../core/widgets/def_app_bar_widget.dart';
import '../../../../features/my_ads_details/widgets/tob_column_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
// import '../../my_offer_ad_details/widgets/my_offer_app_bar_widget.dart';
import '../../my_offer_ad_details/widgets/my_offer_app_bar_widget.dart';
import '../controller/my_ads_details_controller.dart';
import '../widgets/my_order_details_shimmer_widget.dart';
import '../widgets/status_type_widget.dart';

class MyAdsDetailsScreen extends StatelessWidget {
  MyAdsDetailsScreen({super.key});

  final MyAdsDetailsController myAdsDetailsController = Get.find();
  final OrderDataController orderDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (myAdsDetailsController.isLoading.isTrue) {
        return MyOrderDetailsShimmerWidget();
      }
      final order = myAdsDetailsController.myOrderDetails!.value;

      return Scaffold(
        backgroundColor: context.colorsCustom.surfacePrimaryWhite,
        appBar:
            // DefAppBarWidget(context),
            MyOfferAppBarWidget(
              context,
              offerOrOrder: 'order',
              status: order.status == 'receiving_offers'
                  ? 'pending'
                  : 'in_progress',
              price: order.likedPrice,
              curr: order.currency,
              timeLen: 3,
              timeItem: [
                {
                  'uuid': '11eb94df-09ab-4cd0-8b59-b4d7b1e7d752',
                  'time': '2:00 م - 3:00 م',
                },
                {
                  'uuid': '11eb94df-09ab-4cd0-8b59-b4d7b1e7d752',
                  'time': '2:00 م - 3:00 م',
                },
                {
                  'uuid': '11eb94df-09ab-4cd0-8b59-b4d7b1e7d752',
                  'time': '2:00 م - 3:00 م',
                },
              ],
            ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                TobColumnWidget(
                  context,
                  horizontalPadding: 16.w,
                  orderIdCreatedAt:
                      '${order.orderId ?? ''}, ${context.published} ${order.addedAt ?? ''}',
                  status: order.status ?? '',
                  statusText: order.statusText ?? '',
                  image: order.image ?? '',
                  priceCurr:
                      '${order.likedPrice ?? ''} ${order.currency ?? ''}',
                  serviceTitle: order.serviceTitle ?? '',
                  title: order.title ?? '',
                  uuid: order.uuid ?? '',
                ),
                Divider(color: context.colorsCustom.CardBorder, thickness: 1),
                verticalSpace(20.h),
                StatusTypeWidget(
                  context,
                  order,
                  orderDataController,
                  myAdsDetailsController,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
