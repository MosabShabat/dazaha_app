import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/constant/exports_libraries.dart';

Widget NoteWidget(BuildContext context, {required onTap}) {
  return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.svgs.info_circle_icon),
          Column(
            children: [
              Text(
                '${context.writeAnyStore}',
                textAlign: TextAlign.start,
                maxLines: 100,
                style: context.textStyles.labelSmall.regular.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  // height: 2.h,
                ),
              ),
            ],
          ).box.width(265.w).make(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.close,
                color: context.colorsCustom.surfacePrimaryBlack,
                size: 16,
              ),
              SizedBox(height: 35),
            ],
          ).onTap(onTap),
        ],
      ).box
      .customRounded(BorderRadius.circular(8.w))
      .padding(EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h))
      .color(context.colorsCustom.LightBlue)
      .make();
}
