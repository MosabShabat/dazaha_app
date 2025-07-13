import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget SummaryListWidget() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: 3,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return ListTile(
        contentPadding: EdgeInsetsGeometry.all(0),
        leading: CircleAvatar(
          backgroundColor: context.colorsCustom.BluePrimary,
          radius: 20.w,
          child: Text(
            '${index + 1}',
            textAlign: TextAlign.start,
            maxLines: 1,
            style: context.textStyles.bodyMedium.medium.copyWith(
              color: context.colorsCustom.ButtonLabelPrimary,
            ),
          ),
        ),
        title: Text(
          'سكر ناعم أبيض تركي',
          textAlign: TextAlign.start,
          maxLines: 1,
          style: context.textStyles.bodyMedium.medium.copyWith(
            color: context.colorsCustom.TextPrimary,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              '3   ',
              textAlign: TextAlign.start,
              maxLines: 1,
              style: context.textStyles.labelSmall.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
            Text(
              '|   ',
              textAlign: TextAlign.start,
              maxLines: 1,
              style: context.textStyles.labelSmall.medium.copyWith(
                color: context.colorsCustom.CardBorder,
              ),
            ),
            Text(
              'كيلو',
              textAlign: TextAlign.start,
              maxLines: 1,
              style: context.textStyles.labelSmall.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
          ],
        ),
      ).box.padding(EdgeInsetsGeometry.symmetric(vertical: 10.h)).make();
    },
  );
}
