import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/custom_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/select_store_name/widgets/add_new_cat_widget.dart';
import 'package:dazaha_app/features/select_store_name/widgets/list_det_cat_widget.dart';
import 'package:dazaha_app/features/store_name/widgets/store_name_row_widget.dart';

class SelectStoreNameScreen extends StatelessWidget {
  const SelectStoreNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: CustomAppBarWidget(
        context,
        indexColor1: 0,
        indexColor2: 1,
        indexColor3: 2,
        indexColor4: 0,
        indexColor5: 0,
      ),

      bottomNavigationBar: BottomNavigationBarWidget(
        text: context.continuation,
        context,
        GetScreen: () {
          Get.toNamed(
            Routes.pickUpPointScreen,
            arguments: {
              'page': Routes.adDetailsScreen, // ✅ Only pass the route name
              'pageArgs': {'page': Routes.summaryScreen, 'isSwitchShow': false},
              'isAppBar': false,
            },
          );
        },
      ),
      body:
          // Obx(() {
          //   return
          GeneralScreenWidget(
            context,
            wid: [
              StoreNameRowWidget(context, text: 'مول المنصور'),
              verticalSpace(20.h),
              // Obx(() {
              //   return
              ListDetCatWidget(),
              // }),
              //.box.height(Height * 0.66).make(),
              verticalSpace(20.h),
              AddNewCatWidget(context),
            ],
          ),
      // }),
    );
  }
}
