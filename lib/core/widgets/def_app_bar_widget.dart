import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/helpers/theme_exports.dart';

import '../helpers/app_shared_methods.dart';
import '../helpers/constants.dart';
import 'app_button_back.dart';

AppBar DefAppBarWidget(
  BuildContext context, {
  String? routeName,
  String navigationType = AppNavigationType.offNamed,
}) {
  return AppBar(
    surfaceTintColor: context.colorsCustom.surfacePrimaryWhite,
    backgroundColor: context.colorsCustom.surfacePrimaryWhite,
    leading:
        AppButtonBack(
              context: context,
              navigationType: navigationType,
              routeName: routeName,
              paddingLeft: AppSharedMethods.isAppLanguageArabic() ? 0 : 10.w,
              paddingRight: AppSharedMethods.isAppLanguageArabic() ? 10.w : 0,
            ).box
            .width(40.w)
            .height(40.w)
            .customRounded(BorderRadiusGeometry.circular(40.r))
            .padding(EdgeInsetsGeometry.symmetric(horizontal: 8.w))
            .color(context.colorsCustom.surfacePrimaryWhite)
            .make(),
  );
}
