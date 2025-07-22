import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
// import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
// import 'package:dazaha_app/core/widgets/def_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/core/widgets/image_list_view_builder_widget.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/address_widget.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/map_widget.dart';
import 'package:dazaha_app/features/item_ad_details/widgets/advertiser_row_widget.dart';
import 'package:dazaha_app/features/item_ad_details/widgets/transport_info_widget.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/top_det_row_widget.dart';
import 'package:dazaha_app/features/my_offer_ad_details/widgets/my_offer_app_bar_widget.dart';
import 'package:dazaha_app/features/my_offer_ad_details/widgets/presented_offer_box_widget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/invoice_box_widget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/pay_mth_widget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/t_d_del_widget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/track_your_flight_widget.dart';

class MyOfferAdDetailsScreen extends StatelessWidget {
  const MyOfferAdDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isShow = (Get.arguments as Map?)?['isShow'] ?? false;
    // final dynamic page = (Get.arguments as Map?)?['page'];

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: MyOfferAppBarWidget(context),
      // bottomNavigationBar: BottomNavigationBarWidget(
      //   text: context.postTheAd,
      //   context,
      //   GetScreen: () {
      //     Get.toNamed(Routes.reviewDetailsScreen);
      //   },
      // ),
      body: GeneralScreenWidget(
        context,
        verH: 0.0,
        wid: [
          TopDetRowWidget(
            context,
            isShow: false,
            title: context.offerDetails,
            subTitle: '#159654 , 5 minutes ago',
          ),
          verticalSpace(10.h),
          ImageListViewBuilderWidget(context),
          verticalSpace(15.h),
          isShow ? PresentedOfferBoxWidget(context) : Container(),
          verticalSpace(15.h),
          TrackYourFlightWidget(
            context,
            isShow: isShow,
            BottomText: context.startTheJourney,
            isShowBo: true,
            page: () => Get.toNamed(
              Routes.myOfferAdDetailsScreen,
              arguments: {'isShow': false},
            ),
          ),
          verticalSpace(20.h),
          TransportInfoWidget(context),
          verticalSpace(20.h),
          TDDelWidget(
            context,
            title: context.convenientTimeForMoving,
            Fz: 16.sp,
          ),
          verticalSpace(10.h),
          AddressWidget(context, isShow: true, isShowMet: true),
          verticalSpace(10.h),
          MapWidget(context),
          verticalSpace(10.h),
          AdvertiserRowWidget(context),
          verticalSpace(20.h),
          PayMthWidget(context),
          verticalSpace(20.h),
          InvoiceBoxWidget(context),
          verticalSpace(20.h),
          verticalSpace(10.h),
          GeneralBottomAppWidget(
            context,
            text: context.reportAProblem,
            onTap: () {
              Get.toNamed(Routes.reportAProblemScreen);
            },
            backgroundColorB: context.colorsCustom.CardBackgroundLightGray,
            fontWeight: FontWeight.w500,
            textColorB: context.colorsCustom.TextPrimary,
          ),
          verticalSpace(20.h),
        ],
      ),
    );
  }
}
