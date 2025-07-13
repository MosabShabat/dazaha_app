import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/custom_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/def_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/pick_up_point/widgets/bottom_saved_addresses_widget.dart';
import 'package:dazaha_app/features/pick_up_point/widgets/location_text_feld_widget.dart';
import 'package:dazaha_app/features/pick_up_point/widgets/top_text_widget.dart';

class pickUpPointScreen extends StatelessWidget {
  final dynamic page;
  final bool isAppBar;
  final dynamic pageArgs;

  const pickUpPointScreen({
    super.key,
    required this.page,
    required this.isAppBar,
    required this.pageArgs,
  });
  // ✅ Use a factory constructor to receive arguments via Get
  factory pickUpPointScreen.fromRoute() {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    return pickUpPointScreen(
      page: args['page'],
      pageArgs: args['pageArgs'],
      isAppBar: args['isAppBar'] ?? true,
    );
  }
  @override
  Widget build(BuildContext context) {
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
      body: GeneralScreenWidget(
        context,
        wid: [
          TopTextWidget(
            context,
            Title: context.receiptPoint,
            SubTitle: context.myCurrentLocation,
          ),
          verticalSpace(10.h),
          LocationTextFieldWidget(
            context,
            text: 'شارع 10، بغداد',
            textColor: context.colorsCustom.TextPrimary,
            textSize: 12.0.sp,
            textFontFamily: context.textStyles.bodySmall.medium,
          ),
          SizeBox20H,
          BottomSavedAddressesWidget(
            context,
            GetScreen: () {
              if (page != null) {
                Get.toNamed(page, arguments: pageArgs);
              }
            },
            //  () {
            //   Get.toNamed(Routes.pickUpMethodUpOnDeliveryScreen);
            // },
          ),
        ],
      ),
    );
  }
}
