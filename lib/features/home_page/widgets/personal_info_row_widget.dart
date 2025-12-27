
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/login_required_bottom_sheet/view/login_required_bottom_sheet.dart';
import '../controller/home_page_controller.dart';

Widget personalInfoRow(BuildContext context, HomePageController controller) {
  AppConstants.userToken = '${controller.homeModel.value?.user?.token ?? ''}';
  AppConstants.userUUid = '${controller.homeModel.value?.user?.uuid ?? ''}';

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: [
          _profileImageWidget(controller),
          horizontalSpace(5.w),
          _nameLocationWidget(controller, context),
        ],
      ).onTap(() {
        if (AppConstants.userToken.isNotEmpty &&
            AppConstants.userToken != '' &&
            AppConstants.userUUid.isNotEmpty &&
            AppConstants.userUUid != '') {
          Get.toNamed(Routes.userInfoScreen);
        } else {
          showLoginRequiredBottomSheet(Get.context!);
        }
      }),
      _notificationsWidget(
        context,
      ).onTap(() => Get.toNamed(Routes.notificationsScreen)),
    ],
  );
}

Widget _notificationsWidget(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: context.colorsCustom.surfacePrimaryBlack.withOpacity(0.05),
          spreadRadius: 2,
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: CircleAvatar(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      maxRadius: 20.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(AppAssets.svgs.notification_bing),
          if (unreadNotificationLocal.value >= 1)
            Positioned(
              top: 0,
              right: 2,
              child: CircleAvatar(
                backgroundColor: context.colorsCustom.redColor,
                maxRadius: 4.w,
              ),
            ),
        ],
      ),
    ),
  );
}

Widget _nameLocationWidget(
  HomePageController controller,
  BuildContext context,
) {
  return Obx(() {
    final user = controller.homeModel.value?.user;

    // اسم المستخدم
    final userName = user?.name == null || user?.name == " "
        ? '${context.welcome}'
        : user?.name;

    // موقع المستخدم: يظهر فورًا الإحداثيات أو آخر اسم محفوظ
    final fullLocation = controller.currentLocation.value.isNotEmpty
        ? controller.currentLocation.value
        : 'جارِ تحديد الموقع...';

    // تحديد أول 3 كلمات فقط
    final words = fullLocation.split(' ');
    final location = words.length > 4
        ? '${words.sublist(0, 4).join(' ')}...'
        : fullLocation;

    return SizedBox(
      width: 160.w,
      height: 50.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userName!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textStyles.bodyMedium.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          Text(
            location,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textStyles.labelMedium.regular.copyWith(
              color: context.colorsCustom.TextSecondary,
            ),
          ),
        ],
      ),
    );
  });
}

Widget _profileImageWidget(HomePageController controller) {
  return Obx(() {
    if (controller.isLoading.isTrue || controller.homeModel.value == null) {
      return CustomShimmer(width: 30.w, height: 30.w, borderRadius: 60.r);
    }

    final userImage = controller.homeModel.value!.user!.image ?? '';
    return CircleAvatar(
      maxRadius: 30.w,
      child: CachedNetworkImage(
        imageUrl: userImage,
        imageBuilder: (context, imageProvider) =>
            CircleAvatar(radius: 50.r, backgroundImage: imageProvider),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: CircleAvatar(radius: 50.r, backgroundColor: Colors.grey[200]),
        ),
        errorWidget: (context, url, error) =>
            CircleAvatar(radius: 50.r, backgroundColor: Colors.grey[200]),
      ),
    );
  });
}
