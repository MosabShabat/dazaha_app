import '../../../core/constant/exports_widgets.dart';
import '../../../features/advertisement_summary/widgets/DateWidget.dart';
import '../../../features/advertisement_summary/widgets/time_column_widget.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

Widget TimeDateWidget(
  BuildContext context,
  date,
  timeLen,
  timeItem,
  OrderDataController orderDataController,
) {
  // تحديد النص بناءً على serviceNumber
  String timeTitle = switch (orderDataController.serviceNumber.value) {
    '0' || '1' => context.convenientTimeForMoving,
    '2' => context.whenIsItAppropriate,
    _ => context.theAppropriateTimeForGifting,
  };

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        timeTitle,
        style: context.textStyles.bodyLarge.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(10.h),
      DateWidget(context, '${date}'),
      verticalSpace(15.h),
      TimeColumnWidget(
        context,
        img: AppAssets.svgs.clock_icon,
        imgText: context.time,
        timeLen: timeLen,
        timeItem: timeItem,
      ),
    ],
  );
}
