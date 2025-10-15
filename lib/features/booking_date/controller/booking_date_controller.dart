import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/network/models/times_data.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/app_response.dart';
import 'booking_data_repo.dart';

class BookingDateController extends GetxController {
  final BookingDataRepo bookingDataRepo = Get.find();

  // أيام متاحة من اليوم وحتى 30 يوم للأمام
  RxList<DateTime> availableDays = <DateTime>[].obs;

  // اليوم المختار (واحد فقط)
  Rxn<DateTime> selectedDay = Rxn<DateTime>();

  // مؤشر اليوم المختار (تستخدمه في الواجهة لديك)
  RxInt selectedIndex2 = 0.obs;

  // الأوقات المتاحة لليوم المختار (قائمة من TimesData)
  RxList<TimesData> availableTimes = <TimesData>[].obs;

  // الأوقات المختارة (يمكن اختيار أكثر من واحد)
  var selectedSlots = <String>{}.obs;

  void toggleSlot(String id) {
    if (selectedSlots.contains(id)) {
      selectedSlots.remove(id);
    } else {
      selectedSlots.add(id);
    }

    selectedSlots.refresh(); // تحديث الـ observable يدوياً
    print('Selected time slots: $selectedSlots');
  }

  // حالات تحميل
  RxBool isLoadingDays = false.obs;
  RxBool isLoadingTimes = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadDays();
    // نحدد اليوم الأول (اليوم الحالي) تلقائياً
    if (availableDays.isNotEmpty) {
      selectDayByIndex(0);
    } else {
      // في حال loadDays لاحقًا (مثلاً async) تأكد أن تستدعي selectDayByIndex بعد التحميل
    }
  }

  /// يولّد الأيام من اليوم وحتى 30 يوم للأمام
  void loadDays({int days = 30}) {
    isLoadingDays.value = true;
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day); // اليوم بدون وقت
    final end = start.add(Duration(days: days));
    final list = List<DateTime>.generate(
      end.difference(start).inDays + 1,
      (i) => start.add(Duration(days: i)),
    );
    availableDays.assignAll(list);
    isLoadingDays.value = false;
  }

  /// يحدد يوم بناءً على كائن DateTime
  Future<void> selectDay(DateTime day) async {
    final idx = availableDays.indexWhere(
      (d) => d.year == day.year && d.month == day.month && d.day == day.day,
    );
    if (idx == -1) return; // اليوم غير موجود في النطاق
    selectedIndex2.value = idx;
    selectedDay.value = availableDays[idx];
    selectedSlots.clear(); // إعادة تعيين الاختيارات عند تغيير اليوم
    await fetchTimesForDay(availableDays[idx]);
  }

  /// يحدد يوم بواسطة الفهرس (مناسب للـ ListView horizontal لديك)
  Future<void> selectDayByIndex(int index) async {
    if (index < 0 || index >= availableDays.length) return;
    selectedIndex2.value = index;
    selectedDay.value = availableDays[index];
    selectedSlots.clear();
    await fetchTimesForDay(availableDays[index]);
  }

  /// جلب الأوقات من الـ repo (لا نغير الريبو) وتحويلها إلى TimesData
  Future<void> fetchTimesForDay(DateTime day) async {
    isLoadingTimes.value = true;
    availableTimes.clear();

    final dateStr = DateFormat('yyyy-MM-dd').format(day);
    final result = await bookingDataRepo.getTime(dateStr);

    result.when(
      success: (AppResponse response) {
        // نتأكد من بنية الـ response كما في الـ API: data -> items -> [ {uuid, from, to}, ... ]
        if (response.status == true && response.data != null) {
          try {
            final data = response.data as Map<String, dynamic>;
            final items = (data['items'] as List<dynamic>?) ?? [];
            final timesList = items
                .map((e) => TimesData.fromJson(e as Map<String, dynamic>))
                .toList();
            availableTimes.assignAll(timesList);
          } catch (e) {
            // إذا كانت البنية غير متوقعة
            availableTimes.clear();
            print('Error parsing times: $e');
          }
        } else {
          // حالة response.status == false أو data == null
          availableTimes.clear();
        }
      },
      failure: (error) {
        // خطأ في الشبكة أو في التحليل
        availableTimes.clear();
        print('API error fetching times: $error');
      },
    );

    isLoadingTimes.value = false;
  }

  /// تبديل اختيار الوقت (index هو index داخل availableTimes)
  ///
  ///
  // void changeSelect(int index) {
  //   if (selectedSlots.contains(index)) {
  //     selectedSlots.remove(index);
  //   } else {
  //     selectedSlots.add(index);
  //   }
  //   selectedSlots.refresh(); // مهم: حدث الـ observable يدوياً

  //   print('Selected time slots: $selectedSlots');
  // }

  /// اختيار اليوم عن طريق الـ index (متوافق مع UI القديم)
  void changeSelect2(int index) {
    // ليتوافق مع اسم الدالة الموجودة في UI
    selectDayByIndex(index);
  }

  /// مساعدة لعرض نص الوقت في الواجهة مثل "09:00 - 10:00"
  String timeDisplay(int index) {
    if (index < 0 || index >= availableTimes.length) return '';
    final t = availableTimes[index];
    return '${t.from ?? ''} - ${t.to ?? ''}';
  }
}
