import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/spacing.dart';
import 'package:dazaha_app/features/choose_the_service/widgets/dev_det_widget.dart';

Widget FirstInfoColumnWidget(BuildContext context) {
  return Column(
    children: [
      verticalSpace(20.h),
      DevDetWidget(context, text: ' نقل أي شيء من A إلى B'),
      verticalSpace(20.h),
      DevDetWidget(context, text: ' التوصيل في نفس اليوم'),
    ],
  );
}
