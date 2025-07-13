import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/back_arrow_widget.dart';
import 'package:dazaha_app/features/direct_suppor_map/widgets/down_cont_widget.dart';

class DirectSupportMapScreen extends StatelessWidget {
  const DirectSupportMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Width.w,
            height: Height.h,
            decoration: BoxDecoration(color: context.colorsCustom.BlueBlue),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: BackArrowWidget(context),
                ),
                verticalSpace(10.h),
                Spacer(),
                DownContWidget(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
