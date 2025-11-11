import '../../../../core/widgets/app_snackbar.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/latest_announcements_widget.dart';
import '../../../../core/widgets/top_con_bot_sh_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/wallet_controller.dart';

Future<dynamic> WalletFilterWidget(
  BuildContext context, {
  required String subTitle,
  required VoidCallback onPress,
  required VoidCallback onTep,
}) {
  final OrderDataController orderDataController = Get.find();
  final WalletController walletController = Get.find();

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (_) => SingleChildScrollView(
      child: SafeArea(
        child:
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopConBotShWidget(context).box.alignCenter.make(),
                    verticalSpace(10.h),
                    LatestAnnouncementsRowWidget(
                      context,
                      text: context.filter,
                      size: 16.sp,
                      fontFamily:
                          context.textStyles.bodyLarge.medium.fontFamily,
                      onPressed: onPress,
                      Widget: Text(
                        context.reset,
                        style: context.textStyles.headlineSmall.regular
                            .copyWith(
                              color: context.colorsCustom.TextSecondary,
                              fontSize: 12.sp,
                            ),
                      ),
                    ),
                    verticalSpace(35.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // اختيار تاريخ البداية
                        Obx(
                          () => GestureDetector(
                            onTap: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now().subtract(
                                  const Duration(days: 180),
                                ), // 6 شهور
                                lastDate: DateTime.now(),
                              );
                              if (picked != null) {
                                orderDataController.setFromDate(
                                  picked.toIso8601String(),
                                );
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: context.colorsCustom.surfacePrimaryWhite,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${context.fromText} :',
                                    style: context.textStyles.bodyMedium,
                                  ),
                                  verticalSpace(10.h),
                                  const Icon(
                                    Icons.calendar_today_outlined,
                                    size: 20,
                                  ),
                                  verticalSpace(10.h),
                                  Text(
                                    orderDataController.fromDate.isEmpty
                                        ? '${context.chooseStartDate}'
                                        : '${context.fromText}: ${orderDataController.fromDate.split('T')[0]}',
                                    style: context.textStyles.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        verticalSpace(15.h),

                        // اختيار تاريخ النهاية
                        Obx(
                          () => GestureDetector(
                            onTap: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now().subtract(
                                  const Duration(days: 180),
                                ),
                                lastDate: DateTime.now(),
                              );
                              if (picked != null) {
                                orderDataController.setToDate(
                                  picked.toIso8601String(),
                                );
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: context.colorsCustom.surfacePrimaryWhite,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${context.toText} :',
                                    style: context.textStyles.bodyMedium,
                                  ),
                                  verticalSpace(10.h),

                                  const Icon(
                                    Icons.calendar_today_outlined,
                                    size: 20,
                                  ),
                                  verticalSpace(10.h),
                                  Text(
                                    orderDataController.toDate.isEmpty
                                        ? context.chooseEndDate
                                        : '${context.toText}: ${orderDataController.toDate.split('T')[0]}',
                                    style: context.textStyles.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    verticalSpace(Width * 0.15),

                    // زر الفلترة
                    GeneralBottomAppWidget(
                      context,
                      text: context.filter,
                      onTap: () {
                        // تحقق من التواريخ
                        if (orderDataController.fromDate.isEmpty ||
                            orderDataController.toDate.isEmpty) {
                          showErrorSnackbar(
                            context,
                            context.selectDatesError,
                            FirstColor: Colors.amber,
                          );
                          // AppSnackBar.showError(
                          //   ,
                          // );
                          return;
                        }

                        // التحقق من أن المدة لا تتجاوز 6 شهور
                        final from = DateTime.parse(
                          '${orderDataController.fromDate.value}',
                        );
                        final to = DateTime.parse(
                          '${orderDataController.toDate.value}',
                        );
                        final duration = to.difference(from).inDays;
                        if (duration > 180) {
                          showErrorSnackbar(
                            context,
                            context.dateRangeError,
                            FirstColor: Colors.amber,
                          );
                          // AppSnackBar.showError(
                          //   'المدى الزمني لا يمكن أن يتجاوز 6 شهور',
                          // );
                          return;
                        }

                        // تطبيق الفلترة
                        walletController.refreshWallet();
                        Get.back();
                      },
                    ),
                  ],
                ).box
                .color(context.colorsCustom.surfacePrimaryWhite)
                .padding(EdgeInsets.symmetric(horizontal: 20.w, vertical: 20))
                .width(Width)
                .make(),
      ),
    ),
  );
}
