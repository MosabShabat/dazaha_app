import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/back_arrow_widget.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/features/buy_me/select_a_location_on_the_map/widgets/enter_store_name_widget.dart';

class SelectALocationOnTheMapStoreScreen extends StatelessWidget {
  const SelectALocationOnTheMapStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Width,
            height: Height,
            decoration: BoxDecoration(color: context.colorsCustom.BlueBlue),
          ),
          SafeArea(
            child:
                Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(10.h),
                        BackArrowWidget(context),
                        verticalSpace(10.h),
                        EnterStoreNameWidget(context),
                        Spacer(),
                        BottomNavigationBarWidget(
                          text: context.choice,
                          context,
                          horizontalPadding: 0.0,
                          GetScreen: () {},
                        ),
                      ],
                    ).box
                    .padding(EdgeInsetsGeometry.symmetric(horizontal: 16.w))
                    .make(),
          ),
        ],
      ),
    );
  }
}
