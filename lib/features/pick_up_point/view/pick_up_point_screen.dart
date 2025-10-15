import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';
import '../../../../core/widgets/def_app_bar_widget.dart';
import '../../../../features/pick_up_point/widgets/bottom_saved_addresses_widget.dart';
import '../../../../features/pick_up_point/widgets/top_text_widget.dart';
import '../../../core/helpers/constants.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_address_controller.dart';
import '../../add_a_delivery_address/widgets/address_info_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';

class PickUpPointScreen extends StatelessWidget {
  final String page;
  final bool isAppBar;
  final dynamic pageArgs;

  PickUpPointScreen({
    super.key,
    required this.page,
    required this.isAppBar,
    this.pageArgs,
  });

  factory PickUpPointScreen.fromRoute() {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    return PickUpPointScreen(
      page: args['page'] ?? '',
      pageArgs: args['pageArgs'],
      isAppBar: args['isAppBar'] ?? true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _addAddressCtrl = Get.find<AddADeliveryAddressController>();
    final _savedAddressesCtrl = Get.find<SavedDeliveryAddressesController>();
    final _orderCtrl = Get.find<OrderDataController>();

    // تحميل العناوين المحفوظة عند وجود AppBar
    if (isAppBar) _savedAddressesCtrl.fetchAddresses();

    // الاستماع لتغير موقع المستخدم
    _addAddressCtrl.locationName.listen((location) async {
      if (location.isEmpty) return;
      final result = await Get.toNamed(page, arguments: pageArgs);
      if (result == null) return;

      // تحديث بيانات OrderDataController و AddADeliveryAddressController
      final lat = result[AppConstants.lat];
      final lng = result[AppConstants.lng];
      final name = result[AppConstants.placeName];

      if (isAppBar) {
        _orderCtrl
          ..setFromLat(lat)
          ..setFromLng(lng)
          ..setFromAddress(name);
      } else {
        _orderCtrl
          ..setToLat(lat)
          ..setToLng(lng)
          ..setToAddress(name);
      }

      _addAddressCtrl.updateLocation(lat, lng, name);
    });

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: isAppBar
          ? CustomAppBarWidget(
              context,
              indexColor1: 0,
              indexColor2: 1,
              indexColor3: 0,
              indexColor4: 0,
              indexColor5: 0,
            )
          : DefAppBarWidget(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTextWidget(
              context,
              Title: isAppBar ? context.receiptPoint : context.deliveryPoint,
              SubTitle: context.myCurrentLocation,
              isShow: true,
            ),
            verticalSpace(10.h),
            buildLocationButton(context, _addAddressCtrl, isAppBar: isAppBar),
            verticalSpace(10.h),
            BottomSavedAddressesWidget(
              context,
              isAppBar: isAppBar,
              orderDataController: _orderCtrl,
              savedDeliveryAddressesController: _savedAddressesCtrl,
              GetScreen: () {
                if (page.isNotEmpty) Get.toNamed(page, arguments: pageArgs);
              },
            ),
          ],
        ),
      ),
    );
  }
}
