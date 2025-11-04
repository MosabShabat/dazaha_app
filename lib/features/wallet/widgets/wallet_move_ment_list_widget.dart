import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../controller/wallet_controller.dart';

Widget WalletMoveMentListWidget(
  BuildContext context, {
  required WalletController controller,
}) {
  log(
    '_walletController.recordTransactionsModel.length : ${controller.recordTransactionsModel.length}',
  );
  return ListView.builder(
    padding: EdgeInsets.all(0),
    itemCount: controller.walletModel!.value.recordTransactionsModel!.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),

    itemBuilder: (context, index) {
      if (index <
          controller.walletModel!.value.recordTransactionsModel!.length) {
      } else if (controller.isLoadingMore.value) {}

      if (controller.walletModel!.value.recordTransactionsModel!.isEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAssets.json.the_financial_empty_json),
            verticalSpace(15.h),
            '${context.dataEmpty}'.text.bold.size(18.sp).make(),
          ],
        );
      }
      var transactions = controller.walletModel!.value.recordTransactionsModel![index];
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
          child: CachedNetworkImage(imageUrl: transactions.image ?? ''),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${transactions.name ?? ''}',
              textAlign: TextAlign.start,
              style: context.textStyles.bodyMedium.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
            horizontalSpace(10.w),
            SvgPicture.asset(
              transactions.type == 'wallet_deposit'
                  ? AppAssets.svgs.import_arrow_down_icon
                  : AppAssets.svgs.import_arrow_up_icon,
              color: transactions.type == 'wallet_deposit'
                  ? context.colorsCustom.LightGreen
                  : context.colorsCustom.redColor,
            ),
          ],
        ),
        subtitle: Text(
          '${transactions.dateTime ?? ''}',
          textAlign: TextAlign.start,
          style: context.textStyles.bodySmall.regular.copyWith(
            color: context.colorsCustom.TextSecondary,
          ),
        ),

        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${transactions.amount} ${context.currency}',
              textAlign: TextAlign.start,
              style: context.textStyles.bodyMedium.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
            verticalSpace(5.h),
            Text(
              transactions.statusText ?? '',
              textAlign: TextAlign.start,
              style: context.textStyles.bodySmall.medium.copyWith(
                color: context.colorsCustom.TealGreenSecondary,
              ),
            ),
          ],
        ),
      );
    },
  );
}
