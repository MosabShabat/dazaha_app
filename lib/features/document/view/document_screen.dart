import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/document/widgets/tab_bar__my_offer_widget.dart';
import '../../../../features/my_ads/widgets/tab_bar_title_widget.dart';
import '../../../../features/my_ads/widgets/top_row_widget.dart';
import '../../../core/helpers/app_shared_methods.dart';
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
    documentController.resetControllerState();
    documentController.getOffers();
    documentController.scrollController.addListener(() {
      if (documentController.scrollController.position.extentAfter < 200) {
        documentController.loadMoreOrdersModel();
      }
    });
    // // ✅ استدعاء مرة واحدة بعد أول رسم للشاشة
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (!documentController.initialized) {
    //     documentController.resetControllerState();
    //     documentController.getOffers();

    //     documentController.scrollController.addListener(() {
    //       if (documentController.scrollController.position.extentAfter < 200) {
    //         documentController.loadMoreOrdersModel();
    //       }
    //     });

    //     documentController.initialized = true; // flag داخل الكنترولر
    //   }
    // });

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
                              title: context.myOffers,
                              size: 20.sp,
                              typeFilter: 1,
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
    );
  }
}
