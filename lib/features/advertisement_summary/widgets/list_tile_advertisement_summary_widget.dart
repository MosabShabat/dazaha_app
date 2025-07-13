import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget ListTileAdvertisementSummaryWidget(
  BuildContext context, {
  required img,
  required title,
  required subTitle,
  required isShow,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(
        img,
        width: 30.w,
        height: 30.w,
      ).box.padding(EdgeInsetsGeometry.only(top: 8.h)).make(),
      horizontalSpace(5.w),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isShow ? Container() : verticalSpace(8.h),
          Text(
            '${title}',
            textAlign: TextAlign.start,
            style: context.textStyles.bodyMedium.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          verticalSpace(5.h),
          isShow
              ? Text(
                  '${subTitle}',
                  textAlign: TextAlign.start,
                  style: context.textStyles.bodySmall.regular.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                )
              : Container(),
          // verticalSpace(10.h),
        ],
      ),
    ],
  ).box.width(Width).padding(EdgeInsetsGeometry.only(bottom: 10.h)).make();
  // ListTile(
  //   contentPadding: EdgeInsetsGeometry.all(0),
  //   leading: SvgPicture.asset(img),
  //   title: Text(
  //     '${title}',
  //     textAlign: TextAlign.start,
  //     maxLines: 1,
  //     style: context.textStyles.bodyMedium.medium.copyWith(
  //       color: context.colorsCustom.TextPrimary,
  //     ),
  //   ),

  //   subtitle: isShow
  //       ? Text(
  //           '${subTitle}',
  //           textAlign: TextAlign.start,
  //           maxLines: 1,
  //           style: context.textStyles.bodySmall.regular.copyWith(
  //             color: context.colorsCustom.TextPrimary,
  //           ),
  //         )
  //       : Container(),
  // );
}
