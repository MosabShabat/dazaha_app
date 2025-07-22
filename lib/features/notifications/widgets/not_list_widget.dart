import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget NotListWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.today,
        style: context.textStyles.labelMedium.regular.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(10.h),
      ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10.h),
            leading: CircleAvatar(
              radius: 25.r,
              backgroundColor: context.colorsCustom.CardBackgroundLightGray,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مشكلتك وصلت فريق الدعم، راح نراجعها ونرد عليك قريب.',
                  maxLines: 3,
                  style: context.textStyles.bodyMedium.regular.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ],
  );
}
