import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/def_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/core/widgets/image_list_view_builder_widget.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/address_widget.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/det_column_widget.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/map_widget.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/time_date_widget.dart';

class AdvertisementSummaryScreen extends StatelessWidget {
  const AdvertisementSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DefAppBarWidget(context),
      bottomNavigationBar: BottomNavigationBarWidget(
        text: context.postTheAd,
        context,
        GetScreen: () {
          Get.toNamed(Routes.reviewDetailsScreen);
        },
      ),
      body: GeneralScreenWidget(
        context,
        wid: [
          Text(
            context.adSummary,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: context.textStyles.titleLarge.bold.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 20.sp,
            ),
          ),
          verticalSpace(10.h),
          ImageListViewBuilderWidget(context),
          verticalSpace(10.h),
          TimeDateWidget(context),
          verticalSpace(10.h),
          AddressWidget(context, isShow: false),
          verticalSpace(10.h),
          MapWidget(context),
          verticalSpace(10.h),
          DetColumnWidget(context),
        ],
      ),
    );
  }
}
