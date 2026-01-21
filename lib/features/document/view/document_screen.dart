import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/constants.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../home/controller/home_controller.dart';
import '../../my_ads/widgets/tab_bar_title_widget.dart';
import '../../my_ads/widgets/top_row_widget.dart';
import '../controller/document_controller.dart';
import '../../captain_joins/widgets/center_not_driver_widget.dart';
import '../../captain_membership_request/widgets/mem_cap_widget.dart';
import '../widgets/tab_bar__my_offer_widget.dart';

class DocumentScreen extends StatelessWidget {
  DocumentScreen({super.key});

  final DocumentController documentController = Get.put(
    DocumentController(),
    permanent: true,
  );
  final OrderDataController orderDataController = Get.find();
  final UserStateController userStateController =
      Get.find<UserStateController>();

  static const _statuses = ['pending', 'in_progress', 'completed'];

  @override
  Widget build(BuildContext context) {
    final driverStatus = userStateController.isDriver.value;

    if (driverStatus == 1) {
      return DefaultTabController(
        length: _statuses.length,
        child: Builder(
          builder: (context) {
            final tabController = DefaultTabController.of(context);

            // ✅ الانتقال للتبويب المطلوب بعد بناء الواجهة لأول مرة فقط
            WidgetsBinding.instance.addPostFrameCallback((_) {
              documentController.refreshOrders();
              if (documentController.tabIndex >= 0 &&
                  documentController.tabIndex < _statuses.length) {
                tabController.animateTo(documentController.tabIndex);
              }
            });

            // ✅ مستمع لتغيير التبويب
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                orderDataController.setOfferStatus(
                  _statuses[tabController.index],
                );
                documentController.refreshOrders();
              }
            });

            return WillPopScope(
              onWillPop: () async {
                final navigationController = Get.find<HomeController>();

                // رجوع للتبويب الرئيسي (Home = index 0)
                navigationController.selectedIndex.value = 0;

                return false; // منع النظام من الخروج من الشاشة
              },

              child: Scaffold(
                backgroundColor: context.colorsCustom.surfacePrimaryWhite,
                body: SafeArea(
                  child: Column(
                    children: [
                      TopRowWidget(
                        context,
                        isWallet: false,
                        title: context.myOffers,
                        size: 20.sp,
                        style: context.textStyles.titleLarge.bold.fontFamily,
                        GridList: [
                          context.transportationAndDelivery,
                          context.buyForMe,
                          context.removeAndRecycle,
                          context.dedication,
                        ],
                        subTitle: context.ViewYourRequestsByServiceType,
                        selectedIndex: documentController.selectedIndex,
                        onTapSel: (index) =>
                            documentController.changeSelect(index),
                        onPress: () {
                          orderDataController.setServiceUuid('');
                          documentController.resetControllerState();
                          documentController.refreshOrders();
                          Navigator.pop(context);
                        },
                        onTep: () {
                          final uuid =
                              switch (documentController.selectedIndex.value) {
                                0 => '69fb5c27-11ef-4637-986f-ed484b388c7f',
                                1 => '9cc543c0-793c-43d9-88a6-6e3db6082ef5',
                                2 => '7f625412-ca00-431d-a7fd-12863fc851ef',
                                _ => '153a7042-eb9e-42b8-9d5c-498623adb5da',
                              };
                          orderDataController.setServiceUuid(uuid);
                          documentController.resetControllerState();
                          documentController.refreshOrders();
                          Navigator.pop(context);
                        },
                      ),
                      verticalSpace(10),
                      TabBarTitleWidget(context, secTap: context.onHold),
                      Expanded(
                        child: TabBarView(
                          children: List.generate(_statuses.length, (index) {
                            return TabBarMyOfferWidget(
                              controller: documentController,
                              key: ValueKey(
                                index,
                              ), // منع إعادة استخدام الـ Widget
                            );
                          }),
                        ),
                      ),
                    ],
                  ).paddingAll(16),
                ),
              ),
            );
          },
        ),
      );
    } else if (driverStatus == 2) {
      return MemCapWidget(context);
    } else {
      return CenterNotDriverWidget(context);
    }
  }
}
