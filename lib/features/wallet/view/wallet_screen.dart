import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
// import '../../../../features/my_ads/widgets/top_row_widget.dart';
import '../../../../features/wallet/widgets/top_box_widget.dart';
import '../../../../features/wallet/widgets/wallet_move_ment_list_widget.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/widgets/progress_view_white.dart';
import '../controller/wallet_controller.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});

  final WalletController _walletController = Get.find();

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
                        : Column(
                            children: [
                              verticalSpace(10.h),
                              // TopRowWidget(
                              //   context,
                              //   title: context.recordMovements,
                              //   size: 14.sp,
                              //   fontWeight: FontWeight.w700,

                              //   style: context.textStyles.titleSmall.bold.fontFamily,
                              //   GridList: [
                              //     context.income,
                              //     context.withdrawABalance,
                              //     context.successful,
                              //     context.failed,
                              //   ],
                              //   subTitle: '${context.selectTheTransactionTypeAndStatus}',
                              // ),
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
