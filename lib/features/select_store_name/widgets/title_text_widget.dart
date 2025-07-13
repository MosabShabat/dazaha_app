  import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget TitleTextWidget(int index, BuildContext context) {
    return Text(
      '${index + 1}.  ${context.writeTheNameOfTheItemEgTomatoBreadSoap}',
      style: context.textStyles.bodySmall.regular.copyWith(
        color: context.colorsCustom.TextSecondary,
        fontSize: 12,
      ),
    );
  }