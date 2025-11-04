import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
// import '../../../core/widgets/bottom_navigation_bar_widget.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/def_app_bar_widget.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../pick_up_point/widgets/top_text_widget.dart';
import '../widgets/address_info_widget.dart';

class AddADeliveryAddressScreen extends StatelessWidget {
  AddADeliveryAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isEdit =
        Get.arguments != null && Get.arguments[AppConstants.isEdit] == true;
    final goBackAfterSave = Get.arguments != null
        ? (Get.arguments['goBackAfterSave'] ?? false)
        : false;

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DefAppBarWidget(context),
      body: GeneralScreenWidget(
        context,
        wid: [
          TopTextWidget(
            context,
            Title: isEdit ? context.editAddress : context.addAddress,
            SubTitle: '',
            isShow: true,
          ),
          AddressInfoWidget(
            goBackAfterSave: goBackAfterSave, // <-- هنا
          ),
        ],
      ),
    );
  }
}
