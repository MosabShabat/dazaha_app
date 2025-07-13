import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/address_widget.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/map_widget.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/time_date_widget.dart';
import 'package:dazaha_app/features/item_ad_details/controller/item_ad_details_controller.dart';
import 'package:dazaha_app/features/item_ad_details/widgets/sliver_app_bar_widgets/sliver_app_bar_widget.dart';
import 'package:dazaha_app/features/item_ad_details/widgets/smooth_page_indicator_widget.dart';
import 'package:dazaha_app/features/item_ad_details/widgets/transport_info_widget.dart';

class ItemAdDetailsScreen extends StatelessWidget {
  const ItemAdDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemAdDetailsController controller = Get.put(
      ItemAdDetailsController(),
    );

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(context, sliController: controller.pageController),
          SliverToBoxAdapter(
            child:
                Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(20.h),
                        SmoothPageIndicatorWidget(
                          context,
                          controller: controller,
                        ),
                        verticalSpace(20.h),
                        TransportInfoWidget(context),
                        verticalSpace(20.h),
                        TimeDateWidget(context),
                        verticalSpace(20.h),
                        AddressWidget(context, isShow: true),
                        verticalSpace(20.h),
                        MapWidget(context),
                        verticalSpace(20.h),
                      ],
                    ).box
                    .padding(EdgeInsetsGeometry.symmetric(horizontal: 16.w))
                    .make(),
          ),
        ],
      ),
    );
  }
}
