import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/captain_joins/widgets/mid_text_col_widget.dart';
import 'package:dazaha_app/features/captain_joins/widgets/top_close_img_widget.dart';
import 'package:dazaha_app/features/captain_joins/widgets/why_cap_list_widget.dart';

class CaptainJoinsScreen extends StatelessWidget {
  const CaptainJoinsScreen({super.key});

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
            MidTextColWidget(context),
            WhyCapListWidget(context),
          ],
        ),
      ),
    );
  }
}
