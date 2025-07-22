import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
// import 'package:dazaha_app/features/home_page/controller/home_page_controller.dart';

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
  required mainAxisAlignment,
  List<VoidCallback>? onTapList, // ✅ make it nullable & optional
}) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: List.generate(ListImagesHome.length, (index) {
      return GestureDetector(
        onTap: onTapList != null && index < onTapList.length
            ? onTapList[index]
            : null, // ✅ handle null gracefully
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: backGroundColor,
              radius: CircleAvatarRadius,
              child: SvgPicture.asset(img[index], width: 40.w, height: 40.w),
            ),
            verticalSpace(10.h),
            Text(
              // Localizations.localeOf(context).languageCode == "ar"
              //     ? text[index]
              //     :
              "${text[index]}",
              maxLines: 1,
              textAlign: TextAlign.center,
              style: context.textStyles.bodySmall.copyWith(
                color: textColor,
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ).box.width(77.w).make(),
          ],
        ),
      );
    }),
  );
}
