import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/RectangleReviewWidget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/track_your_flight_first_show_widget.dart';

Widget TrackYourFlightWidget(BuildContext context, {required isShow}) {
  return isShow ? TrackYourFlightFirstShowWidget(context) : RectangleReviewWidget(context);
}

