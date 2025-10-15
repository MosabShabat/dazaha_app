import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../controller/select_store_name_controller.dart';
import 'center_icon_widget.dart';

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
          '${controller.counters[indexItem]}',
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
