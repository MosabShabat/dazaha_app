import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'api_constants.dart';
import 'app_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<AppResponse> sendCode(@Field('mobile') String phoneNumber);

  @POST(ApiConstants.verifyCode)
  Future<AppResponse> verifyCode(
    @Field('mobile') String phoneNumber,
    @Field('code') String code,
    @Field('fcm_token') String fcmToken,
    @Field('device') String device,
  );

  //verifyCodeUpdateMobile

  @POST(ApiConstants.verifyCodeUpdateMobile)
  Future<AppResponse> verifyCodeUpdateMobile(
    @Field('mobile') String phoneNumber,
    @Field('code') String code,
  );

  @POST(ApiConstants.logout)
  Future<AppResponse> logout(@Field('fcm_token') String fcmToken);

  @POST(ApiConstants.register)
  Future<AppResponse> register(
    @Field('first_name') String firstName,
    @Field('last_name') String lastName,
    @Field('email') String email,
    @Field('mobile') String mobile,
    @Field('code') String code,
    @Field('fcm_token') String fcmToken,
    @Field('device') String device,
  );

  @GET(ApiConstants.aboutApp)
  Future<AppResponse> aboutApp();

  @GET(ApiConstants.joinAsDriver)
  Future<AppResponse> joinAsDriver();

  //joinAsDriver

  @GET(ApiConstants.privacyPolicy)
  Future<AppResponse> privacyPolicy();

  @GET(ApiConstants.termsConditions)
  Future<AppResponse> termsConditions();

  @POST(ApiConstants.online)
  Future<AppResponse> online();

  @GET(ApiConstants.profile)
  Future<AppResponse> profile();

  @GET(ApiConstants.faq)
  Future<AppResponse> getFAQ();

  @POST(ApiConstants.updateProfile)
  @MultiPart()
  Future<AppResponse> updateProfile(@Body() dio.FormData formData);

  @POST(ApiConstants.postJoinAsDriver)
  @MultiPart()
  Future<AppResponse> postJoinAsDriver(@Body() dio.FormData formData);
  //updateMobile
  @POST(ApiConstants.updateMobile)
  Future<AppResponse> sendCodeUpdateMobile(@Field('mobile') String phoneNumber);

  @GET('${ApiConstants.deliveryAddresses}')
  Future<AppResponse> deliveryAddresses({
    @Query('is_store') String? isStore,
    @Query('search') String? search,
  });

  @DELETE('${ApiConstants.deleteAddress}/{uuid}')
  Future<AppResponse> deleteAddress(@Path('uuid') String addressUuid);

  @GET(ApiConstants.requirements)
  @MultiPart()
  Future<AppResponse> requirements({
    @Query('with[]') List<String>? requirements,
  });

  @POST(ApiConstants.addAddress)
  Future<AppResponse> addAddress(
    @Field('name') String name,
    @Field('city_uuid') String cityUuid,
    @Field('area_uuid') String areaUuid,
    @Field('street') String street,
    @Field('mobile') String mobile,
    @Field('lat') String lat,
    @Field('lng') String lng,
  );

  @POST('${ApiConstants.addressDetails}/{uuid}/update')
  Future<AppResponse> updateAddress(
    @Path('uuid') String uuid,
    @Field('name') String name,
    @Field('city_uuid') String cityUuid,
    @Field('area_uuid') String areaUuid,
    @Field('street') String street,
    @Field('mobile') String mobile,
    @Field('lat') String lat,
    @Field('lng') String lng,
  );

  @GET('${ApiConstants.addressDetails}/{uuid}')
  Future<AppResponse> getAddressDetails(@Path('uuid') String addressUuid);

  @POST(ApiConstants.reportProblem)
  @MultiPart()
  Future<AppResponse> reportProblem(@Body() dio.FormData formData);

  @GET(ApiConstants.notifications)
  Future<AppResponse> getNotifications(@Query('page') int page);

  @GET('${ApiConstants.chats}/{uuid}')
  Future<AppResponse> getMessages(@Path('uuid') String receiverUuid);

  @POST('${ApiConstants.chats}/{uuid}')
  @MultiPart()
  Future<AppResponse> sendMessage(
    @Path('uuid') String receiverUuid,
    @Body() dio.FormData formData,
  );

  @GET(ApiConstants.chats)
  Future<AppResponse> getChats();

  @GET(ApiConstants.deleteAccount)
  Future<AppResponse> deleteAccountInfo();

  @POST(ApiConstants.deleteAccountSend)
  Future<AppResponse> deleteAccountSend();

  @GET(ApiConstants.home)
  Future<AppResponse> getHome(
    @Query('lat') String lat,
    @Query('lng') String lng,
  );

  @GET(ApiConstants.timesApi)
  Future<AppResponse> getTime(@Query('date') String date);

  @GET(ApiConstants.postOrders)
  Future<AppResponse> getOrders();

  @MultiPart()
  @POST(ApiConstants.postOrders)
  Future<AppResponse> createOrder(@Body() FormData formData);

  @GET(ApiConstants.summaryOrders)
  Future<AppResponse> summaryOrders();

  @POST(ApiConstants.summaryOrders)
  Future<AppResponse> summaryPostOrders({
    @Field('order_uuid') String? orderUuid,
    @Field('liked_price') String? likedPrice,
  });

  @POST(ApiConstants.confirmOrders)
  Future<AppResponse> confirmOrders(@Field('order_uuid') String orderUuid);

  @GET('${ApiConstants.ordersUrl}')
  Future<AppResponse> getOrdersAll({
    @Query('service_uuid') String? serviceUuid,
    @Query('status') String? status,
    @Query('search') String? search,
    @Query('page') int page = 1,
  });

  @GET('${ApiConstants.ordersUrl}/{uuid}')
  Future<AppResponse> getOrderDetails(
    @Path('uuid') String orderUuid,
    @Query('lat') String? lat,
    @Query('lng') String? lng,
  );

  @GET('${ApiConstants.offers}/{uuid}')
  Future<AppResponse> getOfferDetails(@Path('uuid') String orderUuid);

  @PUT('${ApiConstants.offers}/{uuid}/update_state')
  Future<AppResponse> putState(
    @Path('uuid') String orderUuid,
    @Query('state') String state,
  );

  @POST('${ApiConstants.addOffer}/{uuid}/add_offer')
  Future<AppResponse> AddOffer(
    @Path('uuid') String orderUuid,
    @Field('time_uuid') String timeUuid,
    @Field('price') String price,
  );

  @POST('${ApiConstants.addOffer}/update_offer')
  Future<AppResponse> updateOffer(
    @Field('offer_uuid') String offerUuid,
    @Field('time_uuid') String timeUuid,
    @Field('price') String price,
  );

  @POST(ApiConstants.depositPay)
  Future<AppResponse> depositPay({@Field('amount') required String amount});

  @POST(ApiConstants.withdrawalPay)
  Future<AppResponse> withdrawalPay({@Field('amount') required String amount});

  @GET('${ApiConstants.myOrder}/{uuid}')
  Future<AppResponse> getMyOrderDetails(@Path('uuid') String orderUuid);

  @DELETE('${ApiConstants.myOrder}/{uuid}')
  Future<AppResponse> deleteOrder(@Path('uuid') String orderUuid);

  @GET('${ApiConstants.myOrder}/{uuid}/offers')
  Future<AppResponse> getMyOrderOffers(
    @Path('uuid') String orderUuid,
    @Query('order_by') String orderBy, {
    @Query('page') int page = 1,
  });

  @POST('{rating_type}/{uuid}/rating')
  Future<AppResponse> postRating(
    @Path('rating_type') String ratingType,
    @Path('uuid') String orderUuid,
    @Query('rating') String rating,
  );

  @GET('${ApiConstants.offers}')
  Future<AppResponse> getOffers({
    @Query('service_uuid') String? serviceUuid,
    @Query('status') String? status,
    @Query('search') String? search,
    @Query('page') int page = 1,
  });

  @GET('${ApiConstants.payMentUrl}')
  Future<AppResponse> getPayMent(
    @Query('order_uuid') String? orderUuid,
    @Query('offer_uuid') String? offerUuid,
    @Query('coupon_code') String? couponCode,
  );

  @POST(ApiConstants.payUrl)
  Future<AppResponse> pay(
    @Field('order_uuid') String? orderUuid,
    @Field('offer_uuid') String? offerUuid,
    @Field('payment_way_uuid') String? paymentWayUuid,
    @Field('coupon_code') String? couponCode,
  );

  @GET('${ApiConstants.myOrder}')
  Future<AppResponse> getMyOrders({
    @Query('service_uuid') String? serviceUuid,
    @Query('status') String? status,
    @Query('search') String? search,
    @Query('page') int page = 1,
  });

  @GET('${ApiConstants.introUrl}')
  Future<AppResponse> getIntro({@Query('service_uuid') String? serviceUuid});

  @GET('${ApiConstants.wallet}')
  Future<AppResponse> getWallet({
    @Query('page') int page = 1,
    @Query('type') String? type,
    @Query('status') String? status,
  });

  //introUrl

  @DELETE('${ApiConstants.addOffer}{uuid}')
  Future<AppResponse> deleteOffer(@Path('uuid') String offerUuid);

  //ApiConstants.postOrders
}

enum OrderActionType {
  summaryPostOrders, // مع order_uuid و liked_price
  summaryOrders, // بدون بيانات
  confirmOrders, // مع order_uuid
}
