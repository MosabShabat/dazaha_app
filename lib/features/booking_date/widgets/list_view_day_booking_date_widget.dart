import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/booking_date/controller/booking_date_controller.dart';

Widget ListViewDayBookingDateWidget({required BuildContext context}) {
  final BookingDateController controller = Get.put(BookingDateController());

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.chooseTheDay,
          textAlign: TextAlign.start,
          maxLines: 1,
          style: context.textStyles.titleMedium.medium.copyWith(
            color: context.colorsCustom.TextPrimary,
          ),
        ),

        verticalSpace(10.h),
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Obx(() {
              final isSelected = controller.selectedIndex2.value == index;
              return GestureDetector(
                onTap: () {
                  controller.changeSelect2(index);
                  print(index);
                },
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child:
                      Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '27',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: context.textStyles.bodySmall.bold
                                    .copyWith(
                                      color: isSelected
                                          ? context
                                                .colorsCustom
                                                .TealGreenSecondary
                                          : context.colorsCustom.TextPrimary,
                                    ),
                              ),
                              Text(
                                'الخميس',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: context.textStyles.bodySmall.bold
                                    .copyWith(
                                      color: isSelected
                                          ? context
                                                .colorsCustom
                                                .TealGreenSecondary
                                          : context.colorsCustom.TextPrimary,
                                    ),
                              ),
                            ],
                          ).box
                          .width(60.w)
                          .height(0.1.sh)
                          .color(
                            isSelected
                                ? context.colorsCustom.TealGreenSecondary
                                      .withOpacity(0.1)
                                : context.colorsCustom.CardBackgroundLightGray,
                          )
                          .border(
                            width: 1,
                            color: isSelected
                                ? context.colorsCustom.TealGreenSecondary
                                : context.colorsCustom.CardBackgroundLightGray,
                          )
                          .rounded
                          .margin(EdgeInsetsGeometry.symmetric(horizontal: 5.w))
                          .make(),
                ),
              );
            });
          },
        ).box.width(Width).height(0.1.sh).make(),
      ],
    ),
  );
}
