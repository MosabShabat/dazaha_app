import '../../../../core/constant/exports_libraries.dart';
import 'RectangleReviewWidget.dart';
import 'track_your_flight_first_show_widget.dart';

Widget TrackYourFlightWidget(
  BuildContext context, {
  required isShow,
  required BottomText,
  required isShowBo,
  required VoidCallback page,
  required rating,
}) {
  print('@@@@@@@@@@@@@ $isShow @@@@@@@@@@@@');
  return isShow == 'in_progress'
      ? TrackYourFlightFirstShowWidget(
          context,
          BottomText: BottomText,
          isShow: isShowBo,
          page: page,
        )
      : RectangleReviewWidget(context, rating: rating);
}
