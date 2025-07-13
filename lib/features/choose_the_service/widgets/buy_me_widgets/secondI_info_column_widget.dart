import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/spacing.dart';
import 'package:dazaha_app/features/choose_the_service/widgets/dev_det_widget.dart';

Widget SecondInfoColumnWidget(
  BuildContext context, {
  required text1,
  required text2,
  required text3,
}) {
  return Column(
    children: [
      verticalSpace(20.h),
      DevDetWidget(context, text: text1),
      verticalSpace(20.h),
      DevDetWidget(context, text: text2),
      verticalSpace(20.h),
      DevDetWidget(context, text: text3),
    ],
  );
}
