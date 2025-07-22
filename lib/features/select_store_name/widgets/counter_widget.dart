import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/select_store_name/controller/select_store_name_controller.dart';
import 'package:dazaha_app/features/select_store_name/widgets/center_icon_widget.dart';
import '../../../../core/constant/exports_libraries.dart';

Widget CounterWidget(BuildContext context, {required int indexItem}) {
  final controller = Get.find<SelectStoreNameController>();

  return Obx(
    () => Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CenterIconWidget(
          context,
          icon: Icons.add,
          onTap: () => controller.increment(indexItem),
        ),
        Text(
          '${controller.counters[indexItem].value}',
          style: context.textStyles.labelMedium.medium.copyWith(
            color: context.colorsCustom.TextPrimary,
          ),
        ).box.padding(EdgeInsets.symmetric(horizontal: 12.w)).make(),
        CenterIconWidget(
          context,
          icon: Icons.remove,
          onTap: () => controller.decrement(indexItem),
        ),
      ],
    ),
  );
}
