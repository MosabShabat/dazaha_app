import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/item_ad_details/widgets/sliver_app_bar_widgets/sle_col_text_widget.dart'
    show SleColTextWidget;

Widget InfoCatRowWidget(BuildContext context) {
  return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SleColTextWidget(
            context,
            title: 'السعر المطلوب',
            subTitle: '10,000 د.ع',
          ),
          SleColTextWidget(context, title: 'المسافة', subTitle: '1.5 كم'),
        ],
      ).box.alignBottomCenter
      .padding(EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 10.h))
      .make();
}
