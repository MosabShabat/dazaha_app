import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/def_app_bar_widget.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/med_cus_widget.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/tab_body_widget.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/tob_column_widget.dart';

class MyAdsDetailsScreen extends StatelessWidget {
  const MyAdsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DefAppBarWidget(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TobColumnWidget(context,horizontalPadding: 16.0.w),
            Divider(color: context.colorsCustom.CardBorder, thickness: 1),
            verticalSpace(20.h),
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MedCusWidget(context),
                    verticalSpace(20.h),
                    TabBodyWidget(context),
                  ],
                ).box
                .padding(EdgeInsetsGeometry.symmetric(horizontal: 16.w))
                .make(),
          ],
        ),
      ),
    );
  }
}
