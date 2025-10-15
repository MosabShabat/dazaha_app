  import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';

Widget ChooseServiceShimmerWidget() {
    return SizedBox(
      height: Height.h / 2.1,
      child: Column(
        children: List.generate(4, (index) {
          return CustomShimmer(
            width: Width.w,
            height: 70.h,
            borderRadius: 12.r,
          ).marginSymmetric(vertical: 15.h);
        }),
      ),
    );
  }