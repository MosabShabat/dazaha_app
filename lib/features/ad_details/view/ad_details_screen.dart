import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:dazaha_app/core/routes/routes.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/custom_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/ad_details/widgets/middle_custom_widget.dart';
import 'package:dazaha_app/features/ad_details/widgets/switch_det_widget.dart';
import 'package:dazaha_app/features/ad_details/widgets/top_text_felids_widget.dart';
import 'package:dazaha_app/features/pick_up_point/widgets/top_text_widget.dart';
// import 'package:dazaha_app/features/price_details/view/price_details_screen.dart';

class AdDetailsScreen extends StatelessWidget {
  final dynamic page;
  final bool isSwitchShow;
  const AdDetailsScreen({
    super.key,
    required this.isSwitchShow,
    required this.page,
  });
  // factory AdDetailsScreen.fromRoute() {
  //   final args = Get.arguments as Map<String, dynamic>? ?? {};
  //   return AdDetailsScreen(
  //     page: args['page'],
  //     isSwitchShow: args['isSwitchShow'] ?? true,
  //   );
  // }
  factory AdDetailsScreen.fromRoute() {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    return AdDetailsScreen(
      page: args['page'],
      isSwitchShow: args['isSwitchShow'] ?? true,
    );
  }

  @override
  Widget build(BuildContext context) {
    print('5555555555555555 ${page} 333333333333333');
    print('5555555555555555 ${isSwitchShow} 333333333333333');
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: CustomAppBarWidget(
        context,
        indexColor1: 0,
        indexColor2: 1,
        indexColor3: 2,
        indexColor4: 3,
        indexColor5: 0,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        text: context.continuation,
        context,
        GetScreen: () {
          Get.toNamed(Routes.priceDetailsScreen, arguments: {'page': page});
        },
      ),
      body: GeneralScreenWidget(
        context,
        wid: [
          TopTextWidget(
            context,
            Title: context.adDetails,
            SubTitle: '',
            isShow: true,
          ),
          TopTextFelidsWidget(context),
          MiddleCustomWidget(context),
          SwitchDetWidget(context, isShow: isSwitchShow),
        ],
      ),
    );
  }
}
