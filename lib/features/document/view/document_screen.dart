import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/document/widgets/tab_bar__my_offer_widget.dart';
import 'package:dazaha_app/features/my_ads/widgets/tab_bar_title_widget.dart';
import 'package:dazaha_app/features/my_ads/widgets/top_row_widget.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

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
                      TopRowWidget(
                        context,
                        title: context.myOffers,
                        size: 20.sp,
                        style: context.textStyles.titleLarge.bold.fontFamily,
                        GridList: [
                          context.transportationAndDelivery,
                          context.buyForMe,
                          context.removeAndRecycle,
                          context.dedication,
                        ],
                        subTitle: '${context.ViewYourRequestsByServiceType}',
                      ),
                      verticalSpace(10.h),
                      TabBarTitleWidget(context, secTap: context.myOffers),
                      Flexible(
                        child: TabBarView(
                          children: [
                            TabBarMyOfferWidget(context),
                            TabBarMyOfferWidget(context),
                            TabBarMyOfferWidget(context),
                            TabBarMyOfferWidget(context),
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
