import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/my_ads_details/widgets/jagged_edge_painter_widget.dart';
import 'all_data_pay_ment_widget.dart';
import '../../../core/network/models/orders/my_order_details.dart';

Widget InvoiceBoxWidget(BuildContext context, Payment payMentInfo) {
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
              AllDataPayMentWidget(context, payMentInfo),
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
