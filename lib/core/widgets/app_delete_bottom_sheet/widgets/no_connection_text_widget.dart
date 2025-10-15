import '../../../constant/exports_widgets.dart';
import '../../../constant/exports_libraries.dart';

Widget NoConnectionTextWidget(BuildContext context) {
  return Center(
    child: Text(
      context.noInternetConnection,
      style: context.textStyles.titleLarge.bold.copyWith(
        color: context.colorsCustom.TextPrimary,
      ),
    ),
  );
}
