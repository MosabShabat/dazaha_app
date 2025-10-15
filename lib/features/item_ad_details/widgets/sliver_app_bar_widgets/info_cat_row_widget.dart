import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import 'sle_col_text_widget.dart';

Widget InfoCatRowWidget(
  BuildContext context, {
  required price,
  required distance,
}) {
  return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SleColTextWidget(
            context,
            title: context.askingPrice,
            subTitle: price,
          ),
          SleColTextWidget(
            context,
            title: context.distance,
            subTitle: '${distance} ${context.km}',
          ),
        ],
      ).box.alignBottomCenter
      .padding(EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 10.h))
      .make();
}
