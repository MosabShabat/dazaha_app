import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/def_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/pick_up_point/widgets/top_text_widget.dart';
import 'package:dazaha_app/features/summary/widgets/data_column_widget.dart';
import 'package:dazaha_app/features/summary/widgets/loc_row_widget.dart';
import 'package:dazaha_app/features/summary/widgets/summary_list_widget.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DefAppBarWidget(context),
      bottomNavigationBar: BottomNavigationBarWidget(
        text: context.send,
        context,
        GetScreen: () {
          Get.toNamed(Routes.reviewDetailsScreen);
        },
      ),
      body: GeneralScreenWidget(
        context,
        wid: [
          TopTextWidget(
            context,
            Title: context.summary,
            SubTitle: context.shoppingList,
          ),
          verticalSpace(10.h),
          LocRowWidget(context),
          verticalSpace(10.h),
          SummaryListWidget(),
          verticalSpace(10.h),
          DataColumnWidget(context),
        ],
      ),
    );
  }
}
