import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/widgets/app_delete_bottom_sheet/widgets/no_connection_text_widget.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';
import '../controller/profile_controller.dart';
import '../widgets/profile_app_bar_widget.dart';
import '../widgets/profile_list_view_items_widget.dart';
import '../widgets/top_container_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();
    profileController.fetchUserData(); // استخدم الدالة المحسّنة

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: ProfileAppBarWidget(context),
      body: Obx(() {
        if (profileController.isUserDataLoading.value) {
          // عرض shimmer أثناء التحميل
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                7,
                (index) => CustomShimmer(
                  width: double.infinity,
                  height: index == 0 ? 100.h : 60.h,
                ).paddingSymmetric(vertical: 15.h, horizontal: 16.w),
              ),
            ),
          );
        }

        if (profileController.isOffline.value) {
          // حالة عدم الاتصال
          return NoConnectionTextWidget(context);
        }

        final user = profileController.userData.value;
        return SingleChildScrollView(
          child: Column(
            children: [
              if (user?.isDriver == 0) ...[
                verticalSpace(10.h),
                TopContainerWidget(context),
                verticalSpace(10.h),
              ],
              ProfileListViewItemsWidget(
                context,
                profileController: profileController,
              ),
            ],
          ),
        );
      }),
    );
  }
}
