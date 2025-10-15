import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/my_ads/controller/transportation_and_delivery_controller.dart';

Widget FilterGrideViewWidget(
  BuildContext context, {
  required List<String> ListText,
}) {
  final TransportationAndDeliveryController controller = Get.find();

  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: ListText.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 35,
      childAspectRatio: 3 / 1,
    ),
    itemBuilder: (_, index) {
      return Obx(() {
        final isSelected = controller.selectedIndex.value == index;
        final color = isSelected
            ? context.colorsCustom.TealGreenSecondary
            : context.colorsCustom.TextPrimary;
        final bgColor = isSelected
            ? context.colorsCustom.TealGreenSecondary.withOpacity(0.1)
            : context.colorsCustom.CardBackgroundLightGray;
        final borderColor = isSelected
            ? context.colorsCustom.TealGreenSecondary
            : context.colorsCustom.CardBackgroundLightGray;

        return GestureDetector(
          onTap: () => controller.changeSelect(index),
          child:
              Center(
                    child: Text(
                      ListText[index],
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: context.textStyles.bodySmall.medium.copyWith(
                        color: color,
                      ),
                    ),
                  ).box.rounded
                  .color(bgColor)
                  .border(width: 1, color: borderColor)
                  .make(),
        );
      });
    },
  );
}
