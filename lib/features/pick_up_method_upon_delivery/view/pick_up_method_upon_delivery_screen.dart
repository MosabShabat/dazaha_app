import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/custom_app_bar_widget.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../pick_up_point/widgets/top_text_widget.dart';
import '../controller/pick_up_method_upon_delivery_controller.dart';
import '../widgets/list_view_pick_up_method_up_on_delivery_widget.dart';
import '../widgets/switch_widget.dart';

class PickUpMethodUpOnDeliveryScreen extends StatelessWidget {
  PickUpMethodUpOnDeliveryScreen({super.key});

  final OrderDataController _orderCtrl = Get.find();
  final PickUpMethodUponDeliveryController _pickUpCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    print('Service UUID: ${_orderCtrl.serviceUuid.value}');
    print('Service Name: ${_orderCtrl.serviceName.value}');

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: CustomAppBarWidget(
        context,
        indexColor1: 0,
        indexColor2: 1,
        indexColor3: 2,
        indexColor4: 0,
        indexColor5: 0,
      ),
      bottomNavigationBar: SafeArea(child: _buildBottomNav(context)),
      body: SafeArea(
        child: GeneralScreenWidget(
          context,
          wid: [
            TopTextWidget(
              context,
              Title: context.receiptMethod,
              SubTitle: context.location,
              isShow: true,
            ),
            verticalSpace(10.h),
            ListViewPickUpMethodUpOnDeliveryWidget(
              context: context,
              orderDataController: _orderCtrl,
            ),
            verticalSpace(20.h),
            SwitchWidget(context, orderDataController: _orderCtrl),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return GeneralBottomAppWidget(
          context,
          text: context.continuation,
          onTap: () {
            // تعيين طريقة الاستلام حسب الاختيار
            if (_pickUpCtrl.selectedIndex.value == 0) {
              final selectedMethod = _pickUpCtrl.receiptMethods[0];
              _orderCtrl.setReceiptMethodUuid(selectedMethod.uuid ?? '');
            }

            // تعيين إمكانية المساعدة
            _orderCtrl.setCanHelp(_pickUpCtrl.switchValue.value ? '1' : '0');

            // الانتقال إلى شاشة PickUpPoint
            Get.toNamed(
              Routes.pickUpPointScreen,
              arguments: {
                'page': Routes.adDetailsScreen,
                'pageArgs': {
                  'page': Routes.advertisementSummaryScreen,
                  'isSwitchShow': true,
                },
                'isAppBar': false,
              },
            );
          },
        ).box
        .padding(EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h))
        .make();
  }
}
