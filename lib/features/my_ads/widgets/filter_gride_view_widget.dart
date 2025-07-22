import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/my_ads/controller/transportation_and_delivery_controller.dart';

Widget FilterGrideViewWidget(BuildContext context,{required ListText}) {
  final TransportationAndDeliveryController controller = Get.put(
    TransportationAndDeliveryController(),
  );
  // var ListChooseServiceTitleText = [
  //   context.transportationAndDelivery,
  //   context.buyForMe,
  //   context.removeAndRecycle,
  //   context.dedication,
  // ];
  return GridView.builder(
    shrinkWrap: true,
    itemCount: ListText.length,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 35,
      childAspectRatio: 3 / 1,
    ),
    itemBuilder: (context, index) {
      return Obx(() {
        final isSelected = controller.selectedIndex.value == index;
        return GestureDetector(
          onTap: () {
            controller.changeSelect(index);
          },
          child:
              Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${ListText[index]}',
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: context.textStyles.bodySmall.medium.copyWith(
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
  );
}
