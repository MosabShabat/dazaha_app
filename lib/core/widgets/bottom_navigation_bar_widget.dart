import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget BottomNavigationBarWidget(
  BuildContext context, {
  required GetScreen,
  required text,
  horizontalPadding,
}) {
  return GeneralBottomAppWidget(context, text: text, onTap: GetScreen).box
      .padding(
        EdgeInsetsGeometry.symmetric(
          horizontal: horizontalPadding == null ? 16.w : horizontalPadding,
          vertical: 20.h,
        ),
      )
      .make();
}
