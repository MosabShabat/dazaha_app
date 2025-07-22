  import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/app_assets.dart';
import 'package:dazaha_app/core/widgets/back_arrow_widget.dart';
import 'package:dazaha_app/features/item_ad_details/widgets/sliver_app_bar_widgets/info_cat_row_widget.dart';

Widget TobBoxContainerInfoWidget(BuildContext context) {
    return Container(
      height: 350.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.images.rectangle_12382_png),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackArrowWidget(
              context,
            ).paddingSymmetric(horizontal: 16.w, vertical: 10.h),
            InfoCatRowWidget(context),
          ],
        ),
      ),
    );
  }