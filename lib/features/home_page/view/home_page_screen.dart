import '../../../core/constant/exports_widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/app_shared_methods.dart';
// import '../../../core/widgets/app_delete_bottom_sheet/widgets/no_connection_text_widget.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer_home.dart';
import '../controller/home_page_controller.dart';
import '../widgets/bottom_custom_widget.dart';
import '../widgets/custom_home_page_widget.dart';
import '../widgets/main_bottom_widget.dart';
import '../widgets/personal_info_row_widget.dart';
import '../widgets/stack_ads_text_widget.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});

  final HomePageController _homePageController = Get.find();
  final RefreshController _localRefreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: SafeArea(
        child: SmartRefresher(
          controller: _localRefreshController,
          onRefresh: () async {
            await _homePageController.refreshData(
              '${_homePageController.latitude.value}',
              '${_homePageController.longitude.value}',
            );
            _localRefreshController.refreshCompleted();
          },
          header: CustomHeader(
            builder: (BuildContext context, RefreshStatus? status) {
              return Container(
                height: 60.h,
                color: context.colorsCustom.surfacePrimaryWhite,
                child: AppSharedMethods.buildProgressViewWhite(context, false),
              );
            },
          ),
          physics: ClampingScrollPhysics(),
          child: Obx(() => _buildBody(context)),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_homePageController.isLoading.isTrue) {
      return CustomShimmerHome();
    }

    final currentOrder = _homePageController.homeModel.value?.currentOrder;
    final currentOffer = _homePageController.homeModel.value?.currentOffer;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: Width,
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
        color: context.colorsCustom.surfacePrimaryWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            personalInfoRow(context, _homePageController),
            verticalSpace(10.h),
            stackAdsText(context, _homePageController),
            verticalSpace(10.h),
            mainBottomWidget(
              context,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              CircleAvatarRadius: 35.0.w,
              backGroundColor: context.colorsCustom.BlueBlue,
              fontFamily: context.textStyles.bodySmall.medium.fontFamily!,
              fontSize: 12.0.sp,
              textColor: context.colorsCustom.TextPrimary,
              controller: _homePageController,
              fontWeight: FontWeight.w500,
              onTapList: [
                () => Get.toNamed(Routes.allAdsScreen, arguments: {'index': 1}),
                () => Get.toNamed(Routes.allAdsScreen, arguments: {'index': 2}),
                () => Get.toNamed(Routes.allAdsScreen, arguments: {'index': 3}),
                () => Get.toNamed(Routes.allAdsScreen, arguments: {'index': 4}),
              ],
            ),
            verticalSpace(10.h),

            _homePageController.homeModel.value!.latestOrders!.isEmpty
                ? Text(
                        context.thereAreNoAds,
                        textAlign: TextAlign.center,
                        style: context.textStyles.titleMedium.medium.copyWith(
                          color: context.colorsCustom.TextSecondary,
                          fontSize: 15.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ).box
                      .padding(EdgeInsetsGeometry.symmetric(vertical: 80.h))
                      .alignCenter
                      .make()
                : CustomHomePageWidget(
                    context,
                    controller: _homePageController,
                  ),
            if (currentOrder != null)
              BottomCustomWidget(
                context,
                controller: _homePageController,
                isOrder: true,
              )
            else if (currentOffer != null)
              BottomCustomWidget(
                context,
                controller: _homePageController,
                isOrder: false,
              )
            else
              SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
