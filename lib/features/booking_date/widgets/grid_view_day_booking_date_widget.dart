import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/booking_date/controller/booking_date_controller.dart';

Widget GridViewDayBookingDateWidget(BuildContext context) {
  final BookingDateController controller = Get.put(BookingDateController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.chooseTheAppropriateTimeForTransportation,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: context.textStyles.titleMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),

      verticalSpace(5.h),
      Text(
        context.youCanChooseSpecificTimesDuringTheDay,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: context.textStyles.bodyMedium.regular.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),

      verticalSpace(20.h),

      GridView.builder(
        itemCount: 15,
        // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.8 / 0.9,
        ),
        itemBuilder: (context, index) {
          //BookingDateController
          return Obx(() {
            final isSelected = controller.selectedTimeSlots;
            return GestureDetector(
              onTap: () {
                if (isSelected.contains(index)) {
                  isSelected.remove(index);
                } else {
                  controller.changeSelect(index);
                }
                print(controller.selectedTimeSlots);
              },
              child:
                  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '10 - 11 ص',
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: context.textStyles.bodySmall.regular
                                .copyWith(
                                  color: isSelected.contains(index)
                                      ? context.colorsCustom.TealGreenSecondary
                                      : context.colorsCustom.TextPrimary,
                                ),
                          ),
                        ],
                      ).box.rounded
                      .border(
                        width: 1,
                        color: isSelected.contains(index)
                            ? context.colorsCustom.TealGreenSecondary
                            : context.colorsCustom.CardBackgroundLightGray,
                      )
                      .color(
                        isSelected.contains(index)
                            ? context.colorsCustom.TealGreenSecondary
                                  .withOpacity(0.1)
                            : context.colorsCustom.CardBackgroundLightGray,
                      )
                      .make(),
            );
          });
        },
      ).box.width(Width).height(0.48.sh).make(),
      SizedBox(height: 5.h),
    ],
  );
}
