import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/custom_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/pick_up_point/widgets/top_text_widget.dart';
import 'package:dazaha_app/features/price_details/widgets/in_put_price_widget.dart';
import 'package:dazaha_app/features/price_details/widgets/info_price_widget.dart';
import 'package:dazaha_app/features/price_details/widgets/price_box_widget.dart';

class PriceDetailsScreen extends StatelessWidget {
  final dynamic Page;
  const PriceDetailsScreen({super.key, required this.Page});

  factory PriceDetailsScreen.fromRoute() {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    return PriceDetailsScreen(Page: args['page']);
  }

  @override
  Widget build(BuildContext context) {
    print('666666666666 ${Page} 7777777777777777');
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: CustomAppBarWidget(
        context,
        indexColor1: 0,
        indexColor2: 1,
        indexColor3: 2,
        indexColor4: 3,
        indexColor5: 4,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        context,
        text: context.continuation,
        GetScreen: () {
          Get.toNamed(Page);
        },
      ),
      body: GeneralScreenWidget(
        context,
        wid: [
          TopTextWidget(
            context,
            Title: context.priceDetails,
            SubTitle: context.ourPriceEstimate,
          ),
          verticalSpace(20.h),
          PriceBoxWidget(context),
          verticalSpace(20.h),
          InPutPriceWidget(context),
          verticalSpace(20.h),
          InfoPriceWidget(context),
        ],
      ),
    );
  }
}
