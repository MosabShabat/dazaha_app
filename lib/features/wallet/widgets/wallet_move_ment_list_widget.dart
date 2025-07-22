  import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget WalletMoveMentListWidget(BuildContext context) {
    return SizedBox(
      height: 450.h,
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: 5,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsetsDirectional.only(
              start: 0,
              end: 0,
              bottom: 10.h,
              top: 0,
            ),
            leading: CircleAvatar(
              radius: 27.r,
              backgroundColor: context.colorsCustom.CardBackgroundLightGray,
              child: SvgPicture.asset(AppAssets.svgs.receipt_icon),
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${context.withdrawABalance}',
                  textAlign: TextAlign.start,
                  style: context.textStyles.bodyMedium.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                ),
                horizontalSpace(10.w),
                SvgPicture.asset(
                  AppAssets.svgs.import_arrow_up_icon,
                  color: context.colorsCustom.redColor,
                ),
              ],
            ),
            subtitle: Text(
              '07:06 م ، 27/06/2025',
              textAlign: TextAlign.start,
              style: context.textStyles.bodySmall.regular.copyWith(
                color: context.colorsCustom.TextSecondary,
              ),
            ),

            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '10،000 د.ع',
                  textAlign: TextAlign.start,
                  style: context.textStyles.bodyMedium.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                ),
                verticalSpace(5.h),
                Text(
                  'ناجحة',
                  textAlign: TextAlign.start,
                  style: context.textStyles.bodySmall.medium.copyWith(
                    color: context.colorsCustom.TealGreenSecondary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }