import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/my_ads_details/controller/my_ads_details_controller.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/grid_icon_text_widget.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/grid_text_widget.dart';

Widget FilTypesGridViewWidget(BuildContext context) {
  return GridView.builder(
    itemCount: 3,
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 3 / 1.2,
    ),
    itemBuilder: (context, index) {
      final MyAdsDetailsController controller = Get.put(
        MyAdsDetailsController(),
      );
      return Obx(() {
        final isSelected = controller.selectedIndex == index;
        final List<Widget> items = [
          GridTextWidget(
            context,
            isSelected: isSelected,
            text: '${context.all}',
          ),
          GridIconTextWidget(
            context,
            icon: AppAssets.svgs.arrow_icon,
            isSelect: isSelected,
            text: '${context.thePrice}',
          ),
          GridIconTextWidget(
            context,
            icon: AppAssets.svgs.star_icon,
            isSelect: isSelected,
            text: '${context.highestRated}',
          ),
        ];
        return GestureDetector(
          onTap: () {
            controller.changeSelect(index);
          },
          child:
              Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [items[index]],
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
