import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/home_page/widgets/case_container_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import 'accept_cat_bottom_sheet/accept_bottom_sheet_widget.dart';

Widget PresenterInfoWidget(
  BuildContext context, {
  required String name,
  required String rate,
  required String addedAt,
  required String addedTime,
  required String priceCurr,
  required String uuid,
  required String image,
}) {
  final textPrimary = context.colorsCustom.TextPrimary;
  final textSecondary = context.colorsCustom.TextSecondary;
  final headline = context.textStyles.headlineSmall;
  OrderDataController orderDataController = Get.find();

  Widget buildText(
    String data, {
    bool isMedium = true,
    double? fontSize,
    Color? color,
  }) {
    return Text(
      data,
      style: (isMedium ? headline.medium : headline.regular).copyWith(
        color: color ?? textPrimary,
        fontSize: fontSize,
      ),
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      verticalSpace(5.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildText(name, fontSize: 12.sp),
          buildText(priceCurr, fontSize: 16.sp),
        ],
      ).box.width(250.w).make(),
      verticalSpace(5.h),
      Row(
        children: [
          SvgPicture.asset(AppAssets.svgs.star_bold_icon),
          horizontalSpace(5.w),
          buildText(rate, fontSize: 12.sp),
        ],
      ),
      verticalSpace(10.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildText(
            addedAt,
            isMedium: false,
            fontSize: 12.sp,
            color: textSecondary,
          ),
          CaseContainerWidget(
            context,
            BackGroundColor: context.colorsCustom.TealGreenSecondary,
            height: 31.h,
            text: context.acceptance,
            textColor: context.colorsCustom.ButtonLabelPrimary,
            textSize: 12.sp,
            horizontalPadding: 25.w,
            borderRadius: 8.r,
            colorBorder: context.colorsCustom.TealGreenSecondary,
            onTap: () {
              orderDataController.setItemUuid('${uuid}');
              AcceptBottomSheetWidget(
                context,
                name: name,
                rate: rate,
                addedAt: addedTime,
                priceCurr: priceCurr,
                uuid: uuid,
                image: image,
              );
            },
          ),
        ],
      ).box.width(250.w).make(),
    ],
  );
}
