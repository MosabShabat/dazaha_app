import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/booking_date/controller/booking_date_controller.dart';

class BookingDateBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> BookingDateController());
  }
}