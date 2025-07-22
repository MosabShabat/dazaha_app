import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

AppBar DirectSupportAppBarWidget(
  BuildContext context, {
  required isPersonChat,
}) {
  return AppBar(
    surfaceTintColor: context.colorsCustom.surfacePrimaryWhite,
    backgroundColor: context.colorsCustom.surfacePrimaryWhite,
    leading: Padding(
      padding: EdgeInsets.all(10.0.w),
      child:
          Container(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: context.colorsCustom.surfacePrimaryWhite,
            ),
            child: Center(child: Icon(Icons.arrow_back_ios)),
          ).onTap(() {
            Get.back();
          }),
    ),
    centerTitle: true,
    title: isPersonChat
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20.w,
                backgroundImage: AssetImage(AppAssets.images.goku),
              ),
              horizontalSpace(5.w),
              Text(
                'عباس الجبوري',
                style: context.textStyles.labelMedium.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                ),
              ),
              horizontalSpace(70.w),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                'الدعم المباشر',
                style: context.textStyles.labelMedium.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                ),
              ).box.alignCenter.make(),
              horizontalSpace(50.w),
            ],
          ),
  );
}
