import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/bottom_navigation_bar_widget.dart';
import '../../../features/select_a_location_on_the_map_store/widgets/enter_store_name_widget.dart';

import '../../../core/widgets/app_button_back.dart';

class SelectALocationOnTheMapStoreScreen extends StatelessWidget {
  const SelectALocationOnTheMapStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final KeyboardDoneController doneController = KeyboardDoneController();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: Width,
              height: Height,
              decoration: BoxDecoration(color: context.colorsCustom.BlueBlue),
            ),
            SafeArea(
              child: GestureDetector(
                onTap: () {
                  // يخفي الكيبورد عند الضغط في أي مكان فارغ
                  FocusScope.of(context).unfocus();
                },
                child:
                    Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(10.h),
                            AppButtonBack(context: context),
                            verticalSpace(10.h),
                            EnterStoreNameWidget(
                              context,
                              doneController: doneController,
                            ),
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
            ),
          ],
        ),
      ),
    );
  }
}
