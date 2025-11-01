import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/custom_app_bar_widget.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../../features/ad_details/widgets/middle_custom_widget.dart';
import '../../../features/ad_details/widgets/switch_det_widget.dart';
import '../../../features/ad_details/widgets/top_text_felids_widget.dart';
import '../../../features/choose_the_service/controller/order_data_controller.dart';
import '../../../features/pick_up_point/widgets/top_text_widget.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../controller/ad_details_controller.dart';

class AdDetailsScreen extends StatelessWidget {
  final dynamic page;
  final bool isSwitchShow;

  const AdDetailsScreen({
    super.key,
    required this.isSwitchShow,
    required this.page,
  });

  factory AdDetailsScreen.fromRoute() {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    return AdDetailsScreen(
      page: args['page'],
      isSwitchShow: args['isSwitchShow'] ?? true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AdDetailsController _adController = Get.find();
    final OrderDataController _orderController = Get.find();

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: CustomAppBarWidget(
        context,
        indexColor1: 0,
        indexColor2: 1,
        indexColor3: 2,
        indexColor4: 3,
        indexColor5: 0,
      ),
      body: GeneralScreenWidget(
        context,
        wid: [
          TopTextWidget(
            context,
            Title: context.adDetails,
            SubTitle: '',
            isShow: true,
          ),
          TopTextFelidsWidget(context, adDetailsController: _adController),
          MiddleCustomWidget(context, orderDataController: _orderController),
          SwitchDetWidget(
            context,
            isShow: isSwitchShow,
            orderDataController: _orderController,
          ),
          verticalSpace(50.h),
          _buildSaveButton(context, _adController, _orderController),
        ],
      ),
    );
  }

  Widget _buildSaveButton(
    BuildContext context,
    AdDetailsController controller,
    OrderDataController orderController,
  ) {
    return Obx(() {
      return AppLoadingButton(
        text: context.continuation,
        isLoading: controller.isButtonPressed.value,
        isEnabled: !controller.isButtonPressed.value,
        isWhiteProgress: true,
        onPressed: () async {
          // تحديد الحجم والخدمات المساعدة
          if (controller.selectedIndex.value == 0) {
            orderController.setSizeUuid(controller.sizeMod[0].uuid ?? '');
          }
          if (controller.switchValue.value) {
            if (controller.selectedIndex2.value == 0) {
              orderController.setHelpers('1');
            }
          } else {
            orderController.setHelpers('0');
          }

          // تحديد نوع الطلب
          final serviceUuid = orderController.serviceUuid.value;
          final orderType =
              serviceUuid == '69fb5c27-11ef-4637-986f-ed484b388c7f'
              ? 'type1'
              : serviceUuid == '9cc543c0-793c-43d9-88a6-6e3db6082ef5'
              ? 'type2'
              : 'type3';

          // تنفيذ التحقق والدفع
          controller.validateInput(context, orderType, page);
        },
      );
    });
  }
}
