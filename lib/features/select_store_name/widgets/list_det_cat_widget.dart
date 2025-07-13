import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/buy_me/select_store_name/widgets/counter_widget.dart';
import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/select_store_name/widgets/delete_widget.dart';
import 'package:dazaha_app/features/select_store_name/widgets/tap_bar_widget.dart';
import 'package:dazaha_app/features/select_store_name/widgets/title_text_widget.dart';


Widget ListDetCatWidget() {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: 2,
    scrollDirection: Axis.vertical,
    itemBuilder: (context, index) {
      // return Obx(() {
      // controller.initializeCounters(5);

      return Stack(
        children: [
          Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleTextWidget(index, context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [CounterWidget(context), TapBarWidget(context)],
                  ),
                ],
              ).box
              .height(Width * 0.3)
              .border(color: context.colorsCustom.CardBorder)
              .rounded
              .padding(
                EdgeInsetsGeometry.symmetric(vertical: 15.h, horizontal: 10.w),
              )
              .margin(EdgeInsetsGeometry.symmetric(vertical: 10.h))
              .make(),
          DeleteWidget(context),
        ],
      );
      // });
    },
  );
}
