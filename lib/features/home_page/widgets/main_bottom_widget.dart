import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/home_page/controller/home_page_controller.dart';

Widget mainBottomWidget(
  BuildContext context, {
  required backGroundColor,
  required img,
  required text,
  required textColor,
  required fontFamily,
  required fontSize,
  required CircleAvatarRadius,
  required fontWeight,
}) {
  final HomePageController controller = Get.put(HomePageController());

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: List.generate(ListImagesHome.length, (index) {
      return GestureDetector(
        onTap: () {
          controller.selectedTab.value = index;
          // controller.changeTab(index);
          print(index);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: backGroundColor, // Unselected color
              radius: CircleAvatarRadius,
              child: SvgPicture.asset(img[index], width: 40.w, height: 40.w),
            ),
            verticalSpace(10.h),
            Container(
              width: 60.w,
              child: Column(
                children: [
                  Text(
                    Localizations.localeOf(context).languageCode == "ar"
                        ? text[index] // Arabic: full text
                        : "${text[index].split(' ').first}...", // English: first word + dots
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    style: context.textStyles.bodySmall.copyWith(
                      color: textColor,
                      fontFamily: fontFamily,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }),
  );
}
