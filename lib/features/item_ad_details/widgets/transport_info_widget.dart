  import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget TransportInfoWidget(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'نقل قنفة 3 مقاعد، وطاولة سفرة خشب.',
                    style: context.textStyles.titleMedium.bold.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                  verticalSpace(10.h),
                  Text(
                    '${context.transportationAndDelivery}',
                    style: context.textStyles.labelMedium.medium.copyWith(
                      color: context.colorsCustom.TextSecondary,
                    ),
                  ),
                  verticalSpace(10.h),
                  Text(
                    'الكنبة كبيرة وتحتاج فان أو سيارة تحميل. الطاولة قابلة للفك، بس وزنها تقيل شوي وتحتاج حذر بالنقل.',
                    style: context.textStyles.labelMedium.medium.copyWith(
                      color: context.colorsCustom.TextSecondary,
                    ),
                  ),
                ],
              );
  }