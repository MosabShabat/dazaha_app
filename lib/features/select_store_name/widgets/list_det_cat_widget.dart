import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/select_store_name/controller/select_store_name_controller.dart';
import 'package:dazaha_app/features/select_store_name/widgets/counter_widget.dart';
import 'package:dazaha_app/features/select_store_name/widgets/delete_widget.dart';
import 'package:dazaha_app/features/select_store_name/widgets/tap_bar_widget.dart';
import 'package:dazaha_app/features/select_store_name/widgets/title_text_widget.dart';

Widget ListDetCatWidget() {
  final controller = Get.put(SelectStoreNameController());
  controller.initializeCounters(3);

  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: 3,
    itemBuilder: (context, index) {
      return Stack(
        children: [
          Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWidget(index, context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CounterWidget(context, indexItem: index),
                      TapBarWidget(context),
                    ],
                  ),
                ],
              ).box
              .height(Width * 0.3)
              .border(color: context.colorsCustom.CardBorder)
              .rounded
              .padding(EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w))
              .margin(EdgeInsets.symmetric(vertical: 10.h))
              .make(),
          DeleteWidget(context),
        ],
      );
    },
  );
}
