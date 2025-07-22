import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/RectangleReviewWidget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/track_your_flight_first_show_widget.dart';

Widget TrackYourFlightWidget(
  BuildContext context, {
  required isShow,
  required BottomText,
  required isShowBo,
  required VoidCallback  page,
}) {
  print('@@@@@@@@@@@@@ $page @@@@@@@@@@@@');
  return isShow
      ? TrackYourFlightFirstShowWidget(
          context,
          BottomText: BottomText,
          isShow: isShowBo,
          page: page,
        )
      : RectangleReviewWidget(context);
}
