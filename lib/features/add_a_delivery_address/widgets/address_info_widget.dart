import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/add_a_delivery_address/widgets/country_city_street_widget.dart';
import '../../../features/auth/register/widgets/cus_register_info_widget.dart';
// import '../../../features/add_a_delivery_address/widgets/loc_map_widget.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../auth/login/widgets/login_text_field_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';
import '../controller/add_a_delivery_address_controller.dart';

class AddressInfoWidget extends StatelessWidget {
  final AddADeliveryAddressController controller = Get.find();

  final SavedDeliveryAddressesController _savedDeliveryAddressesController =
      Get.find();

  final bool isEdit;
  final String? addressUuid;
  final bool goBackAfterSave;

  AddressInfoWidget({super.key, goBackAfterSave})
    : isEdit =
          Get.arguments != null && Get.arguments[AppConstants.isEdit] == true,
      addressUuid = Get.arguments != null
          ? Get.arguments[AppConstants.addressUuid]
          : null,
      goBackAfterSave = Get.arguments != null
          ? (Get.arguments['goBackAfterSave'] ?? false)
          : false;

  @override
  Widget build(BuildContext context) {
    // حالة التعديل ننتظر تحميل التفاصيل
    if (isEdit) {
      return Obx(() {
        if (controller.isDetailsLoading.value) {
          return Center(
            child: CircularProgressIndicator().box
                .width(Width.w)
                .height(Height.h * 0.7)
                .alignCenter
                .make(),
          );
        }
        return _buildForm(context); // كود النموذج كامل
      });
    }

    // حالة الإضافة مباشرة بدون Obx
    return _buildForm(context);
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CusRegisterInfoWidget(
          context,
          titleText: context.placeName,
          titleTextColor: context.colorsCustom.TextPrimary,
          HintText: context.placeName,
          maxLength: null,
          maxLines: null,
          controller: controller.placeNameController,
          keyboardType: TextInputType.name,
        ),
        CountryCityStreetWidget(context),
        CusRegisterInfoWidget(
          context,
          titleText: context.street,
          titleTextColor: context.colorsCustom.TextPrimary,
          HintText: context.enterStreetName,
          maxLength: null,
          maxLines: null,
          controller: controller.StreetController,
          keyboardType: TextInputType.name,
        ),
        Text(
          '${context.mobileNumber}',
          style: context.textStyles.bodyMedium.medium.copyWith(
            color: context.colorsCustom.TextPrimary,
          ),
        ),
        verticalSpace(15.h),
        LoginTextFieldWidget(
          context,
          controller: controller.phoneController,
          textAlign: 'null',
        ),
        verticalSpace(15.h),
        Text(
          context.locationOnMap,
          textAlign: TextAlign.start,
          maxLines: 1,
          style: context.textStyles.bodyMedium.medium.copyWith(
            color: context.colorsCustom.TextSecondary,
          ),
        ),
        verticalSpace(15.h),
        buildLocationSavedButton(context, controller),
        verticalSpace(50.h),
        Obx(() {
          return AppLoadingButton(
            text: context.saveAddress,
            onPressed: () async {
              controller.validateInput(
                context,
                isEdit: isEdit,
                addressUuid: addressUuid,
              );
              _savedDeliveryAddressesController.fetchAddresses();
              // if (goBackAfterSave) {
              //   Get.back(result: true); // <-- العودة إلى PickUpPointScreen
              // }
              // Get.back(result: true);
            },
            isLoading: controller.isButtonPressed.value,
            isEnabled: !controller.isButtonPressed.value,

            isWhiteProgress: true,
          );
        }),
        verticalSpace(20.h),
        // LocMapWidget(context),
      ],
    );
  }
}

Widget buildLocationSavedButton(
  BuildContext context,
  AddADeliveryAddressController controller, {
  isAppBar,
}) {
  OrderDataController orderDataController = Get.find();

  return Obx(
    () => AppTextButton(
      context,
      buttonHeight: 52.h,
      buttonText: controller.locationName.isNotEmpty
          ? controller.locationName.value
          : context.selectLocation,
      svgIconPathEnd: AppAssets.svgs.location_add_icon,
      svgColor: context.colorsCustom.TextSecondary,
      onPressed: () async {
        // اذهب لاختيار الموقع على الخريطة
        final result = await Get.toNamed(Routes.selectALocationOnTheMapScreen);

        if (result != null) {
          final lat = result[AppConstants.lat];
          final lng = result[AppConstants.lng];
          final placeName = result[AppConstants.placeName];
          //              name == '' || name == null ? '${context.unknownPlace}' : name,
          final lastName = placeName == '' || placeName == null
              ? '${context.unknownPlace}'
              : placeName;
          // حدّث قيمة الزر
          controller.updateLocation(lat, lng, lastName);
          print('==========BBB===========');
          print('isAppBar : $isAppBar');
          print(
            'orderDataController.SrvType.value : ${orderDataController.SrvType.value}',
          );
        }
      },
      hasBorder: true,
      borderColor: context.colorsCustom.CardBorder,
      textStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w300,
        color: context.colorsCustom.TextSecondary,
        fontFamily: 'Tajawal',
      ),
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      mainAxisAlignment: MainAxisAlignment.start,
      enableHover: false,
    ),
  );
}

Widget buildLocationButton(
  BuildContext context,
  AddADeliveryAddressController controller, {
  isAppBar,
}) {
  OrderDataController orderDataController = Get.find();

  return Obx(
    () => AppTextButton(
      context,
      buttonHeight: 52.h,
      buttonText: controller.locationName.isNotEmpty
          ? controller.locationName.value
          : context.selectLocation,
      svgIconPathEnd: AppAssets.svgs.location_add_icon,
      svgColor: context.colorsCustom.TextSecondary,
      onPressed: () async {
        // اذهب لاختيار الموقع على الخريطة
        final result = await Get.toNamed(Routes.selectALocationOnTheMapScreen);

        if (result != null) {
          final lat = result[AppConstants.lat];
          final lng = result[AppConstants.lng];
          final placeName = result[AppConstants.placeName];
          //              name == '' || name == null ? '${context.unknownPlace}' : name,
          final lastName = placeName == '' || placeName == null
              ? '${context.unknownPlace}'
              : placeName;
          // حدّث قيمة الزر
          controller.updateLocation(lat, lng, lastName);
          print('==========BBB===========');
          print('isAppBar : $isAppBar');
          print(
            'orderDataController.SrvType.value : ${orderDataController.SrvType.value}',
          );
          if (orderDataController.SrvType.value == '1') {
            orderDataController.setToLat('$lat');
            orderDataController.setToLng('$lng');
            orderDataController.setToAddress('$lastName');
            orderDataController.setServiceUuid(
              orderDataController.serviceUuid.value,
            );
            orderDataController.setData(orderDataController.data.value);
            orderDataController.setToDeliveryAddressUuid(
              orderDataController.toDeliveryAddressUuid.value,
            );

            print('UUUUUUUUUUUUUUUUUUUTo Here :UUUUUUUUUUUUUUUUUUUU');
            print(orderDataController.toLat.value);
            print(orderDataController.toLng.value);
            print(orderDataController.toAddress.value);
            print(orderDataController.serviceUuid.value);
            print(orderDataController.data.value);
            print(orderDataController.toDeliveryAddressUuid.value);
            print('UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU');
          } else {
            if (isAppBar != null) {
              if (isAppBar == true) {
                orderDataController.setFromLat('$lat');
                orderDataController.setFromLng('$lng');
                orderDataController.setFromAddress('$lastName');
                orderDataController.setServiceUuid(
                  orderDataController.serviceUuid.value,
                );
                orderDataController.setData(orderDataController.data.value);
                orderDataController.setFromDeliveryAddressUuid(
                  orderDataController.fromDeliveryAddressUuid.value,
                );

                print('UUUUUUUUUUUUUUUUUUFromUUUUUUUUUUUUUUUUUUUUU');
                print(orderDataController.fromLat.value);
                print(orderDataController.fromLng.value);
                print(orderDataController.fromAddress.value);
                print(orderDataController.serviceUuid.value);
                print(orderDataController.data.value);
                print(orderDataController.fromDeliveryAddressUuid.value);

                print('UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU');
              } else {
                orderDataController.setToLat('$lat');
                orderDataController.setToLng('$lng');
                orderDataController.setToAddress('$lastName');
                orderDataController.setServiceUuid(
                  orderDataController.serviceUuid.value,
                );
                orderDataController.setData(orderDataController.data.value);
                orderDataController.setToDeliveryAddressUuid(
                  orderDataController.toDeliveryAddressUuid.value,
                );

                print('UUUUUUUUUUUUUUUUUUUToooooooooooooUUUUUUUUUUUUUUUUUUUU');
                print(orderDataController.toLat.value);
                print(orderDataController.toLng.value);
                print(orderDataController.toAddress.value);
                print(orderDataController.serviceUuid.value);
                print(orderDataController.data.value);
                print(orderDataController.toDeliveryAddressUuid.value);
                print('UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU');
              }
            }
          }
        }
      },
      hasBorder: true,
      borderColor: context.colorsCustom.CardBorder,
      textStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w300,
        color: context.colorsCustom.TextSecondary,
        fontFamily: 'Tajawal',
      ),
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      mainAxisAlignment: MainAxisAlignment.start,
      enableHover: false,
    ),
  );
}
