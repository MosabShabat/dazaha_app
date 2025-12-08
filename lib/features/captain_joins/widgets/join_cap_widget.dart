import 'package:flutter_html/flutter_html.dart';

import '../../../core/constant/exports_widgets.dart';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';
import '../../../core/widgets/bottom_navigation_bar_widget.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../../core/widgets/login_required_bottom_sheet/view/login_required_bottom_sheet.dart';
import '../controller/captain_joins_controller.dart';
import 'mid_text_col_widget.dart';
import 'top_close_img_widget.dart';

Widget JoinCapWidget(BuildContext context) {
  final CaptainJoinsController _controller = Get.find();

  return Scaffold(
    backgroundColor: context.colorsCustom.surfacePrimaryWhite,
    bottomNavigationBar: SafeArea(
      child: BottomNavigationBarWidget(
        text: context.startNow,
        context,
        GetScreen: () {
          if (AppConstants.userToken.isNotEmpty &&
              AppConstants.userToken != '' &&
              AppConstants.userUUid.isNotEmpty &&
              AppConstants.userUUid != '') {
            Get.toNamed(Routes.personalDataScreen);
          } else {
            showLoginRequiredBottomSheet(Get.context!);
          }
        },
      ),
    ),
    body: SafeArea(
      child: GeneralScreenWidget(
        context,
        wid: [
          _closeIcon(),
          verticalSpace(20.h),
          TopCloseImgWidget(),
          verticalSpace(15.h),
          _bodyCaptainWidget(context, captainJoinsController: _controller),
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
      buildDescription(context, captainJoinsController: captainJoinsController),
    ],
  );
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
            style: {"*": Style(fontFamily: 'Tajawal', fontSize: FontSize(14))},
          );
  });
}
