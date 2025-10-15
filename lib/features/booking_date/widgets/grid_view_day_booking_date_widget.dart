import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/booking_date/controller/booking_date_controller.dart';

Widget GridViewDayBookingDateWidget(
  BuildContext context, {
  required BookingDateController controller,
}) {
  return Obx(() {
    return GridView.builder(
      itemCount: controller.availableTimes.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 6,
        mainAxisSpacing: 8,
        childAspectRatio: 1.8 / 0.9,
      ),
      itemBuilder: (context, index) {
        final timeData = controller.availableTimes[index];
        return Obx(() {
          final isSelected = controller.selectedSlots.contains(timeData.uuid);

          return GestureDetector(
            onTap: () => controller.toggleSlot(timeData.uuid!),
            child:
                Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${(timeData.from ?? '')} - ${(timeData.to ?? '')}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: context.textStyles.bodySmall.regular.copyWith(
                            color: isSelected
                                ? context.colorsCustom.TealGreenSecondary
                                : context.colorsCustom.TextPrimary,
                          ),
                        ),
                      ],
                    ).box.rounded
                    .border(
                      width: 1,
                      color: isSelected
                          ? context.colorsCustom.TealGreenSecondary
                          : context.colorsCustom.CardBackgroundLightGray,
                    )
                    .color(
                      isSelected
                          ? context.colorsCustom.TealGreenSecondary.withOpacity(
                              0.1,
                            )
                          : context.colorsCustom.CardBackgroundLightGray,
                    )
                    .make(),
          );
        });
      },
    ).box.width(Width).height(0.48.sh).make();
  });
}
