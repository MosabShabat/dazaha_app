import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/my_ads/widgets/body_tab_bar_widget.dart';
import '../../../../features/my_ads/widgets/tab_bar_title_widget.dart';
import '../../../../features/my_ads/widgets/top_row_widget.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/transportation_and_delivery_controller.dart';

class TransportationAndDeliveryScreen extends StatelessWidget {
  TransportationAndDeliveryScreen({super.key});
  final TransportationAndDeliveryController transportController = Get.find();
  final OrderDataController orderDataController = Get.find();
  final RefreshController _refreshController = RefreshController();

  static const _statuses = ['', 'receiving_offers', 'in_progress', 'completed'];

  @override
  Widget build(BuildContext context) {
    transportController.resetControllerState();
    transportController.getMyOrders();

    transportController.scrollController.addListener(() {
      if (transportController.scrollController.position.extentAfter < 200) {
        transportController.loadMoreOrdersModel();
      }
    });

    return DefaultTabController(
      length: _statuses.length,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                orderDataController.setOfferStatus(
                  _statuses[tabController.index],
                );
                transportController.resetControllerState();
                transportController.refreshOrders();
              }
            });
          });

          return Scaffold(
            backgroundColor: context.colorsCustom.surfacePrimaryWhite,
            body: SafeArea(
              child: SmartRefresher(
                controller: _refreshController,
                onRefresh: () async {
                  transportController.resetControllerState();
                  await transportController.refreshOrders();
                  _refreshController.refreshCompleted();
                },
                header: CustomHeader(
                  builder: (context, status) => SizedBox(
                    height: 60.h,
                    child: AppSharedMethods.buildProgressViewWhite(
                      context,
                      false,
                    ),
                  ),
                ),
                child:
                    Column(
                          children: [
                            TopRowWidget(
                              context,
                              title: context.myAds,
                              size: 20.sp,
                              typeFilter: 0,
                              orderDataController: orderDataController,
                              style:
                                  context.textStyles.titleLarge.bold.fontFamily,
                              GridList: [
                                context.transportationAndDelivery,
                                context.buyForMe,
                                context.removeAndRecycle,
                                context.dedication,
                              ],
                              subTitle: context.ViewYourRequestsByServiceType,
                            ),
                            verticalSpace(10.h),
                            TabBarTitleWidget(
                              context,
                              secTap: context.receiveOffers,
                            ),
                            Expanded(
                              child: TabBarView(
                                children: List.generate(
                                  _statuses.length,
                                  (_) => BodyTabBarWidget(
                                    context,
                                    controller: transportController,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ).box
                        .width(Width)
                        .padding(
                          EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                        )
                        .color(context.colorsCustom.surfacePrimaryWhite)
                        .make(),
              ),
            ),
          );
        },
      ),
    );
  }
}
