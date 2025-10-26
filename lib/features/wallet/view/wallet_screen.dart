import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/wallet/widgets/top_box_widget.dart';
import '../../../../features/wallet/widgets/wallet_move_ment_list_widget.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/widgets/progress_view_white.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../my_ads/widgets/top_row_widget.dart';
import '../controller/wallet_controller.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});

  final WalletController _walletController = Get.find();
  final OrderDataController orderDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    _walletController.getWallet();
    _walletController.scrollController.addListener(() {
      if (_walletController.scrollController.position.extentAfter < 300) {
        _walletController.loadMoRerecordTransactionsModel();
      }
    });

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: Container(
        width: Width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBoxWidget(context, controller: _walletController),
            Expanded(
              child: SmartRefresher(
                scrollController: _walletController.scrollController,
                controller: _walletController.refreshController,
                onRefresh: () {
                  _walletController.resetControllerState();
                  _walletController.refreshController.refreshCompleted();
                },
                physics: ClampingScrollPhysics(),
                header: CustomHeader(
                  builder: (BuildContext context, RefreshStatus? status) {
                    return Container(
                      height: 60.h,
                      color: context.colorsCustom.surfacePrimaryWhite,
                      child: AppSharedMethods.buildProgressViewWhite(
                        context,
                        false,
                      ),
                    );
                  },
                ),
                child: SingleChildScrollView(
                  child: Obx(() {
                    return _walletController.isLoading.isTrue
                        ? Container(
                            height: Height / 2,
                            color: context.colorsCustom.surfacePrimaryWhite,
                            child: Center(
                              child: ProgressViewWhite(context, false),
                            ),
                          )
                        : _walletController
                              .walletModel!
                              .value
                              .recordTransactionsModel!
                              .isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  AppAssets.json.the_financial_empty_json,
                                  width: 300.w,
                                  height: 300.w,
                                ),
                                verticalSpace(20.h),
                                Text(
                                  context.dataEmpty,
                                  textAlign: TextAlign.center,
                                  style: context.textStyles.titleLarge.bold
                                      .copyWith(
                                        color: context
                                            .colorsCustom
                                            .surfacePrimaryBlack,
                                      ),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              verticalSpace(10.h),
                              TopRowWidget(
                                context,
                                title: context.recordMovements,
                                size: 20.sp,
                                style: context
                                    .textStyles
                                    .titleLarge
                                    .bold
                                    .fontFamily,
                                GridList: [
                                  context.income,
                                  context.withdrawABalance,
                                  context.successful,
                                  context.failed,
                                ],
                                subTitle: context.ViewYourRequestsByServiceType,
                                selectedIndex: _walletController.selectedIndex,
                                onTapSel: (index) =>
                                    _walletController.changeSelect(index),
                                onPress: () =>
                                    _walletController.selectedIndex.value = 0,
                                onTep: () {
                                  final status = switch (_walletController
                                      .selectedIndex
                                      .value) {
                                    0 => 'wallet_deposit',
                                    1 => 'wallet_withdrawal',
                                    2 => 'paid',
                                    _ => 'failed',
                                  };
                                  orderDataController.setFilterType(
                                    '${status}',
                                  );
                                  orderDataController.setFilterNum(
                                    '${_walletController.selectedIndex.value}',
                                  );
                                  _walletController.refreshWallet();
                                  Navigator.pop(context);
                                },
                              ),
                              WalletMoveMentListWidget(
                                context,
                                controller: _walletController,
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 16.w);
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
