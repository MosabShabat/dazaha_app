import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../../core/widgets/progress_view_white.dart';
import '../../../core/widgets/custom_scroll_app_bar_widget.dart';
import '../controller/my_ad_pay_ment_controller.dart';

import '../../../features/my_ad_pay_ment/widgets/cat_row_pay_widget.dart';
import '../../../features/my_ad_pay_ment/widgets/dis_coupon_widget.dart';
import '../../../features/my_ad_pay_ment/widgets/final_pay_info_widget.dart';
import '../../../features/my_ad_pay_ment/widgets/pay_button_widget.dart';
import '../../../features/my_ad_pay_ment/widgets/pay_met_widget.dart';

class MyAdPayMentScreen extends StatelessWidget {
  MyAdPayMentScreen({super.key});

  final MyAdPayMentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.isTrue
          ? _buildLoading(context)
          : _buildMainScreen(context);
    });
  }

  /// واجهة التحميل
  Widget _buildLoading(BuildContext context) {
    return Container(
      width: Width.w,
      height: Height.h,
      color: context.colorsCustom.surfacePrimaryWhite,
      child: Center(child: ProgressViewWhite(context, false)),
    );
  }
  //71cb3c36-8cc5-447d-aea2-6f0374ec806b
  //c3ef5909-7093-4c4e-96fc-aea71b2fb061

  /// الشاشة الرئيسية
  Widget _buildMainScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: CustomScrollAppBarWidget(
        context,
        text: context.payment,
        h: 100.h,
      ),
      bottomNavigationBar: SafeArea(
        child: PayButtonWidget(
          context,
          controller: controller,
        ).paddingOnly(bottom: 15.h, right: 16.w, left: 16.w),
      ),
      body: GeneralScreenWidget(
        context,
        wid: [PaymentContentWidget(controller: controller)],
      ),
    );
  }
}

/// ويدجت خاص بمحتوى الشاشة
class PaymentContentWidget extends StatelessWidget {
  final MyAdPayMentController controller;

  const PaymentContentWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true, // ✅ يخلي الـ ListView ياخد ارتفاع المحتوى فقط
      physics:
          const NeverScrollableScrollPhysics(), // ✅ يمنع التضارب مع Scroll خارجي
      children: [
        CatRowPayWidget(controller: controller),
        verticalSpace(25.h),
        DisCouponWidget(context, controller: controller),
        verticalSpace(25.h),
        PayMetWidget(context, controller: controller),
        verticalSpace(20.h),
        FinalPayInfoWidget(context, controller: controller),
        verticalSpace(25.h),
      ],
    );
  }
}
