import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../../features/add_a_delivery_address/widgets/address_info_widget.dart';
import '../../../features/user_info/widgets/user_info_app_bar_widget.dart';

import '../../../core/network/utils/api_service.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_repo.dart';

class AddCusLoacScreen extends StatelessWidget {
  AddCusLoacScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddADeliveryRepo(Get.find<ApiService>()));
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        Height: Width * 0.25,
        context,
        widget: Text(
          context.addAddress,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: GeneralScreenWidget(context, wid: [AddressInfoWidget()]),
    );
  }
}
