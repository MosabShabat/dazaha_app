import 'package:dazaha_app/features/document/controller/document_controller.dart';
import 'package:get/get.dart';

class DocumentBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> DocumentController());
  }
}