import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/about_the_application/widgets/about_the_app_det_widget.dart';
import 'package:dazaha_app/features/user_info/widgets/user_info_app_bar_widget.dart';

class AboutTheApplicationScreen extends StatelessWidget {
  const AboutTheApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        context,
        widget: Text(
          context.aboutTheApp,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: GeneralScreenWidget(
        context,
        wid: [
          verticalSpace(20.h),
          AboutTheAppDetWidget(
            context,
            title: 'شنو هو تطبيقنا؟',
            subTitle:
                'تطبيقنا يخليك توصل أغراضك لأي مكان داخل العراق بسهولة وسرعة. تختار شنو تريد توصله، وين، ومتى، وتحدد السعر اللي يناسبك – وإحنا نرتب الباقي!',
          ),
          AboutTheAppDetWidget(
            context,
            title: 'شنو تگدر توصّل؟',
            subTitle:
                'كلشي تريده: قنفة، طباخ، كرسي، دراجة، جيسان طحين، حتى شغلات صغيرة. أي غرض عندك – أكو ناس جاهزين ياخذوه ويوصلوه بدالك.',
          ),
          AboutTheAppDetWidget(
            context,
            title: 'شلون تشتغل الخدمة؟',
            subTitle:
                'أنت تنزل الطلب، والمساعدين يشوفوه ويردون عليك. تختار الوقت والمكان المناسب، وكلشي يصير من داخل التطبيق، بدون تعب ولا اتصالات.',
          ),
          AboutTheAppDetWidget(
            context,
            title: 'السعر بيدك!',
            subTitle:
                'نعطيك سعر تقريبي يساعدك، وإنت حر تختار السعر اللي تريده. كل ما زدت السعر شوية، زادت فرصتك تلقى ناس يشتغلون أسرع وباحترافية أكثر.',
          ),
          AboutTheAppDetWidget(
            context,
            title: 'ليش تختارنا؟',
            subTitle:
                'لأن الخدمة مرنة، باللهجة القريبة إلك، والأهم: نوصلك بأشخاص حقيقيين جاهزين يساعدوك، بدون تعقيد ولا دوخة راس.',
          ),
        ],
      ),
    );
  }
}
