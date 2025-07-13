import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/list_tale_circle_avatar_widget.dart';
import 'package:dazaha_app/features/ad_details/controller/ad_details_controller.dart';

Widget ListViewAdDetailsWidget({required BuildContext context}) {
  var ListTextListViewAdDetails = [
    context.small,
    context.mediumText,
    context.large,
    context.aLotOfItems,
  ];
  final AdDetailsController controller = Get.put(AdDetailsController());
  //AdDetailsController
  return Obx(() {
    return SizedBox(
      height: Width * 0.26,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(4, (index) {
          final isSelected = controller.selectedIndex.value == index;

          return GestureDetector(
            onTap: () {
              controller.changeSelect(index);
              print(index);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                      children: [
                        SvgPicture.asset(
                          ListImagesListViewAdDetails[index],
                          width: 70.w,
                          height: 70.w,
                        ),
                        isSelected
                            ? IconCircleAvatarWidget(
                                backGroundColor:
                                    context.colorsCustom.TealGreenSecondary,
                                sizeCircleAvatar: 8.w,
                                icon: Icons.done,
                                sizIcon: 12.w,
                                colorIcon:
                                    context.colorsCustom.surfacePrimaryWhite,
                              ).box.make().positioned(
                                left:
                                    Localizations.localeOf(
                                          context,
                                        ).languageCode ==
                                        "ar"
                                    ? 0.w
                                    : null,
                                right:
                                    Localizations.localeOf(
                                          context,
                                        ).languageCode !=
                                        "ar"
                                    ? 0.w
                                    : null,
                              )
                            : Container(),
                      ],
                    ).box
                    // .width(72.w)
                    .color(context.colorsCustom.surfacePrimaryWhite)
                    .border(
                      width: 1,
                      color: isSelected
                          ? context.colorsCustom.TealGreenSecondary
                          : context.colorsCustom.CardBorder,
                    )
                    .rounded
                    .padding(
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
                    )
                    .margin(EdgeInsets.symmetric(horizontal: 5.w))
                    // .height(60.h)
                    .make(),
                verticalSpace(5.h),
                Text(
                  ListTextListViewAdDetails[index],
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: context.textStyles.bodySmall.regular.copyWith(
                    color: isSelected
                        ? context.colorsCustom.TealGreenSecondary
                        : context.colorsCustom.TextPrimary,
                  ),
                ),
              ],
            ).box.width(90.w).make(),
          );
        }),
      ),
    );
  });
}
