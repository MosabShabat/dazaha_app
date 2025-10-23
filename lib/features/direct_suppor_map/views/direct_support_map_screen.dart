import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/direct_suppor_map/widgets/down_cont_widget.dart';
import '../../../core/widgets/app_button_back.dart';
import '../../advertisement_summary/widgets/map_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/direct_support_map_controller.dart';

class DirectSupportMapScreen extends StatelessWidget {
  DirectSupportMapScreen({super.key});
  final OrderDataController orderDataController = Get.find();
  final DirectSupportMapController _directSupportMapController = Get.find();

  //DirectSupportMapController

  @override
  Widget build(BuildContext context) {
    final bool isShow = (Get.arguments as Map?)?['isShow'] ?? false;
    final VoidCallback page = (Get.arguments as Map?)?['page'];
    print(orderDataController.fromLat.value);
    print(orderDataController.fromLng.value);
    print(orderDataController.toLat.value);
    print(orderDataController.toLng.value);
    print('++++++++++ $page ++++++++++++');
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Width.w,
            height: Height.h,
            decoration: BoxDecoration(color: context.colorsCustom.BlueBlue),
            child: MapWidget(
              fromAddress: orderDataController.fromAddress.value,
              fromLat: orderDataController.fromLat.value,
              fromLng: orderDataController.fromLng.value,
              toAddress: orderDataController.toAddress.value,
              toLat: orderDataController.toLat.value,
              toLng: orderDataController.toLng.value,
              Height: Height.h,
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: AppButtonBack(context: context),
                ),
                verticalSpace(10.h),
                Spacer(),
                DownContWidget(
                  context,
                  isShow: isShow,
                  page: page,
                  controller: _directSupportMapController,
                  orderDataController: orderDataController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
