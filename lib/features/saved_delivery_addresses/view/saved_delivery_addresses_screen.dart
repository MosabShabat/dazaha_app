import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/add_addresses_widget.dart';
import '../../../../core/widgets/general_screen_widget.dart';
import '../../../core/widgets/app_empty_data/empty_addresses.dart';
import '../../../core/widgets/app_shimmers/addresses_shimmer_list.dart';
import '../../user_info/widgets/user_info_app_bar_widget.dart';
import '../controller/saved_delivery_addresses_controller.dart';
import '../widgets/add_loc_list_view_widget.dart';

class SavedDeliveryAddressesScreen extends StatelessWidget {
  SavedDeliveryAddressesScreen({super.key});

  final SavedDeliveryAddressesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.fetchAddresses(); // جلب البيانات عند فتح الشاشة

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        Height: Width * 0.25,
        context,
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.deliveryAddresses,
              style: context.textStyles.bodyLarge.bold.copyWith(
                color: context.colorsCustom.TextPrimary,
                fontSize: 20.sp,
              ),
            ),
            AddAddressesWidget(
              context,
              isBlack: true,
              onTap: () async {
                final result = await Get.toNamed(Routes.addCusLoacScreen);
                if (result == true) {
                  controller
                      .fetchAddresses(); // إعادة تحميل العناوين بعد الإضافة
                }
              },
            ),
          ],
        ),
      ),
      body: GeneralScreenWidget(
        context,
        wid: [
          Obx(() {
            if (controller.isLoading.value) {
              return addressListShimmer(
                context,
                false,
              ); // عرض shimmer أثناء التحميل
            } else if (controller.addresses.isEmpty) {
              return EmptyAddresses(context); // عرض رسالة عدم وجود بيانات
            } else {
              return AddLocListViewWidget(
                context,
                controller,
              ); // عرض قائمة العناوين
            }
          }),
        ],
      ),
    );
  }
}
