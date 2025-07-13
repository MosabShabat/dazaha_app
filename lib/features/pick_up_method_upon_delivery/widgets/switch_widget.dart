  import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/pick_up_method_upon_delivery/widgets/switch_row_widget.dart';

Widget SwitchWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.extra,
          textAlign: TextAlign.start,
          maxLines: 1,
          style: context.textStyles.bodyLarge.medium.copyWith(
            color: context.colorsCustom.TextPrimary,
          ),
        ),
        verticalSpace(20.h),
        SwitchRowWidget(context: context),
      ],
    );
  }