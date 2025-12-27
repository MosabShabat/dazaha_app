import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/exports_widgets.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../home/controller/home_controller.dart';
import '../controller/transportation_and_delivery_controller.dart';
import '../../../../features/my_ads/widgets/body_tab_bar_widget.dart';
import '../../../../features/my_ads/widgets/tab_bar_title_widget.dart';
import '../../../../features/my_ads/widgets/top_row_widget.dart';

class TransportationAndDeliveryScreen extends StatelessWidget {
  TransportationAndDeliveryScreen({super.key});

  final TransportationAndDeliveryController transportController = Get.put(
    TransportationAndDeliveryController(),
    permanent: true,
  );

  final OrderDataController orderDataController = Get.find();

  static const _statuses = ['receiving_offers', 'in_progress', 'completed'];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      transportController.resetControllerState();
      transportController.getMyOrders();
    });

    return DefaultTabController(
      length: _statuses.length,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (transportController.tabIndex >= 0 &&
                transportController.tabIndex < _statuses.length) {
              tabController.animateTo(transportController.tabIndex);
            }
          });
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              orderDataController.setOfferStatus(
                _statuses[tabController.index],
              );
              transportController.resetControllerState();
              transportController.refreshOrders();
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
                      title: context.myAds,
                      size: 20.sp,
                      isWallet: false,
                      style: context.textStyles.titleLarge.bold.fontFamily,
                      GridList: [
                        context.transportationAndDelivery,
                        context.buyForMe,
                        context.removeAndRecycle,
                        context.dedication,
                      ],
                      subTitle: context.ViewYourRequestsByServiceType,
                      selectedIndex: transportController.selectedIndex,
                      onTapSel: (index) =>
                          transportController.changeSelect(index),
                      onPress: () =>
                          transportController.selectedIndex.value = 0,
                      onTep: () {
                        final uuid =
                            switch (transportController.selectedIndex.value) {
                              0 => '69fb5c27-11ef-4637-986f-ed484b388c7f',
                              1 => '9cc543c0-793c-43d9-88a6-6e3db6082ef5',
                              2 => '7f625412-ca00-431d-a7fd-12863fc851ef',
                              _ => '153a7042-eb9e-42b8-9d5c-498623adb5da',
                            };
                        orderDataController.setServiceUuid(uuid);
                        transportController.resetControllerState();
                        transportController.refreshOrders();
                        Navigator.pop(context);
                      },
                    ),
                    verticalSpace(10.h),
                    TabBarTitleWidget(context, secTap: context.receiveOffers),
                    Expanded(
                      child: TabBarView(
                        children: List.generate(_statuses.length, (index) {
                          // لكل تبويب، اعط RefreshController مستقل
                          return BodyTabBarWidget(
                            controller: transportController,
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
  }
}
