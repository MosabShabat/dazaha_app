import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/pick_up_point/widgets/top_text_widget.dart';
import 'package:dazaha_app/features/summary/widgets/data_column_widget.dart';
import 'package:dazaha_app/features/summary/widgets/summary_list_widget.dart';
import 'package:dazaha_app/features/summary_my_ad_det/widgets/rec_cus_app_bar_widget.dart';

class SummaryMyAdDetScreen extends StatelessWidget {
  const SummaryMyAdDetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: RecCusAppBarWidget(context),
      body: GeneralScreenWidget(
        context,
        wid: [
          TopTextWidget(
            context,
            SubTitle: context.summary,
            Title: '',
            isShow: false,
          ),
          verticalSpace(10.h),
          SummaryListWidget(),
          verticalSpace(10.h),
          DataColumnWidget(context),
        ],
      ),
    );
  }
}
