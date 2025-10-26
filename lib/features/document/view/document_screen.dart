import '../../../../core/helpers/constants.dart';
import '../../../../features/captain_joins/widgets/join_cap_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/document/widgets/tab_bar__my_offer_widget.dart';
import '../../../../features/my_ads/widgets/tab_bar_title_widget.dart';
import '../../../../features/my_ads/widgets/top_row_widget.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../captain_membership_request/widgets/mem_cap_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/document_controller.dart';

class DocumentScreen extends StatelessWidget {
  DocumentScreen({super.key});

  final DocumentController documentController = Get.find();
  final OrderDataController orderDataController = Get.find();
  final RefreshController refreshController = RefreshController();
  static const _statuses = ['', 'pending', 'in_progress', 'completed'];

  @override
  Widget build(BuildContext context) {
    if (AppConstants.isDriver != '0' && AppConstants.isDriver != '2') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        documentController.resetControllerState();
        documentController.getOffers();
      });

      documentController.scrollController.addListener(() {
        if (documentController.scrollController.position.extentAfter < 200) {
          documentController.loadMoreOrdersModel();
        }
      });
    }
    return AppConstants.isDriver == '1'
        ? DefaultTabController(
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
                      documentController.resetControllerState();
                      documentController.refreshOrders();
                    }
                  });
                });

                return Scaffold(
                  backgroundColor: context.colorsCustom.surfacePrimaryWhite,
                  body: SafeArea(
                    child: SmartRefresher(
                      controller: refreshController,
                      onRefresh: () async {
                        documentController.resetControllerState();
                        await documentController.refreshOrders();
                        refreshController.refreshCompleted();
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
                                    style: context
                                        .textStyles
                                        .titleLarge
                                        .bold
                                        .fontFamily,
                                    GridList: [
                                      context.transportationAndDelivery,
                                      context.buyForMe,
                                      context.removeAndRecycle,
                                      context.dedication,
                                    ],
                                    subTitle:
                                        context.ViewYourRequestsByServiceType,
                                    selectedIndex:
                                        documentController.selectedIndex,
                                    onTapSel: (index) =>
                                        documentController.changeSelect(index),
                                    onPress: () =>
                                        documentController.selectedIndex.value =
                                            0,

                                    onTep: () {
                                      final uuid = switch (documentController
                                          .selectedIndex
                                          .value) {
                                        0 =>
                                          '69fb5c27-11ef-4637-986f-ed484b388c7f',
                                        1 =>
                                          '9cc543c0-793c-43d9-88a6-6e3db6082ef5',
                                        2 =>
                                          '7f625412-ca00-431d-a7fd-12863fc851ef',
                                        _ =>
                                          '153a7042-eb9e-42b8-9d5c-498623adb5da',
                                      };
                                      orderDataController.setServiceUuid(uuid);
                                      documentController.refreshOrders();
                                      Navigator.pop(context);
                                    },
                                  ),
                                  verticalSpace(10.h),
                                  TabBarTitleWidget(
                                    context,
                                    secTap: context.myOffers,
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: List.generate(
                                        _statuses.length,
                                        (_) => TabBarMyOfferWidget(
                                          context,
                                          controller: documentController,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ).box
                              .width(Width)
                              .padding(
                                EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 16.h,
                                ),
                              )
                              .color(context.colorsCustom.surfacePrimaryWhite)
                              .make(),
                    ),
                  ),
                );
              },
            ),
          )
        : AppConstants.isDriver == '2'
        ? MemCapWidget(context)
        : JoinCapWidget(context);
  }
}
