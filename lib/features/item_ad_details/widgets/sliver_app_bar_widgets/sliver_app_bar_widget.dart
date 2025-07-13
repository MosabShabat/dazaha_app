import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/item_ad_details/controller/item_ad_details_controller.dart';
import 'package:dazaha_app/features/item_ad_details/widgets/sliver_app_bar_widgets/info_cat_row_widget.dart';

Widget SliverAppBarWidget(BuildContext context, {required sliController}) {
  final ItemAdDetailsController controller = ItemAdDetailsController();

  return SliverAppBar(
    pinned: false,
    automaticallyImplyLeading: false,
    leading: Padding(
      padding: EdgeInsets.all(10.0.w),
      child:
          Container(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: context.colorsCustom.surfacePrimaryWhite,
            ),
            child: Center(child: Icon(Icons.arrow_back_ios)),
          ).onTap(() {
            Get.back();
          }),
    ),
    expandedHeight: 300.h,
    flexibleSpace: Stack(
      fit: StackFit.expand,
      children: [
        PageView.builder(
          controller: sliController,
          itemCount: controller.images.length,
          itemBuilder: (context, index) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(AppAssets.images.images_bet, fit: BoxFit.cover),
                InfoCatRowWidget(context),
              ],
            );
          },
        ),
      ],
    ),
  );
}
