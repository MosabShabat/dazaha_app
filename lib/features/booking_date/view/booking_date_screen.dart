import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/custom_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/booking_date/widgets/grid_view_day_booking_date_widget.dart';
import 'package:dazaha_app/features/booking_date/widgets/list_view_day_booking_date_widget.dart';

class BookingDateScreen extends StatelessWidget {
  final String? page;
  final Map<String, dynamic>? pageArgs;

  const BookingDateScreen({super.key, required this.page, this.pageArgs});

  factory BookingDateScreen.fromRoute() {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    return BookingDateScreen(
      page: args['page'] as String?,
      pageArgs: args['pageArgs'] as Map<String, dynamic>?,
    );
  }

  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: BottomNavigationBarWidget(
        text: context.continuation,
        context,
        GetScreen: () {
          if (page != null) {
            Get.toNamed(
              Routes.pickUpPointScreen,
              arguments: {'page': page, 'pageArgs': pageArgs, 'isAppBar': true},
            );
          } else {
            // Optional fallback screen or warning
            Get.snackbar("Error", "Target page not defined.");
          }
        },
      ),
      body: GeneralScreenWidget(
        context,
        wid: [
          Text(
            context.transportationAndDelivery,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: context.textStyles.titleLarge.bold.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 20.sp,
            ),
          ),
          verticalSpace(10.h),
          ListViewDayBookingDateWidget(context: context),
          verticalSpace(20.h),
          GridViewDayBookingDateWidget(context),
        ],
      ),
    );
  }
}
