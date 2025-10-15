import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';

Widget listShimmerWidget() {
  return SingleChildScrollView(
    child: Column(children: List.generate(5, (_) => _buildShimmerItem())),
  );
}

Widget _buildShimmerItem() {
  return Row(
    children: [
      CustomShimmer(width: 100.w, height: 100.w, borderRadius: 8.r),
      horizontalSpace(5.w),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _ShimmerLine(width: 90),
          _ShimmerLine(width: 60),
          _ShimmerLine(width: 40),
        ],
      ),
      horizontalSpace(80.w),
      CustomShimmer(width: 56.w, height: 14.h, borderRadius: 16.r),
    ],
  ).box.height(90.h).padding(EdgeInsets.only(bottom: 10.h)).make();
}

class _ShimmerLine extends StatelessWidget {
  final double width;
  const _ShimmerLine({required this.width});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(width: width.w, height: 6.h, borderRadius: 8.r);
  }
}
