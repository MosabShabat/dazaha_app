import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';

Widget StoreNameRowWidget(BuildContext context, {required text, widget}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        '${text}',
        textAlign: TextAlign.start,
        style: context.textStyles.titleLarge.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: 20.sp,
        ),
      ),
      widget == null
          ? Container()
          : TextButton(
              onPressed: () {
                Get.toNamed(Routes.selectALocationOnTheMapStoreScreen);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppAssets.svgs.map_icon),
                  horizontalSpace(5.w),
                  Text(
                    context.chooseFromMap,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: context.textStyles.bodyMedium.medium.copyWith(
                      color: context.colorsCustom.BluePrimary,
                    ),
                  ),
                ],
              ),
              //.box.height(25.h).make(),
            ),
    ],
  );
}
