import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/advertisement_summary/widgets/list_tile_advertisement_summary_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

class AddressWidget extends StatelessWidget {
  final bool isShow;
  final bool isShowMet;
  final String fromAddress;
  final String from;
  final String toAddress;
  final String to;
  final String fromLat;
  final String fromLng;
  final String toLat;
  final String toLng;
  final String? receiptMethodImage;
  final String? receiptMethodTitle;
  final String? receiptMethodDec;
  final String sizeTitle;
  final String? sizeImg;
  final String helpers;
  final OrderDataController orderDataController;

  const AddressWidget({
    Key? key,
    required this.isShow,
    required this.isShowMet,
    required this.fromAddress,
    required this.from,
    required this.toAddress,
    required this.toLat,
    required this.fromLat,
    required this.fromLng,
    required this.toLng,
    required this.to,
    this.receiptMethodImage,
    this.receiptMethodTitle,
    this.receiptMethodDec,
    required this.sizeTitle,
    this.sizeImg,
    required this.helpers,
    required this.orderDataController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDeliveryService = orderDataController.isDeliveryService;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.address,
          style: context.textStyles.titleMedium.medium.copyWith(
            color: context.colorsCustom.TextPrimary,
          ),
        ),
        verticalSpace(10.h),

        // Receipt Point
        Text(
          context.receiptPoint,
          style: context.textStyles.bodySmall.medium.copyWith(
            color: context.colorsCustom.TextSecondary,
          ),
        ),
        verticalSpace(10.h),
        ListTileAdvertisementSummaryWidget(
          context,
          isSvgImage: true,
          img: AppAssets.svgs.marker_a_icon,
          title: fromAddress,
          subTitle: from,
          isShow: true,
          isMap: true,
          lng: fromLng,
          lat: fromLat,
        ),
        verticalSpace(10.h),

        // Delivery Point
        if (isDeliveryService) ...[
          Text(
            context.deliveryPoint,
            style: context.textStyles.bodySmall.medium.copyWith(
              color: context.colorsCustom.TextSecondary,
            ),
          ),
          verticalSpace(15.h),
          ListTileAdvertisementSummaryWidget(
            context,
            isSvgImage: true,
            img: AppAssets.svgs.marker_b_icon,
            title: toAddress,
            subTitle: to,
            lng: toLng,
            lat: toLat,
            isShow: true,
            isMap: true,
          ),
        ],

        // Receipt Method
        if (isShowMet && isDeliveryService) ...[
          verticalSpace(10.h),
          Text(
            context.receiptMethod,
            style: context.textStyles.bodySmall.medium.copyWith(
              color: context.colorsCustom.TextSecondary,
            ),
          ),
          verticalSpace(10.h),
          ListTileAdvertisementSummaryWidget(
            context,
            isSvgImage: false,
            img: receiptMethodImage ?? '',
            title: receiptMethodTitle ?? '',
            subTitle: receiptMethodDec ?? '',
            isShow: true,
            isMap: false,
          ),
        ],

        // Size & Helpers
        if (isShow) ...[
          verticalSpace(10.h),
          Text(
            context.sizeOfItems,
            style: context.textStyles.bodySmall.medium.copyWith(
              color: context.colorsCustom.TextSecondary,
            ),
          ),
          ListTileAdvertisementSummaryWidget(
            context,
            img: sizeImg ?? '',
            title: sizeTitle,
            subTitle: '',
            isShow: false,
            isSvgImage: false,
            isMap: false,
          ),
          if (!orderDataController.serviceNumber.value.contains('1')) ...[
            Text(
              context.assistants,
              style: context.textStyles.bodySmall.medium.copyWith(
                color: context.colorsCustom.TextSecondary,
              ),
            ),
            verticalSpace(10.h),
            ListTileAdvertisementSummaryWidget(
              context,
              img: AppAssets.svgs.people_icon,
              title: '$helpers ${context.assistants}',
              subTitle: '',
              isShow: false,
              isSvgImage: true,
              isMap: false,
            ),
          ],
        ],
      ],
    );
  }
}
