import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/all_ads/widgets/ser_row_widget.dart';
import 'package:dazaha_app/features/all_ads/widgets/shadow_con_widget.dart';

Widget BodyAdsTapBarWidget(BuildContext context) {
  return Column(
    children: [
      SerRowWidget(context),
      verticalSpace(20.h),
      SizedBox(
        height: Width * 1.5,
        child: GridView.builder(
          itemCount: 20,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 20.h,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return Container(
              width: 170.w,
              height: 170.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.images.rectangle_12375_img),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: ShadowConWidget(context),
            ).onTap(
              () => Get.toNamed(
                Routes.itemAdDetailsScreen,
                arguments: {'isShow': true},
              ),
            );
          },
        ),
      ),
    ],
  ).paddingOnly(left: 16.w, right: 16.w, top: 20.h);
}
