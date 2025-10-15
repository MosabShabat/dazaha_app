import 'package:flutter_html/flutter_html.dart';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/bottom_navigation_bar_widget.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../../features/captain_joins/widgets/mid_text_col_widget.dart';
import '../../../features/captain_joins/widgets/top_close_img_widget.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';
import '../controller/captain_joins_controller.dart';

class CaptainJoinsScreen extends StatelessWidget {
  final CaptainJoinsController _controller = Get.find();
  CaptainJoinsScreen({super.key});

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
            TopCloseImgWidget(),
            verticalSpace(15.h),
            _bodyCaptainWidget(context, captainJoinsController: _controller),
          ],
        ),
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
