import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/def_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/address_widget.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/map_widget.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/time_date_widget.dart';
import 'package:dazaha_app/features/pick_up_point/widgets/top_text_widget.dart';
import 'package:dazaha_app/features/summary/widgets/data_column_widget.dart';
import 'package:dazaha_app/features/summary/widgets/summary_list_widget.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

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
          TopTextWidget(
            context,
            Title: context.adSummary,
            SubTitle: '',
            isShow: false,
          ),
          Container(
            height: 175.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                image: AssetImage(AppAssets.images.rectangle_12382_png),
                fit: BoxFit.fill,
              ),
            ),
          ),
          verticalSpace(10.h),
          TimeDateWidget(context),
          verticalSpace(10.h),
          AddressWidget(context, isShow: false, isShowMet: false),
          verticalSpace(10.h),
          MapWidget(context),
          verticalSpace(15.h),
          SummaryListWidget(context),
          verticalSpace(15.h),
          DataColumnWidget(context, isShow: false),
        ],
      ),
    );
  }
}
