import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/report_a_problem/widgets/in_put_rep_widget.dart';
import 'package:dazaha_app/features/report_a_problem/widgets/pic_rep_widget.dart';
import 'package:dazaha_app/features/user_info/widgets/user_info_app_bar_widget.dart';

class ReportAProblemScreen extends StatelessWidget {
  const ReportAProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        context,
        Height: Width * 0.25,
        widget: Text(
          context.reportAProblem,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        text: context.send,
        context,
        GetScreen: () {
          Get.toNamed(Routes.reportReviewDetailsScreen);
        },
      ),
      body: GeneralScreenWidget(
        context,
        wid: [InPutRepWidget(context), PicRepWidget(context)],
      ),
    );
  }
}
