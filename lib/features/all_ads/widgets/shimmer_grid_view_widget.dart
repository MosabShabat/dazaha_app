import '../../../core/constant/exports_libraries.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';

Widget ShimmerGridViewWidget() {
  return GridView.builder(
    itemCount: 6,
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
      return CustomShimmer(width: 170.w, height: 170.w, borderRadius: 8.r);
    },
  );
}