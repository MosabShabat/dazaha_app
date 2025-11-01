import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../../core/widgets/custom_app_bar_widget.dart';
import '../../buy_me/widgets/store_name_row_widget.dart';
import '../widgets/add_new_cat_widget.dart';
import '../widgets/list_det_cat_widget.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_address_controller.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/select_store_name_controller.dart';

class SelectStoreNameScreen extends StatelessWidget {
  SelectStoreNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddADeliveryAddressController aDeliveryAddressController =
        Get.find<AddADeliveryAddressController>();

    OrderDataController orderDataController = Get.find<OrderDataController>();

    SelectStoreNameController selectStoreNameController =
        Get.find<SelectStoreNameController>();

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
      bottomNavigationBar: _buildSaveButton(
        context,
        controller: selectStoreNameController,
      ).paddingSymmetric(horizontal: 16.w, vertical: 20.h),

      body: GeneralScreenWidget(
        context,
        wid: [
          StoreNameRowWidget(
            context,
            text: '${orderDataController.placeName.value}',
            controller: aDeliveryAddressController,
            orderDataController: orderDataController,
          ),
          verticalSpace(20.h),
          ListDetCatWidget(context),
          verticalSpace(20.h),
          AddNewCatWidget(context),
        ],
      ),
    );
  }

  Widget _buildSaveButton(
    BuildContext context, {
    required SelectStoreNameController controller,
  }) {
    return Obx(() {
      return AppLoadingButton(
        text: context.continuation,
        onPressed: () async {
          controller.validationInputData(context);
        },
        isLoading: controller.isButtonPressed.value,
        isEnabled: !controller.isButtonPressed.value,

        isWhiteProgress: true,
      );
    });
  }
}
