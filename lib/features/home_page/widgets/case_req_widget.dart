import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/helpers/theme_exports.dart';

import '../controller/home_page_controller.dart';

Widget CaseReqWidget(
  BuildContext context, {
  required HomePageController controller,
  required bool isOrder,
}) {
  final currentReq = isOrder
      ? controller.homeModel.value?.currentOrder!
      : controller.homeModel.value?.currentOffer!;
  print('currentReq statusText : ${currentReq!.statusText}');
  print('currentReq uuid : ${currentReq.uuid ?? ''}');
  print('currentReq title : ${currentReq.title ?? ''}');
  print('currentReq serviceUuid : ${currentReq.serviceUuid ?? ''}');
  print('currentReq image : ${currentReq.image ?? ''}');
  print('currentReq status : ${currentReq.status ?? ''}');
  print('currentReq time : ${currentReq.time ?? ''}');
  print('currentReq orderId : ${currentReq.orderId ?? ''}');
  print('currentReq date : ${currentReq.date ?? ''}');
  print('currentReq timeAgo : ${currentReq.timeAgo ?? ''}');

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        '${currentReq.timeAgo ?? ''} ',
        textAlign: TextAlign.start,
        style: context.textStyles.bodySmall.regular.copyWith(
          color: context.colorsCustom.TextSecondary,
          fontSize: 12.sp,
        ),
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 0.04.sh,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: currentReq.status == 'receiving_offers'
                  ? context.colorsCustom.LightBlue
                  : currentReq.status == 'in_progress'
                  ? context.colorsCustom.LightOrange
                  : context.colorsCustom.LightGrey,
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
            child: Center(
              child: Text(
                '${currentReq.statusText ?? ''}',
                textAlign: TextAlign.center,
                style: context.textStyles.bodySmall.medium.copyWith(
                  color: currentReq.status == 'receiving_offers'
                      ? context.colorsCustom.BluePrimary
                      : currentReq.status == 'in_progress'
                      ? Colors.orange
                      : Colors.green,
                  // context.colorsCustom.BluePrimary,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
