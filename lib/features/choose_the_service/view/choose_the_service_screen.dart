import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../home/controller/home_controller.dart';
import '../../home_page/controller/home_page_controller.dart';
import '../controller/order_data_controller.dart';
import '../widgets/choose_service_list_view_widget.dart';
import '../widgets/choose_service_shimmer_widget.dart';
import '../widgets/text_service_widget.dart';

class ChooseTheServiceScreen extends StatelessWidget {
  ChooseTheServiceScreen({super.key});

  final HomePageController _homePageController = Get.find();
  final OrderDataController _orderDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: context.colorsCustom.surfacePrimaryWhite,
        body: SafeArea(
          child: GeneralScreenWidget(
            context,
            wid: [
              _closeIcon(),
              verticalSpace(20.h),
              _headerText(context),
              verticalSpace(20.h),
              _contentWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _closeIcon() {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () => Get.find<HomeController>().backFromChooseService(),
        child: SvgPicture.asset(AppAssets.svgs.closeIcon),
      ),
    );
  }

  Widget _headerText(BuildContext context) {
    return TextServiceWidget(
      context,
      color1: context.colorsCustom.TextPrimary,
      text1: context.needSomethingDontWorry,
      size1: 18.sp,
      height: 30.h,
      fontFamily1: context.textStyles.titleLarge.bold.fontFamily!,
      color2: context.colorsCustom.TextSecondary,
      text2: context.weDeliverBuyAndHandleEverythingForYou,
      size2: 14.sp,
      fontFamily2: context.textStyles.titleSmall.regular.fontFamily,
    );
  }

  Widget _contentWidget(BuildContext context) {
    if (_homePageController.isLoading.isTrue) {
      return ChooseServiceShimmerWidget();
    } else {
      return ChooseServiceListViewWidget(
        context,
        controller: _homePageController,
        orderController: _orderDataController,
      );
    }
  }
}
