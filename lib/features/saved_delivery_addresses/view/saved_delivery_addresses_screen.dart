import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/add_addresses_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/saved_delivery_addresses/widgets/add_loc_list_view_widget.dart';
import 'package:dazaha_app/features/user_info/widgets/user_info_app_bar_widget.dart';

class SavedDeliveryAddressesScreen extends StatelessWidget {
  const SavedDeliveryAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              onTap: () {
                Get.toNamed(Routes.addCusLoacScreen);
              },
            ),
          ],
        ),
      ),
      body: GeneralScreenWidget(context, wid: [AddLocListViewWidget(context)]),
    );
  }
}
