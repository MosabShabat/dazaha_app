import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/my_ads_details/widgets/presenter_info_widget.dart';
import '../../../core/widgets/progress_view_white.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/my_ads_details_controller.dart';
import 'accept_cat_bottom_sheet/accept_bottom_sheet_widget.dart';

class TabBodyWidget extends StatefulWidget {
  final MyAdsDetailsController controller;
  TabBodyWidget(this.context, {super.key, required this.controller});

  final BuildContext context;

  @override
  State<TabBodyWidget> createState() => _TabBodyWidgetState();
}

class _TabBodyWidgetState extends State<TabBodyWidget> {
  late final RefreshController _tabRefreshController;
  OrderDataController orderDataController = Get.find();

  @override
  void initState() {
    super.initState();
    _tabRefreshController = RefreshController();
  }

  @override
  void dispose() {
    _tabRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    Widget _loading() => Center(
      child: Padding(
        padding: EdgeInsets.only(top: Height / 6),
        child: ProgressViewWhite(context, false),
      ),
    );

    Widget _emptyData() => Center(
      child: Padding(
        padding: EdgeInsets.only(top: Height / 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAssets.json.process_json,
              width: 101.w,
              height: 101.w,
            ),
            verticalSpace(20.h),
            Text(
              context.dataEmpty,
              textAlign: TextAlign.center,
              style: context.textStyles.titleLarge.bold.copyWith(
                color: context.colorsCustom.surfacePrimaryBlack,
              ),
            ),
          ],
        ),
      ),
    );

    Widget _offerItem(itemDet) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: itemDet.driver?.image ?? '',
                fit: BoxFit.cover,
                height: 100.w,
                width: 100.w,
              ),
            ),
            horizontalSpace(5.w),
            PresenterInfoWidget(
              context,
              image: itemDet.driver?.image ?? '',
              name: itemDet.driver?.name ?? '',
              rate: itemDet.driver?.rate ?? '',
              addedAt: itemDet.addedAt ?? '',
              addedTime: itemDet.dateTime ?? '',
              priceCurr: '${itemDet.price ?? ''} ${itemDet.currency ?? ''}',
              uuid: itemDet.uuid ?? '',
              userUuid: itemDet.driver?.uuid ?? '',
            ),
          ],
        ).onTap(() {
          orderDataController.setItemUuid('${itemDet.uuid ?? ''}');
          AcceptBottomSheetWidget(
            context,
            name: itemDet.driver?.name ?? '',
            rate: itemDet.driver?.rate ?? '',
            addedAt: itemDet.dateTime ?? '',
            priceCurr: '${itemDet.price ?? ''} ${itemDet.currency ?? ''}',
            uuid: itemDet.uuid ?? '',
            image: itemDet.driver?.image ?? '',
          );
        }),
        verticalSpace(10.h),
        Divider(color: context.colorsCustom.CardBorder, thickness: 1),
      ],
    );

    return Obx(() {
      if (controller.isOffersLoading.isTrue) return _loading();
      if (controller.offersList.isEmpty) return _emptyData();

      return SizedBox(
        height: 400.h,
        child: SmartRefresher(
          controller: _tabRefreshController,
          enablePullUp: true,
          physics: const BouncingScrollPhysics(),
          onRefresh: () async {
            controller.offersList.clear();
            controller.getMyOrderOffers("created_at");
            _tabRefreshController.refreshCompleted();
          },
          onLoading: () async {
            // هنا يمكنك إضافة منطق تحميل المزيد لاحقًا
            _tabRefreshController.loadComplete();
          },
          child: ListView.builder(
            itemCount: controller.offersList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                _offerItem(controller.offersList[index]),
          ),
        ),
      );
    });
  }
}
