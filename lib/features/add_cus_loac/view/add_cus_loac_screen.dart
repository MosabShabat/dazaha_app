import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/add_a_delivery_address/widgets/address_info_widget.dart';
import 'package:dazaha_app/features/user_info/widgets/user_info_app_bar_widget.dart';

class AddCusLoacScreen extends StatelessWidget {
  const AddCusLoacScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        Height:  Width * 0.25,
        context,
        widget: Text(
          context.addAddress,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        text: context.saveAddress,
        context,
        GetScreen: () {
          Get.back();
        },
      ),
      body: GeneralScreenWidget(context, wid: [AddressInfoWidget(context)]),
    );
  }
}
