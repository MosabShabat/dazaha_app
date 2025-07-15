  import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

AppBar ProfileAppBarWidget(BuildContext context) {
    return  AppBar(
      elevation: 0,
      toolbarHeight: 111.h,
      surfaceTintColor: context.colorsCustom.TealGreenSecondary,
      backgroundColor: context.colorsCustom.TealGreenSecondary,
      leading: Text(
        context.profile,
        style: context.textStyles.bodyLarge.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: 20.sp,
        ),
      ),
    );
  }