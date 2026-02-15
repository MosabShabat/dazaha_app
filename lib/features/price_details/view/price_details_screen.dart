import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/custom_app_bar_widget.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../../features/choose_the_service/controller/order_data_controller.dart';
import '../../../features/pick_up_point/widgets/top_text_widget.dart';
import '../../../features/price_details/widgets/in_put_price_widget.dart';
import '../../../features/price_details/widgets/info_price_widget.dart';
// import '../../../features/price_details/widgets/price_box_widget.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../controller/price_details_controller.dart';

class PriceDetailsScreen extends StatelessWidget {
  final dynamic page;
  const PriceDetailsScreen({super.key, required this.page});

  factory PriceDetailsScreen.fromRoute() {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    return PriceDetailsScreen(page: args['page']);
  }

  @override
  Widget build(BuildContext context) {
    final priceController = Get.find<PriceDetailsController>();
    final orderController = Get.find<OrderDataController>();

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: CustomAppBarWidget(
        context,
        indexColor1: 0,
        indexColor2: 1,
        indexColor3: 2,
        indexColor4: 3,
        indexColor5: 4,
      ),
      bottomNavigationBar: SafeArea(
        child: _saveButton(
          context,
          priceController,
          page,
        ).paddingSymmetric(horizontal: 16.w, vertical: 20.h),
      ),
      body: GeneralScreenWidget(
        context,
        wid: [
          TopTextWidget(
            context,
            Title: context.priceDetails,
            SubTitle: '',
            isShow: true,
          ),
          // verticalSpace(20.h),
          // PriceBoxWidget(
          //   context,
          //   expectPrice:
          //       '${orderController.exceptPrice.value} ${orderController.currencyVar.value}',
          // ),
          verticalSpace(10.h),
          InPutPriceWidget(
            context,
            isShow: true,
            controller: priceController.priceController,
            currency: orderController.currencyVar.value,
            doneController: priceController.doneController, // ⭐ هنا
          ),
          verticalSpace(20.h),
          InfoPriceWidget(context),
        ],
      ),
    );
  }

  Widget _saveButton(
    BuildContext context,
    PriceDetailsController controller,
    dynamic page,
  ) {
    return Obx(
      () => AppLoadingButton(
        text: context.continuation,

        onPressed: () async {
          controller.submitPrice(context, page);
        },
        isLoading: controller.isButtonPressed.value,
        isEnabled: !controller.isButtonPressed.value,

        isWhiteProgress: true,
      ),
    );
  }
}
