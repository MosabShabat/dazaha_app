import 'package:flutter_html/flutter_html.dart';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/bottom_navigation_bar_widget.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../../features/captain_joins/widgets/mid_text_col_widget.dart';
import '../../../features/captain_joins/widgets/top_close_img_widget.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';
import '../../home/controller/home_controller.dart';
import '../controller/captain_joins_controller.dart';

class CaptainJoinsScreen extends StatelessWidget {
  final CaptainJoinsController _controller = Get.find();
  CaptainJoinsScreen({super.key});
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      bottomNavigationBar: BottomNavigationBarWidget(
        text: context.startNow,
        context,
        GetScreen: () {
          Get.toNamed(Routes.personalDataScreen);
        },
      ),
      body: SafeArea(
        child: GeneralScreenWidget(
          context,
          wid: [
            _closeIcon(),
            verticalSpace(20.h),
            AppConstants.isDriver == 1
                ? SizedBox.shrink()
                : verticalSpace(150.h),
            TopCloseImgWidget(),
            verticalSpace(15.h),
            AppConstants.isDriver == 1
                ? _bodyCaptainWidget(
                    context,
                    captainJoinsController: _controller,
                  )
                : Column(
                    children: [
                      Text(
                        '${context.joinAsCap}',
                        textAlign: TextAlign.center,
                        style: context.textStyles.bodyLarge.bold.copyWith(
                          color: context.colorsCustom.TextPrimary,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ).box.alignCenter.make(),
                      verticalSpace(20.h),
                      Text(
                        '${context.offerDevSer}',
                        textAlign: TextAlign.center,
                        style: context.textStyles.bodyLarge.medium.copyWith(
                          color: context.colorsCustom.TextSecondary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ).box.alignCenter.make(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _closeIcon() {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Get.offAllNamed(Routes.homeScreen, arguments: {'selectedIndex': 0});
        },
        child: SvgPicture.asset(AppAssets.svgs.closeIcon),
      ),
    );
  }

  Column _bodyCaptainWidget(
    BuildContext context, {
    required CaptainJoinsController captainJoinsController,
  }) {
    return Column(
      children: [
        MidTextColWidget(
          context,
          TitleText: captainJoinsController.joinAsDriverVar?.value.title ?? '',
        ),
        buildDescription(
          context,
          captainJoinsController: captainJoinsController,
        ),
      ],
    );
  }
}

Widget buildDescription(
  BuildContext context, {
  required CaptainJoinsController captainJoinsController,
}) {
  return Obx(() {
    return captainJoinsController.isLoading.isTrue
        ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(15, (index) {
                return CustomShimmer(
                  width: index % 2 == 0 ? 300.w : 100.w,
                  height: index % 2 == 0 ? 10.h : 5.h,
                ).paddingSymmetric(vertical: 15.h, horizontal: 0.w);
              }),
            ),
          )
        : Html(
            data:
                captainJoinsController.joinAsDriverVar?.value.description ?? '',
            style: {"*": Style(fontFamily: 'sans', fontSize: FontSize(14))},
          );
  });
}
