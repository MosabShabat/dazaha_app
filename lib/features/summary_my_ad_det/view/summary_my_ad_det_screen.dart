import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/address_widget.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/map_widget.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/time_date_widget.dart';
import 'package:dazaha_app/features/summary/widgets/summary_list_widget.dart';
import 'package:dazaha_app/features/summary_my_ad_det/widgets/fir_box_widget.dart';
import 'package:dazaha_app/features/summary_my_ad_det/widgets/tob_box_container_info_widget.dart';

class SummaryMyAdDetScreen extends StatelessWidget {
  const SummaryMyAdDetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TobBoxContainerInfoWidget(context),
            verticalSpace(10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FirBoxWidget(context),
                verticalSpace(30.h),
                TimeDateWidget(context),
                verticalSpace(20.h),
                SummaryListWidget(context),
                verticalSpace(10.h),
                AddressWidget(context, isShow: true, isShowMet: true),
                verticalSpace(10.h),
                MapWidget(context),
              ],
            ).paddingSymmetric(horizontal: 16.w, vertical: 10.h),
          ],
        ),
      ),
    );
  }
}
