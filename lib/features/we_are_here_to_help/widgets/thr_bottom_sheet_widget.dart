import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/top_con_bot_sh_widget.dart';
import 'package:dazaha_app/features/we_are_here_to_help/controller/we_are_here_to_help_controller.dart';

Future<dynamic> ThrBottomSheetWidget(BuildContext context) {
  WeAreHereToHelpController controller = Get.put(WeAreHereToHelpController());
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return Container(
        width: Width.w,
        height: 750.h,
        color: context.colorsCustom.surfacePrimaryWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(10.h),
            TopConBotShWidget(context).box.alignCenter.make(),
            verticalSpace(10.h),
            Text(
              context.frequentlyAskedQuestions,
              style: context.textStyles.bodyLarge.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
                fontSize: 20.sp,
              ),
            ).paddingSymmetric(horizontal: 16.w),
            verticalSpace(10.h),
            Expanded(
              child: Obx(() {
                return SingleChildScrollView(
                  child: ExpansionPanelList(
                    elevation: 0,
                    dividerColor: context.colorsCustom.surfacePrimaryWhite,
                    expandedHeaderPadding: EdgeInsets.zero,
                    expansionCallback: (index, isExpanded) {
                      controller.isExpandedList[index] =
                          !controller.isExpandedList[index];
                    },
                    children: List.generate(faqs.length, (index) {
                      return ExpansionPanel(
                        canTapOnHeader: true,
                        isExpanded: controller.isExpandedList[index],
                        backgroundColor: controller.isExpandedList[index]
                            ? context.colorsCustom.CardBackgroundLightGray
                            : context.colorsCustom.surfacePrimaryWhite,
                        headerBuilder: (context, isExpanded) {
                          return Container(
                            color: controller.isExpandedList[index]
                                ? context.colorsCustom.CardBackgroundLightGray
                                : context.colorsCustom.surfacePrimaryWhite,
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child:
                                Text(
                                  faqs[index]['question']!,
                                  style: context.textStyles.bodySmall.medium
                                      .copyWith(
                                        color: context.colorsCustom.TextPrimary,
                                      ),
                                ).paddingSymmetric(
                                  vertical: 12.h,
                                  horizontal: 16.w,
                                ),
                          );
                        },
                        body: Container(
                          width: double.infinity,
                          color: context.colorsCustom.CardBackgroundLightGray,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 10.h,
                          ),
                          child: Text(
                            faqs[index]['answer']!,
                            textAlign: TextAlign.start,
                            style: context.textStyles.bodySmall,
                          ).paddingSymmetric(vertical: 12.h, horizontal: 16.w),
                        ),
                      );
                    }),
                  ),
                );
              }),
            ),
          ],
        ),
      );
    },
  );
}

final List<Map<String, String>> faqs = [
  {
    "question": "شـلون أطلب توصيل؟",
    "answer":
        "أي شي تقريبًا! تگدر توصل:\n\nأثاث بيت :قنفة، كراسي، طاولات، مرتبة، دولاب، بانكة.\n\nأجهزة كهربائية : طباخ، ثلاجة، غسالة، تلفزيون.\n\nشغلات يومية : جيسان طحين، دبة مي، كراتين، سطل، أدوات تنظيف.\n\nأغراض شخصية :دراجة، شنط، حقائب، أو حتى مشتريات من السوق.\n\nكميات تجارية صغيرة : صناديق، مواد مخزونة، تجهيزات بسيطة للمحل.",
  },
  {
    "question": "شنو نوع الأغراض اللي أكدر أوصلها؟",
    "answer":
        "أي شي تقريبًا! تگدر توصل:\n\nأثاث بيت :قنفة، كراسي، طاولات، مرتبة، دولاب، بانكة.\n\nأجهزة كهربائية : طباخ، ثلاجة، غسالة، تلفزيون.\n\nشغلات يومية : جيسان طحين، دبة مي، كراتين، سطل، أدوات تنظيف.\n\nأغراض شخصية :دراجة، شنط، حقائب، أو حتى مشتريات من السوق.\n\nكميات تجارية صغيرة : صناديق، مواد مخزونة، تجهيزات بسيطة للمحل.",
  },
  {
    "question": "السعر ثابت لو أني أختاره؟",
    "answer":
        "أي شي تقريبًا! تگدر توصل:\n\nأثاث بيت :قنفة، كراسي، طاولات، مرتبة، دولاب، بانكة.\n\nأجهزة كهربائية : طباخ، ثلاجة، غسالة، تلفزيون.\n\nشغلات يومية : جيسان طحين، دبة مي، كراتين، سطل، أدوات تنظيف.\n\nأغراض شخصية :دراجة، شنط، حقائب، أو حتى مشتريات من السوق.\n\nكميات تجارية صغيرة : صناديق، مواد مخزونة، تجهيزات بسيطة للمحل.",
  },
  {
    "question": "شـلون أعرف إذا أحد أخذ طلبي؟",
    "answer":
        "أي شي تقريبًا! تگدر توصل:\n\nأثاث بيت :قنفة، كراسي، طاولات، مرتبة، دولاب، بانكة.\n\nأجهزة كهربائية : طباخ، ثلاجة، غسالة، تلفزيون.\n\nشغلات يومية : جيسان طحين، دبة مي، كراتين، سطل، أدوات تنظيف.\n\nأغراض شخصية :دراجة، شنط، حقائب، أو حتى مشتريات من السوق.\n\nكميات تجارية صغيرة : صناديق، مواد مخزونة، تجهيزات بسيطة للمحل.",
  },
  {
    "question": "أكو طريقة أتابع بيها التوصيل؟",
    "answer":
        "أي شي تقريبًا! تگدر توصل:\n\nأثاث بيت :قنفة، كراسي، طاولات، مرتبة، دولاب، بانكة.\n\nأجهزة كهربائية : طباخ، ثلاجة، غسالة، تلفزيون.\n\nشغلات يومية : جيسان طحين، دبة مي، كراتين، سطل، أدوات تنظيف.\n\nأغراض شخصية :دراجة، شنط، حقائب، أو حتى مشتريات من السوق.\n\nكميات تجارية صغيرة : صناديق، مواد مخزونة، تجهيزات بسيطة للمحل.",
  },
  {
    "question": "شـلون أعدل على الطلب؟",
    "answer":
        "أي شي تقريبًا! تگدر توصل:\n\nأثاث بيت :قنفة، كراسي، طاولات، مرتبة، دولاب، بانكة.\n\nأجهزة كهربائية : طباخ، ثلاجة، غسالة، تلفزيون.\n\nشغلات يومية : جيسان طحين، دبة مي، كراتين، سطل، أدوات تنظيف.\n\nأغراض شخصية :دراجة، شنط، حقائب، أو حتى مشتريات من السوق.\n\nكميات تجارية صغيرة : صناديق، مواد مخزونة، تجهيزات بسيطة للمحل.",
  },
];
