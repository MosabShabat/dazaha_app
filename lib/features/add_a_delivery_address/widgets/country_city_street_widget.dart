import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/models/addresses/area_model.dart';
import '../../../core/network/models/addresses/city_model.dart';
import '../../../core/network/models/addresses/country_model.dart';
import '../controller/add_a_delivery_address_controller.dart';

Widget CountryCityStreetWidget(BuildContext context) {
  final AddADeliveryAddressController _addADelController = Get.find();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Obx(() {
        final countries = _addADelController.countries;
        if (countries.length == 1) {
          final country = countries.first;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_addADelController.selectedCountry.value?.uuid !=
                country.uuid) {
              _addADelController.selectedCountry.value = country;
              _addADelController.updateCities(country);
            }
          });
          return Container();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${context.selectCountry}',
              style: context.textStyles.bodyMedium.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
            verticalSpace(15.h),
            DropdownButton<CountryModel>(
                  isExpanded: true,
                  underline: SizedBox.shrink(),
                  value: _addADelController.selectedCountry.value,
                  hint: Text(
                    context.selectCountry,
                    style: context.textStyles.bodySmall.regular.copyWith(
                      color: context.colorsCustom.TextSecondary,
                    ),
                  ),
                  items: countries.map((country) {
                    return DropdownMenuItem(
                      value: country,
                      child: Text(
                        country.name ?? '',
                        style: context.textStyles.bodySmall.regular.copyWith(
                          color: context.colorsCustom.TextSecondary,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      _addADelController.updateCities(value);
                    }
                  },
                ).box
                .height(50.h)
                .border(color: context.colorsCustom.CardBorder, width: 1)
                .customRounded(BorderRadiusGeometry.circular(12.r))
                .padding(
                  EdgeInsetsGeometry.symmetric(horizontal: 8.w, vertical: 8.h),
                )
                .make(),
            verticalSpace(15.h),
          ],
        );
      }),

      Text(
        '${context.city}',
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(15.h),
      Obx(() {
        return DropdownButton<CityModel>(
              isExpanded: true,
              underline: SizedBox.shrink(),
              value: _addADelController.selectedCityModel.value,
              hint: Text(
                context.selectCity,
                style: context.textStyles.bodySmall.regular.copyWith(
                  color: context.colorsCustom.TextSecondary,
                ),
              ),
              items: _addADelController.selectedCity.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(
                    city.name ?? '',
                    style: context.textStyles.bodySmall.regular.copyWith(
                      color: context.colorsCustom.TextSecondary,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  _addADelController.updateAreas(value);
                }
              },
            ).box
            .height(50.h)
            .border(color: context.colorsCustom.CardBorder, width: 1)
            .customRounded(BorderRadiusGeometry.circular(12.r))
            .padding(
              EdgeInsetsGeometry.symmetric(horizontal: 8.w, vertical: 8.h),
            )
            .make();
      }),
      verticalSpace(15.h),
      Text(
        '${context.neighborhood}',
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(15.h),
      Obx(() {
        return DropdownButton<AreaModel>(
              isExpanded: true,
              underline: SizedBox.shrink(),
              value: _addADelController.selectedAreaModel.value,
              hint: Text(
                context.selectNeighborhood,
                style: context.textStyles.bodySmall.regular.copyWith(
                  color: context.colorsCustom.TextSecondary,
                ),
              ),
              items: _addADelController.selectedArea.map((area) {
                return DropdownMenuItem(
                  value: area,
                  child: Text(
                    area.name ?? '',
                    style: context.textStyles.bodySmall.regular.copyWith(
                      color: context.colorsCustom.TextSecondary,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                _addADelController.selectedAreaModel.value = value;
              },
            ).box
            .height(50.h)
            .border(color: context.colorsCustom.CardBorder, width: 1)
            .customRounded(BorderRadiusGeometry.circular(12.r))
            .padding(
              EdgeInsetsGeometry.symmetric(horizontal: 8.w, vertical: 8.h),
            )
            .make();
      }),
      verticalSpace(20.h),
    ],
  );
}
