import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/top_con_bot_sh_widget.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/time_date_widget.dart';
import 'package:dazaha_app/features/item_ad_details/widgets/asking_price_widget.dart';
import 'package:dazaha_app/features/item_ad_details/widgets/my_offer_to_customer_widget.dart';
import 'package:dazaha_app/features/item_ad_details/widgets/my_price_widget.dart';

Future<dynamic> AddOfferBottomSheetWidget(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          width: Width,
          color: context.colorsCustom.surfacePrimaryWhite,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TopConBotShWidget(context),
              verticalSpace(10.h),
              Text(
                    context.addAnOffer,
                    style: context.textStyles.titleSmall.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ).box
                  .alignment(
                    Localizations.localeOf(context).languageCode == "ar"
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                  )
                  .make(),
              verticalSpace(15.h),
              AskingPriceWidget(context),
              MyPriceWidget(context),
              verticalSpace(20.h),
              TimeDateWidget(context),
              verticalSpace(50.h),
              GeneralBottomAppWidget(
                context,
                text: context.send,
                backgroundColorB: context.colorsCustom.surfacePrimaryBlack,
                textColorB: context.colorsCustom.surfacePrimaryWhite,
                onTap: () {
                  Get.back();
                  MyOfferToCustomerWidget(context,IsShowRow: true,title: context.yourOfferHasReachedTheCustomer);
                },
              ),
              verticalSpace(20.h),
            ],
          ),
        ),
      );
    },
  );
}
