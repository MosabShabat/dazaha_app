import 'package:get/get.dart';

class WeAreHereToHelpController extends GetxController {
  final RxList<bool> isExpandedList = List.generate(6, (_) => false).obs;
}
