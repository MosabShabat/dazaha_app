import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../controller/select_store_name_controller.dart';
import 'counter_widget.dart';
import 'delete_widget.dart';
import 'tap_bar_widget.dart';

Widget ListDetCatWidget(BuildContext context) {
  final controller = Get.find<SelectStoreNameController>();

  return Obx(
    () => ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.numOfList.value,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      controller: controller.textControllers[index],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        hintText:
                            '${index + 1}.  ${context.writeTheNameOfTheItemEgTomatoBreadSoap}',
                      ),
                      style: context.textStyles.bodyMedium.copyWith(
                        color: context.colorsCustom.TextPrimary,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CounterWidget(context, indexItem: index),
                        TapBarWidget(context, index: index),
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
            controller.numOfList.value == 1 || index == 0
                ? Container()
                : DeleteWidget(context, index),
          ],
        );
      },
    ),
  );
}
