import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/def_app_bar_widget.dart';
import '../../../../features/my_ads_details/widgets/tob_column_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
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
        appBar: DefAppBarWidget(context),
        //  MyOfferAppBarWidget(
        //   context,
        //   status: 'pending',
        //   price: myOrderDetails.likedPrice,
        //   curr: myOrderDetails.currency,
        //   timeLen: myOrderDetails.order!.times!.length,
        //   timeItem: myOrderDetails.order!.times!,
        // ),
        body: SingleChildScrollView(
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
                priceCurr: '${order.likedPrice ?? ''} ${order.currency ?? ''}',
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
        ),//"You can follow the details from the My Ads interface"
      );
    });
  }
}
