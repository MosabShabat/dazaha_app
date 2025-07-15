import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/def_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/add_a_delivery_address/widgets/address_info_widget.dart';
import 'package:dazaha_app/features/pick_up_point/widgets/top_text_widget.dart';

class AddADeliveryAddressScreen extends StatelessWidget {
  const AddADeliveryAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DefAppBarWidget(context),
      bottomNavigationBar: BottomNavigationBarWidget(
        text: context.saveAddress,
        context,
        GetScreen: () {
          Get.back();
        },
      ),
      body: GeneralScreenWidget(
        context,
        wid: [
          TopTextWidget(context, Title: context.addAddress, SubTitle: ''),
          AddressInfoWidget(context),
        ],
      ),
    );
  }
}
