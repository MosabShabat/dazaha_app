import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/custom_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/core/widgets/latest_announcements_widget.dart';
import 'package:dazaha_app/features/select_a_location_on_the_map_store/widgets/enter_store_name_widget.dart';
import 'package:dazaha_app/features/store_name/controller/buy_me_controller.dart';
import 'package:dazaha_app/features/store_name/widgets/empty_tag_widget.dart';
import 'package:dazaha_app/features/store_name/widgets/note_widget.dart';
import 'package:dazaha_app/features/store_name/widgets/store_name_row_widget.dart';

class buyMeScreen extends StatelessWidget {
  const buyMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BuyMeController controller = Get.put(BuyMeController());

    //BuyMeController
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: CustomAppBarWidget(
        context,
        indexColor1: 0,
        indexColor2: 1,
        indexColor3: 0,
        indexColor4: 0,
        indexColor5: 0,
      ),
      body: Obx(() {
        final isClose = controller.isCloseNote.value;

        return GeneralScreenWidget(
          context,
          wid: [
            StoreNameRowWidget(
              context,
              text: context.storeName,
              widget: Container(),
            ),
            verticalSpace(10.h),
            EnterStoreNameWidget(context),
            verticalSpace(15.h),
            isClose
                ? Container()
                : NoteWidget(
                    context,
                    onTap: () {
                      controller.toggleIsColes();
                    },
                  ),
            verticalSpace(10.h),
            LatestAnnouncementsRowWidget(
              size: 14.sp,
              context,
              text: context.recentAddresses,
              onPressed: () {},
              Widget: Container(),
            ),
            verticalSpace(80.h),
            EmptyTagWidget(context),
          ],
        );
      }),
    );
  }
}
