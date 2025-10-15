import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../controller/home_page_controller.dart';

Widget stackAdsText(BuildContext context, HomePageController controller) {
  final slider = controller.homeModel.value?.sliders?.first;
  final link = slider?.link;

  return GestureDetector(
    onTap: () async {
      if (link != null && link.isNotEmpty) {
        final Uri uri = Uri.parse(link);
        try {
          // حاول فتحه في متصفح النظام الافتراضي
          bool launched = await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );

          // إذا فشل، افتحه داخل التطبيق نفسه
          if (!launched) {
            await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
          }
        } catch (e) {
          debugPrint('⚠️ خطأ أثناء فتح الرابط: $e');
        }
      }
    },
    child: Container(
      width: Width.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: '${slider?.image}',
              fit: BoxFit.fill,
              height: 60.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20.h),
                Text(
                  '${slider?.title ?? ''}',
                  style: context.textStyles.titleLarge.medium.copyWith(
                    color: context.colorsCustom.surfacePrimaryWhite,
                    fontSize: 20.sp,
                  ),
                ),
                verticalSpace(10.h),
                Text(
                  '${slider?.subtitle ?? ''}',
                  style: context.textStyles.titleSmall.regular.copyWith(
                    color: context.colorsCustom.surfacePrimaryWhite,
                    fontSize: 14.sp,
                  ),
                ),
                verticalSpace(20.h),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
