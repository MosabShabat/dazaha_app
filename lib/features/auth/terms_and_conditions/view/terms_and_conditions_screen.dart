import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/spacing.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:dazaha_app/core/widgets/def_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DefAppBarWidget(context),
      body: GeneralScreenWidget(
        context,
        wid: [
          Text(
            context.termsAndConditions,
            style: context.textStyles.headlineSmall.extraBold.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),

          verticalSpace(25.h),
          Text(
            '1. المقدمة مرحبًا بك في [اسم التطبيق]! يُرجى قراءة هذه الشروط والأحكام بعناية قبل استخدام التطبيق. من خلال الوصول إلى التطبيق أو استخدامه، فإنك توافق على الالتزام بهذه الشروط والأحكام.',
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),

          verticalSpace(20.h),
          Text(
            '2. التعريفات',
            style: context.textStyles.bodySmall.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          Text(
            'التطبيق : يشير إلى [اسم التطبيق] وجميع الخدمات والميزات المتاحة من خلاله.',
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          Text(
            'المستخدم: أي شخص يقوم باستخدام التطبيق.',
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          Text(
            'المحتوى: يشمل النصوص، الصور، الفيديوهات، البيانات، وغيرها من المواد المتاحة في التطبيق.',
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          verticalSpace(25.h),
          Text(
            '3. استخدام التطبيق',
            style: context.textStyles.bodySmall.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          Text(
            'يجب أن يكون المستخدم بعمر [العمر الأدنى] عامًا على الأقل لاستخدام التطبيق.',
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          Text(
            'يُحظر استخدام التطبيق لأي أغراض غير قانونية أو غير مصرح بها.',
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          Text(
            'يحتفظ التطبيق بحق إيقاف أو تقييد وصول أي مستخدم ينتهك هذه الشروط.',
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),

          verticalSpace(25.h),
          Text(
            '4. الحسابات والأمان',
            style: context.textStyles.bodySmall.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          Text(
            'قد يُطلب من المستخدمين إنشاء حساب للوصول إلى بعض الميزات.',
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          Text(
            'يتحمل المستخدم مسؤولية الحفاظ على سرية معلومات حسابه وكلمة المرور.',
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          Text(
            'يجب إبلاغ إدارة التطبيق فورًا عن أي استخدام غير مصرح به للحساب.',
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          verticalSpace(25.h),
          Text(
            '5. الخصوصية وحماية البيانات',
            style: context.textStyles.bodySmall.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          Text(
            'يتم جمع بيانات المستخدم وفقًا لسياسة الخصوصية الخاصة بنا.',
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),

          Text(
            'باستخدام التطبيق، فإنك توافق على جمع واستخدام معلوماتك كما هو موضح في سياسة الخصوصية.',
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
