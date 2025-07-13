import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/latest_announcements_widget.dart';
import 'package:dazaha_app/features/my_ads/widgets/filter_gride_view_widget.dart';

Future<dynamic> FilteringBottomSheetWidget(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return SingleChildScrollView(
        child:
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LatestAnnouncementsRowWidget(
                      context,
                      text: context.filter,
                      size: 16.sp,
                      fontFamily:
                          context.textStyles.bodyLarge.medium.fontFamily,
                      onPressed: () {
                        print(context.reset);
                      },
                      Widget: Text(
                        '${context.reset}',
                        style: context.textStyles.headlineSmall.regular
                            .copyWith(
                              color: context.colorsCustom.TextSecondary,
                              fontSize: 12.sp,
                            ),
                      ),
                    ),
                    Text(
                      '${context.ViewYourRequestsByServiceType}',
                      style: context.textStyles.headlineSmall.regular.copyWith(
                        color: context.colorsCustom.TextSecondary,
                        fontSize: 14.sp,
                      ),
                    ),
                    verticalSpace(35.h),
                    FilterGrideViewWidget(context),
                    verticalSpace(Width * 0.15),
                    GeneralBottomAppWidget(
                      context,
                      text: context.filter,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ).box
                .color(context.colorsCustom.surfacePrimaryWhite)
                .padding(EdgeInsets.symmetric(horizontal: 20.w, vertical: 20))
                .width(Width)
                .make(),
      );
    },
  );
}
