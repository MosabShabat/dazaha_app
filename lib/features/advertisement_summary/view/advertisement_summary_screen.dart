import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/def_app_bar_widget.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../../core/widgets/image_list_view_builder_widget.dart';
import '../../../features/advertisement_summary/widgets/address_widget.dart';
import '../../../features/advertisement_summary/widgets/det_column_widget.dart';
import '../../../features/advertisement_summary/widgets/time_date_widget.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../price_details/controller/price_details_controller.dart';
import '../controller/advertisement_summary_controller.dart';
import '../widgets/map_widget.dart';

class AdvertisementSummaryScreen extends StatelessWidget {
  AdvertisementSummaryScreen({Key? key}) : super(key: key);

  final AdvertisementSummaryController _controller = Get.find();
  final PriceDetailsController priceController =
      Get.find<PriceDetailsController>();
  final OrderDataController orderDataController =
      Get.find<OrderDataController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DefAppBarWidget(context),
      bottomNavigationBar: _buildSaveButton(
        context,
      ).paddingSymmetric(horizontal: 16.w, vertical: 20.h),
      body: SafeArea(
        child: Obx(() {
          final data = priceController.summaryData.value;
          if (data == null) {
            return Center(child: Text(context.dataEmpty));
          }

          return GeneralScreenWidget(
            context,
            wid: [
              _buildTitle(context),
              verticalSpace(10.h),
              _buildImages(context, data),
              verticalSpace(10.h),
              _buildTimeDate(context, data),
              verticalSpace(10.h),
              _buildAddress(context, data),
              verticalSpace(10.h),
              _buildMap(data),
              verticalSpace(10.h),
              _buildDetails(context, data),
            ],
          );
        }),
      ),
    );
  }

  /// 🔹 العنوان الرئيسي
  Widget _buildTitle(BuildContext context) {
    return Text(
      context.adSummary,
      textAlign: TextAlign.start,
      maxLines: 1,
      style: context.textStyles.titleLarge.bold.copyWith(
        color: context.colorsCustom.TextPrimary,
        fontSize: 20.sp,
      ),
    );
  }

  /// 🔹 الصور
  Widget _buildImages(BuildContext context, dynamic data) {
    return ImageListViewBuilderWidget(
      context,
      imagesLen: data.images?.length ?? 0,
      imagesItem: data.images ?? [],
    );
  }

  /// 🔹 الوقت والتاريخ
  Widget _buildTimeDate(BuildContext context, dynamic data) {
    return TimeDateWidget(
      context,
      data.date ?? '',
      data.times?.length ?? 0,
      data.times ?? [],
      orderDataController,
    );
  }

  /// 🔹 العنوان والاستلام
  Widget _buildAddress(BuildContext context, dynamic data) {
    return AddressWidget(
      isShow: false,
      fromLng: data.fromLng ?? '',
      fromLat: data.fromLat ?? '',
      toLat: data.toLat ?? '',
      toLng: data.toLng ?? '',
      isShowMet: data.receiptMethod != null,
      from: data.from ?? '',
      fromAddress: data.fromAddress ?? '',
      helpers: '${data.helpers ?? ''}',
      receiptMethodDec: data.receiptMethod?.description ?? '',
      receiptMethodImage: data.receiptMethod?.image ?? '',
      receiptMethodTitle: data.receiptMethod?.title ?? '',
      sizeTitle: data.sizeTitle ?? '',
      to: data.to ?? '',
      toAddress: data.toAddress ?? '',
      orderDataController: orderDataController,
    );
  }

  /// 🔹 الخريطة
  Widget _buildMap(dynamic data) {
    return MapWidget(
      fromAddress: data.fromAddress ?? '',
      fromLat: data.fromLat ?? '',
      fromLng: data.fromLng ?? '',
      toAddress: data.toAddress ?? '',
      toLat: data.toLat ?? '',
      toLng: data.toLng ?? '',
    );
  }

  /// 🔹 تفاصيل الإعلان
  Widget _buildDetails(BuildContext context, dynamic data) {
    return DetColumnWidget(context, controller: data);
  }

  /// 🔹 زر الحفظ
  Widget _buildSaveButton(BuildContext context) {
    return Obx(() {
      return AppLoadingButton(
        text: context.postTheAd,
        onPressed: () async {
          await _controller.confirmOrders();
        },
        isLoading: _controller.isButtonPressed.value,
        isEnabled: !_controller.isButtonPressed.value,
        isWhiteProgress: true,
      );
    });
  }
}
