import 'package:easy_localization/easy_localization.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/booking_date/controller/booking_date_controller.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

Widget ListViewDayBookingDateWidget({
  required BuildContext context,
  required BookingDateController controller,
  required OrderDataController orderController,
}) {
  return Obx(() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.chooseTheDay,
          textAlign: TextAlign.start,
          style: context.textStyles.titleMedium.medium.copyWith(
            color: context.colorsCustom.TextPrimary,
          ),
        ),
        verticalSpace(10.h),
        SizedBox(
          height: 0.1.sh,
          width: Width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.availableDays.length,
            itemBuilder: (context, index) {
              final day = controller.availableDays[index];
              final isSelected = controller.selectedIndex2.value == index;
              final dayName = DateFormat.EEEE('ar').format(day);
              final color = isSelected
                  ? context.colorsCustom.TealGreenSecondary
                  : context.colorsCustom.TextPrimary;
              final bgColor = isSelected
                  ? context.colorsCustom.TealGreenSecondary.withOpacity(0.1)
                  : context.colorsCustom.CardBackgroundLightGray;

              return GestureDetector(
                onTap: () {
                  controller.changeSelect2(index);
                  orderController.setData(DateFormat('yyyy-MM-dd').format(day));
                },
                child:
                    Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${day.day}',
                              textAlign: TextAlign.center,
                              style: context.textStyles.bodySmall.bold.copyWith(
                                color: color,
                              ),
                            ),
                            Text(
                              dayName,
                              textAlign: TextAlign.center,
                              style: context.textStyles.bodySmall.bold.copyWith(
                                color: color,
                              ),
                            ),
                          ],
                        ).box
                        .width(60.w)
                        .height(0.1.sh)
                        .color(bgColor)
                        .border(
                          width: 1,
                          color: isSelected
                              ? context.colorsCustom.TealGreenSecondary
                              : context.colorsCustom.CardBackgroundLightGray,
                        )
                        .rounded
                        .margin(EdgeInsets.symmetric(horizontal: 5.w))
                        .make(),
              );
            },
          ),
        ),
      ],
    );
  });
}
