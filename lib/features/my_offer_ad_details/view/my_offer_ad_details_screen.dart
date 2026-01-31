import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/helpers/app_shared_methods.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../features/my_offer_ad_details/controller/my_offer_ad_details_controller.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/general_screen_widget.dart';
import '../../../../core/widgets/image_list_view_builder_widget.dart';
import '../../../../features/advertisement_summary/widgets/address_widget.dart';
import '../../../../features/advertisement_summary/widgets/map_widget.dart';
import '../../../../features/item_ad_details/widgets/advertiser_row_widget.dart';
import '../../../../features/item_ad_details/widgets/transport_info_widget.dart';
import '../../../../features/my_ads_details/widgets/top_det_row_widget.dart';
import '../../../../features/my_offer_ad_details/widgets/my_offer_app_bar_widget.dart';
import '../../../../features/my_offer_ad_details/widgets/presented_offer_box_widget.dart';
import '../../../core/widgets/login_required_bottom_sheet/view/login_required_bottom_sheet.dart';
import '../../home/controller/home_controller.dart';
import '../../my_ads_details/widgets/invoice_box_widget.dart';
import '../../my_ads_details/widgets/pay_mth_widget.dart';
import '../../my_ads_details/widgets/t_d_del_widget.dart';
import '../../my_ads_details/widgets/tob_column_widget.dart';
import '../../my_ads_details/widgets/track_your_flight_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../summary/widgets/summary_list_widget.dart';
import '../widgets/offer_details_shimmer_widget.dart';

class MyOfferAdDetailsScreen extends StatelessWidget {
  MyOfferAdDetailsScreen({super.key});

  final MyOfferAdDetailsController controller = Get.find();
  final OrderDataController orderDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.isTrue) {
        return OfferDetailsShimmerWidget();
      }

      final offerDetails = controller.offerDetailsItem!.value;

      // تحديد نوع الخدمة حسب UUID
      switch (offerDetails.order!.serviceUuid) {
        case '69fb5c27-11ef-4637-986f-ed484b388c7f':
          orderDataController.setServiceNumber('0');
          break;
        case '9cc543c0-793c-43d9-88a6-6e3db6082ef5':
          orderDataController.setServiceNumber('1');
          break;
        case '7f625412-ca00-431d-a7fd-12863fc851ef':
          orderDataController.setServiceNumber('2');
          break;
        default:
          orderDataController.setServiceNumber('3');
      }
      orderDataController.setFrom(offerDetails.order!.from ?? '');
      orderDataController.setFromAddress(offerDetails.order!.fromAddress ?? '');
      orderDataController.setFromLat(offerDetails.order!.fromLat ?? '');
      orderDataController.setFromLng(offerDetails.order!.fromLng ?? '');
      orderDataController.setTo(offerDetails.order!.to ?? '');
      orderDataController.setToAddress(offerDetails.order!.toAddress ?? '');
      orderDataController.setToLat(offerDetails.order!.toLat ?? '');
      orderDataController.setToLng(offerDetails.order!.toLng ?? '');
      orderDataController.setUserImage(offerDetails.order!.user!.image ?? '');
      orderDataController.setUserName(offerDetails.order!.user!.fullName ?? '');
      orderDataController.setStateCase(offerDetails.state ?? '');

      orderDataController.setUserMobile(
        '${offerDetails.order!.user!.mobile ?? ''}',
      );
      orderDataController.setUserRate(
        '${offerDetails.order!.user!.ratingPercentage ?? ''}',
      );
      orderDataController.setUserUuid(
        '${offerDetails.order!.user!.uuid ?? ''}',
      );
      AppConstants.userName = '${offerDetails.order!.user!.fullName ?? ''}';
      AppConstants.orderId = '${offerDetails.order!.orderId ?? ''}';
      AppConstants.orderTitle = '${offerDetails.order!.title ?? ''}';
      AppConstants.userImage = '${offerDetails.order!.user!.image ?? ''}';
      AppConstants.uuid = '${offerDetails.order!.user!.uuid ?? ''}';
      AppConstants.PutStatUuid = '${offerDetails.uuid ?? ''}';

      //83595a2a-5556-4bef-9f18-f8caca2964f2
      //706852ce-20ed-4ef1-a76d-bdde6a1abe07
      return WillPopScope(
        onWillPop: () async {
          if (AppConstants.screenName == 'allAds') {
            Get.toNamed(Routes.allAdsScreen);
          } else {
            HomeController homeController = Get.find<HomeController>();
            homeController.extraTabIndex.value =
                offerDetails.status == 'completed'
                ? 2
                : offerDetails.status == 'in_progress'
                ? 1
                : 0;
            print('offerOrOrder here 2');
            print('offerOrOrder here 2 :${homeController.extraTabIndex.value}');

            Get.offAllNamed(
              Routes.homeScreen,
              arguments: {
                'selectedIndex': 3,
                'tabIndex': offerDetails.status == 'completed'
                    ? 2
                    : offerDetails.status == 'in_progress'
                    ? 1
                    : 0,
              },
            );
            //  Get.offAllNamed(Routes.homeScreen, arguments: {'selectedIndex': 3});
          }

          return false;
        },
        child: Scaffold(
          backgroundColor: context.colorsCustom.surfacePrimaryWhite,
          appBar: MyOfferAppBarWidget(
            context,
            offerOrOrder: 'offer',
            uuid: offerDetails.uuid ?? '',
            status: offerDetails.status ?? '',
            price: offerDetails.price,
            curr: offerDetails.currency,
            timeLen: offerDetails.order!.times!.length,
            timeItem: offerDetails.order!.times!,
            backStatus: offerDetails.status ?? '',
            doneController: controller.doneController,
            statusBack: 'hhh',
          ),
          body: SafeArea(
            child: GeneralScreenWidget(
              context,
              verH: 0.0,
              wid: [
                offerDetails.status == 'canceled'
                    ? TobColumnWidget(
                        context,
                        horizontalPadding: 0.w,
                        orderIdCreatedAt:
                            '${offerDetails.order!.orderId ?? ''}, ${context.published} ${offerDetails.addedAt ?? ''}',
                        status: offerDetails.status ?? '',
                        statusText: offerDetails.statusText ?? '',
                        image: offerDetails.order!.images![0].image,
                        priceCurr:
                            '${offerDetails.order!.likedPrice ?? ''} ${offerDetails.order!.currency ?? ''}',
                        serviceTitle: offerDetails.order!.serviceTitle ?? '',
                        title: offerDetails.order!.title ?? '',
                        uuid: offerDetails.order!.uuid ?? '',
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TopDetRowWidget(
                            context,
                            isShow: false,
                            title: offerDetails.status == 'pending'
                                ? context.offerDetails
                                : context.adDetails,
                            status: offerDetails.status,
                            statusText: offerDetails.statusText,
                            subTitle:
                                '${offerDetails.order!.orderId} , ${context.published} ${offerDetails.addedAt}',
                          ),
                          verticalSpace(10.h),

                          // الصور
                          orderDataController.isItemsService
                              ? CachedNetworkImage(
                                  imageUrl: offerDetails.order!.image!,
                                  width: 360.w,
                                  height: 175.h,
                                  fit: BoxFit.fill,
                                )
                              : ImageListViewBuilderWidget(
                                  context,
                                  imagesLen: offerDetails.order!.images!.length,
                                  imagesItem: offerDetails.order!.images!,
                                ),
                          verticalSpace(15.h),

                          // حالة العرض
                          offerDetails.status == 'pending'
                              ? PresentedOfferBoxWidget(
                                  context,
                                  price:
                                      '${offerDetails.price} ${offerDetails.order!.currency}',
                                )
                              : TrackYourFlightWidget(
                                  context,
                                  isShow: offerDetails.status,
                                  BottomText: offerDetails.state == 'pending'
                                      ? context.startTheJourney
                                      : offerDetails.state == 'started'
                                      ? context.iArrivedHome
                                      : offerDetails.state == 'delivered'
                                      ? context.endTheTrip
                                      : '',
                                  isShowBo: true,
                                  rating: offerDetails.rating,
                                  page: () => Get.toNamed(
                                    Routes.myOfferAdDetailsScreen,
                                    arguments: {'isShow': false},
                                  ),
                                ),
                          verticalSpace(20.h),

                          // معلومات النقل
                          TransportInfoWidget(
                                context,
                                title: offerDetails.order!.title ?? '',
                                serviceName:
                                    offerDetails.order!.serviceTitle ?? '',
                                description:
                                    offerDetails.order!.description ?? '',
                              ).box
                              .alignment(
                                AppSharedMethods.isAppLanguageArabic()
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                              )
                              .make(),
                          verticalSpace(20.h),

                          // وقت التسليم
                          TDDelWidget(
                            context,
                            title: orderDataController.getTimeTitle(context),
                            Fz: 16.sp,
                            date: '${offerDetails.order!.date ?? ''}',
                            time: '${offerDetails.time ?? ''}',
                          ),
                          verticalSpace(15.h),

                          // قائمة العناصر
                          if (orderDataController.isItemsService)
                            SummaryListWidget(
                              context,
                              itemsLen: offerDetails.order!.items!.length,
                              itemsDet: offerDetails.order!.items!,
                            ),
                          verticalSpace(10.h),

                          // العنوان
                          AddressWidget(
                            isShow: false,
                            fromLat: offerDetails.order!.fromLat ?? '',
                            fromLng: offerDetails.order!.fromLng ?? '',
                            toLat: offerDetails.order!.toLat ?? '',
                            toLng: offerDetails.order!.toLng ?? '',
                            isShowMet:
                                offerDetails.order!.receiptMethod != null,
                            from: offerDetails.order!.from ?? '',
                            fromAddress: offerDetails.order!.fromAddress ?? '',
                            helpers: '${offerDetails.order!.helpers ?? ''}',
                            receiptMethodDec:
                                offerDetails.order!.receiptMethod?.description,
                            receiptMethodImage:
                                offerDetails.order!.receiptMethod?.image,
                            receiptMethodTitle:
                                offerDetails.order!.receiptMethod?.title,
                            sizeTitle: offerDetails.order!.size!.title ?? '',
                            sizeImg: offerDetails.order!.size!.image ?? '',
                            to: offerDetails.order!.to ?? '',
                            toAddress: offerDetails.order!.toAddress ?? '',
                            orderDataController: orderDataController,
                          ),
                          verticalSpace(10.h),

                          // الخريطة
                          MapWidget(
                            fromAddress: offerDetails.order!.fromAddress ?? '',
                            fromLat: offerDetails.order!.fromLat ?? '',
                            fromLng: offerDetails.order!.fromLng ?? '',
                            toAddress: offerDetails.order!.toAddress ?? '',
                            toLat: offerDetails.order!.toLat ?? '',
                            toLng: offerDetails.order!.toLng ?? '',
                          ),
                          verticalSpace(10.h),

                          // معلن الإعلان
                          AdvertiserRowWidget(
                            context,
                            uuid: offerDetails.order!.user!.uuid ?? '',
                            image: offerDetails.order!.user!.image ?? '',
                            name: offerDetails.order!.user!.fullName ?? '',
                            orderCount:
                                offerDetails.order!.user!.ordersCount ?? '',
                            rating:
                                offerDetails.order!.user!.ratingPercentage ??
                                '',
                            isMe: false,
                          ),
                          verticalSpace(20.h),

                          // الدفع والفواتير
                          if (offerDetails.status != 'pending') ...[
                            PayMthWidget(
                              context,
                              cardNumber:
                                  offerDetails
                                      .order!
                                      .payment!
                                      .paymentCardNumber ??
                                  '',
                              cardType:
                                  offerDetails.order!.payment!.paymentWayText ??
                                  '',
                            ),
                            verticalSpace(20.h),
                            InvoiceBoxWidget(
                              context,
                              offerDetails.order!.payment!,
                            ),
                            verticalSpace(30.h),
                          ],

                          // تقرير مشكلة
                          GeneralBottomAppWidget(
                            context,
                            text: context.reportAProblem,
                            onTap: () {
                              if (AppConstants.userToken.isNotEmpty &&
                                  AppConstants.userToken != '' &&
                                  AppConstants.userUUid.isNotEmpty &&
                                  AppConstants.userUUid != '') {
                                Get.toNamed(
                                  Routes.reportAProblemScreen,
                                  arguments: {
                                    'referenceType': '',
                                    'referenceUuid': '',
                                  },
                                );
                              } else {
                                showLoginRequiredBottomSheet(Get.context!);
                              }
                            },
                            backgroundColorB:
                                context.colorsCustom.CardBackgroundLightGray,
                            fontWeight: FontWeight.w500,
                            textColorB: context.colorsCustom.TextPrimary,
                          ),
                          verticalSpace(20.h),
                        ],
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
