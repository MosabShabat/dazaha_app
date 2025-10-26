import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';

// import '../../../../features/my_ads/controller/transportation_and_delivery_controller.dart';
// import '../../document/controller/document_controller.dart';
// import '../../wallet/controller/wallet_controller.dart';
Widget FilterGrideViewWidget(
  BuildContext context, {
  required List<String> ListText,
  required RxInt selectedIndex,
  required Function(int) onTapSel,
}) {
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
        final isSelected = selectedIndex.value == index;
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
          onTap: () => onTapSel(index),
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
