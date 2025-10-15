import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/my_ads_details/controller/my_ads_details_controller.dart';
import '../../../../features/my_ads_details/widgets/grid_icon_text_widget.dart';
import '../../../../features/my_ads_details/widgets/grid_text_widget.dart';

Widget FilTypesGridViewWidget(BuildContext context) {
  final controller = Get.find<MyAdsDetailsController>();

  final items = [
    (bool isSelected) =>
        GridTextWidget(context, isSelected: isSelected, text: context.all),
    (bool isSelected) => GridIconTextWidget(
      context,
      icon: AppAssets.svgs.arrow_icon,
      isSelect: isSelected,
      text: context.thePrice,
    ),
    (bool isSelected) => GridIconTextWidget(
      context,
      icon: AppAssets.svgs.star_icon,
      isSelect: isSelected,
      text: context.highestRated,
    ),
  ];

  return GridView.builder(
    itemCount: items.length,
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 3 / 1.2,
    ),
    itemBuilder: (_, index) {
      return Obx(() {
        final isSelected = controller.selectedIndex == index;

        return GestureDetector(
          onTap: () => controller.changeSelect(index),
          child:
              Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [items[index](isSelected)],
                  ).box
                  .customRounded(BorderRadiusGeometry.circular(10.r))
                  .border(
                    width: 1,
                    color: isSelected
                        ? context.colorsCustom.TealGreenSecondary
                        : context.colorsCustom.CardBorder,
                  )
                  .color(context.colorsCustom.surfacePrimaryWhite)
                  .make(),
        );
      });
    },
  );
}
