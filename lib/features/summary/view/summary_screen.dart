import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/def_app_bar_widget.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../../features/advertisement_summary/widgets/address_widget.dart';
import '../../../features/advertisement_summary/widgets/map_widget.dart';
import '../../../features/advertisement_summary/widgets/time_date_widget.dart';
import '../../../features/pick_up_point/widgets/top_text_widget.dart';
import '../../../features/summary/widgets/data_column_widget.dart';
import '../../../features/summary/widgets/summary_list_widget.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../../advertisement_summary/controller/advertisement_summary_controller.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../price_details/controller/price_details_controller.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({super.key});

  final PriceDetailsController priceController = Get.find();
  final OrderDataController orderController = Get.find();
  final AdvertisementSummaryController adController = Get.find();

  @override
  Widget build(BuildContext context) {
    orderController.serviceNumber.value = '1';

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DefAppBarWidget(context),
      bottomNavigationBar: _buildSaveButton(
        context,
      ).paddingSymmetric(horizontal: 16.w, vertical: 20.h),
      body: Obx(() {
        final data = priceController.summaryData.value;
        if (data == null) return Center(child: Text(context.historyEmpty));

        return GeneralScreenWidget(
          context,
          wid: [
            TopTextWidget(
              context,
              Title: context.adSummary,
              isShow: false,
              SubTitle: null,
            ),
            // إعلان الصورة
            Container(
              height: 175.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: CachedNetworkImage(
                imageUrl: data.image ?? '',
                height: 175.w,
                width: 360.w,
                fit: BoxFit.fill,
              ),
            ),
            verticalSpace(10.h),
            // الوقت والتاريخ
            TimeDateWidget(
              context,
              data.date ?? '',
              data.times?.length ?? 0,
              data.times ?? [],
              orderController,
            ),
            verticalSpace(10.h),
            // AddressWidget فقط إذا لم يكن هناك طريقة استلام
            if (data.receiptMethod == null)
              AddressWidget(
                isShow: false,
                isShowMet: false,
                from: data.from ?? '',
                fromLat: data.fromLat ?? '',
                fromLng: data.fromLng ?? '',
                toLat: data.toLat ?? '',
                toLng: data.toLng ?? '',
                fromAddress: data.fromAddress ?? '',
                helpers: orderController.isItemsService
                    ? '0'
                    : '${data.helpers ?? ''}',
                sizeTitle: data.sizeTitle ?? '',
                to: data.to ?? '',
                toAddress: data.toAddress ?? '',
                orderDataController: orderController,
              ),
            verticalSpace(10.h),
            // الخريطة
            MapWidget(
              fromAddress: data.fromAddress ?? '',
              fromLat: data.fromLat ?? '',
              fromLng: data.fromLng ?? '',
              toAddress: data.toAddress ?? '',
              toLat: data.toLat ?? '',
              toLng: data.toLng ?? '',
            ),
            verticalSpace(15.h),
            // قائمة العناصر
            if (orderController.isItemsService)
              SummaryListWidget(
                context,
                itemsLen: data.items?.length ?? 0,
                itemsDet: data.items ?? [],
              ),
            verticalSpace(15.h),
            // بيانات إضافية
            DataColumnWidget(context, isShow: false, controller: data),
          ],
        );
      }),
    );
  }

  /// زر الحفظ (Post Ad)
  Widget _buildSaveButton(BuildContext context) {
    return Obx(
      () => AppLoadingButton(
        text: context.postTheAd,
        onPressed: adController.confirmOrders,
        isLoading: adController.isButtonPressed.value,
        isWhiteProgress: true,
      ),
    );
  }
}
