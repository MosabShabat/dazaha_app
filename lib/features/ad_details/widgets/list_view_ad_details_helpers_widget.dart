import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/spacing.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:dazaha_app/features/ad_details/controller/ad_details_controller.dart';

Widget ListViewAdDetailsHelpersWidget({required BuildContext context}) {
  final AdDetailsController controller = Get.put(AdDetailsController());
  return SizedBox(
    height: Width * 0.12,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 20,
      itemBuilder: (context, index) {
        //AdDetailsController
        return Obx(() {
          final isSelected = controller.selectedIndex2.value == index;

          return GestureDetector(
            onTap: () {
              controller.changeSelect2(index);
              print(index);
            },
            child:
                Container(
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: context.textStyles.titleMedium.medium.copyWith(
                            color: isSelected
                                ? context.colorsCustom.TealGreenSecondary
                                : context.colorsCustom.TextPrimary,
                          ),
                        ),
                      ),
                    ).box
                    .width(70.w)
                    .color(context.colorsCustom.surfacePrimaryWhite)
                    .border(
                      width: 1,
                      color: isSelected
                          ? context.colorsCustom.TealGreenSecondary
                          : context.colorsCustom.CardBorder,
                    )
                    .rounded
                    .margin(EdgeInsets.symmetric(horizontal: 3.w))
                    .make(),
          );
        });
      },
    ),
  );
}
