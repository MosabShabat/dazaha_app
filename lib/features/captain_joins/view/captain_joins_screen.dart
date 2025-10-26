import '../../../core/constant/exports_libraries.dart';
import '../../home/controller/home_controller.dart';
import '../widgets/join_cap_widget.dart';

class CaptainJoinsScreen extends StatelessWidget {
  CaptainJoinsScreen({super.key});
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return JoinCapWidget(context);
  }
}
