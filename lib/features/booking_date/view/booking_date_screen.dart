import 'package:easy_localization/easy_localization.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/widgets/bottom_navigation_bar_widget.dart';
import '../../../core/widgets/custom_app_bar_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/booking_date_controller.dart';
import '../widgets/grid_view_day_booking_date_widget.dart';
import '../widgets/list_view_day_booking_date_widget.dart';
import '../widgets/select_time_text_widget.dart';

class BookingDateScreen extends StatelessWidget {
  final String? page;
  final Map<String, dynamic>? pageArgs;

  BookingDateScreen({required this.page, this.pageArgs});

  final BookingDateController _bookingDateController = Get.find();
  final OrderDataController _orderDataController = Get.find();

  factory BookingDateScreen.fromRoute() {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    return BookingDateScreen(
      page: args['page'] as String?,
      pageArgs: args['pageArgs'] as Map<String, dynamic>?,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: context.colorsCustom.surfacePrimaryWhite,
        appBar: CustomAppBarWidget(
          context,
          indexColor1: 0,
          indexColor2: 0,
          indexColor3: 0,
          indexColor4: 0,
          indexColor5: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _orderDataController.serviceName.value,
                        style: context.textStyles.titleLarge.bold.copyWith(
                          color: context.colorsCustom.TextPrimary,
                          fontSize: 20.sp,
                        ),
                      ),
                      verticalSpace(10.h),
                      _bookingDateController.isLoadingDays.isTrue
                          ? _buildDaysShimmer()
                          : ListViewDayBookingDateWidget(
                              context: context,
                              controller: _bookingDateController,
                              orderController: _orderDataController,
                            ),
                      verticalSpace(20.h),
                      SelectTimeTextWidget(context),
                      _bookingDateController.isLoadingTimes.isTrue
                          ? CustomShimmer(
                              width: Width.w,
                              height: 250.h,
                              borderRadius: 12.r,
                            )
                          : GridViewDayBookingDateWidget(
                              context,
                              controller: _bookingDateController,
                            ),
                    ],
                  ),
                ),
                BottomNavigationBarWidget(
                  horizontalPadding: 0.0,
                  text: context.continuation,
                  context,
                  GetScreen: _onContinuePressed,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildDaysShimmer() {
    return SizedBox(
      height: 0.1.sh,
      child: Row(
        children: List.generate(
          4,
          (index) => CustomShimmer(
            width: 60.w,
            height: 0.1.sh,
            borderRadius: 12.r,
          ).marginSymmetric(horizontal: 15.h),
        ),
      ),
    );
  }

  void _onContinuePressed() {
    if (_bookingDateController.selectedSlots.isEmpty) {
      showErrorSnackbar(
        Get.context!,
        Get.context!.pleaseSelectATimeSlot,
        FirstColor: Colors.amber,
      );

      return;
    }

    final selectedDayIndex = _bookingDateController.selectedIndex2.value;

    if (selectedDayIndex == 0) {
      final day = _bookingDateController.availableDays[0];
      _orderDataController.setData(DateFormat('yyyy-MM-dd').format(day));
    }

    _orderDataController.setTimeUuids(
      _bookingDateController.selectedSlots.toList(),
    );

    if (page == Routes.buyMeScreen && pageArgs == null) {
      Get.toNamed(Routes.buyMeScreen);
    } else if (page != null && page != Routes.buyMeScreen) {
      Get.toNamed(
        Routes.pickUpPointScreen,
        arguments: {'page': page, 'pageArgs': pageArgs, 'isAppBar': true},
      );
    } else {
      Get.snackbar("Error", "Target page not defined.");
    }
  }
}
