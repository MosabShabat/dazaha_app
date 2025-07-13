import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/presenter_info_widget.dart';

Widget TabBodyWidget(BuildContext context) {
  return ListView.builder(
    itemCount: 10,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0.r),
                child: Image.asset(
                  AppAssets.images.goku,
                  fit: BoxFit.cover,
                  height: 100.w,
                  width: 100.w,
                ),
              ),
              horizontalSpace(5.w),
              PresenterInfoWidget(context),
            ],
          ),
          verticalSpace(10.h),
          Divider(color: context.colorsCustom.CardBorder, thickness: 1),
        ],
      );
    },
  );
}


