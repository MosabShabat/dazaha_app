import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/my_ads/widgets/body_tab_bar_widget.dart';
import 'package:dazaha_app/features/my_ads/widgets/tab_bar_title_widget.dart';
import 'package:dazaha_app/features/my_ads/widgets/top_row_widget.dart';

class TransportationAndDeliveryScreen extends StatelessWidget {
  const TransportationAndDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child:
              Column(
                    children: [
                      TopRowWidget(context),
                      verticalSpace(10.h),
                      TabBarTitleWidget(context),
                      Flexible(
                        child: TabBarView(
                          children: [
                            BodyTabBarWidget(context),
                            BodyTabBarWidget(context),
                            BodyTabBarWidget(context),
                            BodyTabBarWidget(context),
                          ],
                        ),
                      ),
                    ],
                  ).box
                  .width(Width)
                  .padding(EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h))
                  .color(context.colorsCustom.surfacePrimaryWhite)
                  .make(),
        ),
      ),
    );
  }
}
