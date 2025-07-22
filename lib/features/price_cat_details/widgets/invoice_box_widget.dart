import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/jagged_edge_painter_widget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/all_data_pay_ment_widget.dart';

Widget InvoiceBoxWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.invoice,
        textAlign: TextAlign.start,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(10.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Container(
          color: context.colorsCustom.surfacePrimaryWhite,
          height: 380.h,
          child: Stack(
            children: [
              AllDataPayMentWidget(context),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 6.h,
                child: CustomPaint(
                  painter: JaggedEdgePainter(
                    context.colorsCustom.CardBackgroundLightGray,
                    isTop: true,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 6.h,
                child: CustomPaint(
                  painter: JaggedEdgePainter(
                    context.colorsCustom.CardBackgroundLightGray,
                    isTop: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      verticalSpace(20.h),
    ],
  ).box.color(context.colorsCustom.surfacePrimaryWhite).make();
}
