import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/theme_exports.dart';

import '../helpers/app_shared_methods.dart';
import 'app_button_back.dart';

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
    leading: AppButtonBack(
      context: context,
      paddingLeft: AppSharedMethods.isAppLanguageArabic() ? 0 : 10,
      paddingRight: AppSharedMethods.isAppLanguageArabic() ? 10 : 0,
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
