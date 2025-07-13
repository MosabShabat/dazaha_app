import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/spacing.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';

AppBar CustomAppBarWidget(
  BuildContext context, {
  required indexColor1,
  required indexColor2,
  required indexColor3,
  required indexColor4,
  required indexColor5,
}) {
  return AppBar(
    backgroundColor: context.colorsCustom.surfacePrimaryWhite,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Get.back();
      },
    ),
    actions: [
      SizedBox(
        height: Width * 0.042,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Row().box
                .width(20.w)
                .color(
                  index == indexColor1 ||
                          index == indexColor2 ||
                          index == indexColor3 ||
                          index == indexColor4 ||
                          index == indexColor5
                      ? context.colorsCustom.TealGreenSecondary
                      : context.colorsCustom.CardBorder,
                )
                .rounded
                .margin(
                  EdgeInsetsGeometry.symmetric(horizontal: 2, vertical: 7.h),
                )
                .make();
          },
        ).box.margin(EdgeInsetsGeometry.symmetric(horizontal: 16.w)).make(),
      ),
    ],
  );
}
