import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/select_store_name/widgets/center_icon_widget.dart';


Widget CounterWidget(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CenterIconWidget(context, icon: Icons.add, onTap: () {}),
      Text(
        '1.0',
        style: context.textStyles.labelMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ).box.padding(EdgeInsetsGeometry.symmetric(horizontal: 12.w)).make(),

      CenterIconWidget(context, icon: Icons.remove, onTap: () {}),
    ],
  );
}
