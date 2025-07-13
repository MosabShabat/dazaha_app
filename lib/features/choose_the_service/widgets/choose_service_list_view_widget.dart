import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/list_tale_circle_avatar_widget.dart';
import 'package:dazaha_app/features/choose_the_service/widgets/transportation_and_delivery_widgets/first_item_bottom_sheet_widget.dart';
import 'package:dazaha_app/features/choose_the_service/widgets/buy_me_widgets/second_item_bottom_sheet_widget.dart';
import 'package:dazaha_app/features/choose_the_service/widgets/text_service_widget.dart';

Widget ChooseServiceListViewWidget(BuildContext context) {
  var ListChooseServiceTitleText = [
    context.transportationAndDelivery,
    context.buyForMe,
    context.removeAndRecycle,
    context.dedication,
  ];
  var ListChooseServiceSubTitleText = [
    context.weDeliverYourItemsQuicklyAndSafely,
    context.wellBringYouWhatYouNeed,
    context.wellGetRidOfYourOldItems,
    context.wellDeliverYourDonationsToThoseInNeed,
  ];
  return SizedBox(
    width: Width,
    height: Height / 1.5,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (index == 0) {
              FirstItemBottomSheetWidget(context);
            } else if (index == 1) {
              SecondItemBottomSheetWidget(
                context,
                topTitle: context.buyForMe,
                subTitle1: ' اختار المتجر وگول شتريد',
                subTitle2: ' نشتري ونوصّل الكي بفس اليوم',
                subTitle3: ' الدفع يصير عن طريق',
                onTap: () {
                  Get.toNamed(Routes.buyMeScreen);
                },
              );
            } else if (index == 2) {
              SecondItemBottomSheetWidget(
                context,
                topTitle: context.removeAndRecycle,
                subTitle1: 'حد أقصى ٣ متر مكعب لكل إعلان',
                subTitle2: 'حدد السعر المناسب وادفع بأمان داخل التطبيق',
                subTitle3: 'نقوم بالتحقق من عملية التدوير بالكامل',
                onTap: () {
                  Get.toNamed(Routes.removeAndRecycleServiceFeaturesScreen);
                  //removeAndRecycleServiceFeaturesScreen
                  // Add navigation or action
                },
              );
            } else if (index == 3) {
              context.showToast(
                msg: "4 element",
                bgColor: Colors.grey.shade300,
                textColor: Colors.black,
              );
            }
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 20.h),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            width: Width,
            decoration: BoxDecoration(
              color: context.colorsCustom.surfacePrimaryWhite,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: context.colorsCustom.CardBorder.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTaleCircleAvatarWidget(
                  backGroundColor: context.colorsCustom.BlueBlue,
                  img: ListImagesHome[index],
                  sizImg: 40.w,
                  sizeCircleAvatar: 30.w,
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: TextServiceWidget(
                    context,
                    color1: context.colorsCustom.TextPrimary,
                    text1: '${ListChooseServiceTitleText[index]}',
                    size1: 12.0.sp,
                    fontFamily1:
                        context.textStyles.labelMedium.medium.fontFamily,
                    color2: context.colorsCustom.TextSecondary,
                    text2: '${ListChooseServiceSubTitleText[index]}',
                    size2: 12.0.sp,
                    fontFamily2:
                        context.textStyles.labelMedium.regular.fontFamily,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
