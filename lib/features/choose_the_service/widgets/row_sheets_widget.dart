import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../controller/choose_the_service_controller.dart';

Widget RowSheetWidget(
  BuildContext context, {
  required Color backGroundColor,
  required Color textColor,
  required String fontFamily,
  required double fontSize,
  required double CircleAvatarRadius,
  required FontWeight fontWeight,
  required ChooseTheServiceController controller,
  required MainAxisAlignment mainAxisAlignment,
  double? width,
  int maxLines = 1,
  List<VoidCallback>? onTapList,
}) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: List.generate(
      controller.serviceModel!.value.subServices!.length,
      (index) {
        final data = controller.serviceModel!.value.subServices![index];
        return GestureDetector(
          onTap: (onTapList != null && index < onTapList.length)
              ? onTapList[index]
              : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: backGroundColor,
                radius: CircleAvatarRadius,
                child: CachedNetworkImage(
                  imageUrl: data.image ?? '',
                  width: 40.w,
                  height: 40.w,
                ),
              ),
              verticalSpace(10.h),
              SizedBox(
                width: width ?? 77.w,
                child: Text(
                  data.title ?? '',
                  maxLines: maxLines,
                  textAlign: TextAlign.center,
                  style: context.textStyles.bodySmall.copyWith(
                    color: textColor,
                    fontFamily: fontFamily,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
