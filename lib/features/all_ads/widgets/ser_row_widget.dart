  import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/my_ads/widgets/search_text_field_widget.dart';

Widget SerRowWidget(BuildContext context) {
    return Row(
      children: [
        SearchTextFieldWidget(context).box.width(300.w).height(45.w).make(),
        horizontalSpace(10.w),
        Center(child: SvgPicture.asset(AppAssets.svgs.setting_4_icon)).box
            .width(45.w)
            .height(45.w)
            .customRounded(BorderRadiusGeometry.circular(8.r))
            .border(color: context.colorsCustom.CardBorder)
            .make(),
      ],
    );
  }