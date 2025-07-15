import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/def_app_bar_widget.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/tob_column_widget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/captain_info_widget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/invoice_box_widget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/pay_mth_widget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/place_col_widget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/t_d_del_widget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/track_your_flight_widget.dart';

class PriceCatDetailsScreen extends StatelessWidget {
  const PriceCatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DefAppBarWidget(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TobColumnWidget(context, horizontalPadding: 16.0.w, caseItem: 0),
            Divider(color: context.colorsCustom.CardBorder, thickness: 1),
            verticalSpace(20.h),
            Container(
              color: context.colorsCustom.surfacePrimaryWhite,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TrackYourFlightWidget(context, isShow: true),
                  verticalSpace(20.h),
                  PlaceColWidget(context),
                  verticalSpace(20.h),
                  CaptainInfoWidget(context),
                  verticalSpace(20.h),
                  TDDelWidget(context),
                  verticalSpace(20.h),
                  PayMthWidget(context),
                  verticalSpace(20.h),
                  InvoiceBoxWidget(context),
                  verticalSpace(20.h),
                  GeneralBottomAppWidget(
                    context,
                    text: context.reportAProblem,
                    fontFamily: context.textStyles.bodyLarge.bold.fontFamily,
                    fontWeight: FontWeight.w700,
                    backgroundColorB: context.colorsCustom.LightGrey
                        .withOpacity(0.2),
                    textColorB: context.colorsCustom.TextPrimary,
                    onTap: () {},
                  ),
                  verticalSpace(20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
